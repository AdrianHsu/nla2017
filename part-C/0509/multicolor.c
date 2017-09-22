#include <stdio.h>
#include "mex.h"

// AH: this
function colors each vertices using greedy algorithm

// input matrix may or may not have diagonal entries
// *nlevp will contain number of levels
// levptr must be array of length n+1
// p must be array of length n
// This function works on the CSC structure.
// return value 0 indicates success

// this function does not need to use levptr
// colors are 1..maxcolor; color 0 indicates unvisited

static int
multicolor(int n, const mwIndex *ia, const mwIndex *ja,
  int *nlevp, int *levptr, double *color)
{
    int i, j, beg, end, nextbeg, nextend;
    int *visited;
    int nlev;

    nlev = 0;
    levptr[0] = 0;

    // queue
    int *p = (int *) malloc(n*sizeof(int));

    // initialize colors
    for (i=0; i<n; i++)
        color[i] = 0.;

    // process first element
    int first = 0; // arbitrary
    beg = 0;
    end = 0;
    p[end] = first;
    color[first] = 1.;
    end++;

    while (beg < end)
    {
        nlev++;
        levptr[nlev] = end;

        nextbeg = end;
        nextend = end;

        // loop over elements in current level (already in p)
        for (i=beg; i<end; i++)
        {
            int pind = p[i];
            for (j=ia[pind]; j<ia[pind+1]; j++)
            {
                int ind = ja[j];

                // ignore any diagonal entry
                if (pind == ind)
                    continue;

                // if not already visited
                if (color[ind] == 0.)
                {
                    p[nextend] = ind;
                    nextend++;

                    // propose color
                    // kludge on max number of colors
                    double col;
                    for (col=1.; col<10000.; col++)
                    {
                        int jj;
                        int good = 1;
                        for (jj=ia[ind]; jj<ia[ind+1]; jj++)
                        {
                            if (color[ja[jj]] == col)
                            {
                                good = 0;
                                break;
                            }
                        }
                        if (good)
                        {
                            color[ind] = col;
                            break;
                        }
                    }
                }
            }
        }
        beg = nextbeg;
        end = nextend;
    }

    *nlevp = nlev;

    free(p);

    // check that everything was processed (graph was connected)
    if (end != n)
    {
        printf("number of levels %d\n", nlev);
        printf("graph not connected: end: %d for n %d\n", end, n);
        return -1;
    }

    return 0;
}

// colorvec = multicolor(A) where A is a matrix
void
mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int n;
    const mwIndex *ia, *ja;
    const double *a;

    n  = mxGetM (prhs[0]);
    ia = mxGetJc(prhs[0]);
    ja = mxGetIr(prhs[0]);
    a  = mxGetPr(prhs[0]);

    int nlev;
    int *levptr = (int *) malloc((n+1)*sizeof(int));

    plhs[0] = mxCreateDoubleMatrix(n, 1, mxREAL);
    double *color = mxGetPr(plhs[0]);

    multicolor(n, ia, ja, &nlev, levptr, color);

/*
    printf("number of levels: %d\n", nlev);
    int i;
    for (i=0; i<nlev; i++)
        printf("size of level %5d:  %5d\n", i+1, levptr[i+1]-levptr[i]);
*/

    free(levptr);
}

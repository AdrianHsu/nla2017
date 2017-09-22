#include <stdio.h>
#include "mex.h"

// input matrix may or may not have diagonal entries
// *nlevp will contain number of levels
// levptr must be array of length n+1
// p must be array of length n
// This function works on the CSC structure.
// This function works for either L or U matrices.
// return value 0 indicates success

static int
wavefront(int n, const mwIndex *ia, const mwIndex *ja, 
  int *nlevp, int *levptr, int *p)
{
    int i, j, beg, end, nextbeg, nextend;
    int *indegree;
    int nlev;

    nlev = 0;
    levptr[0] = 0;

    indegree = (int *) malloc(n*sizeof(int));

    // compute indegree of each node;
    // this will be used to indicate when node is ready
    for (i=0; i<n; i++)
        indegree[i] = 0;
    for (i=0; i<n; i++)
    {
        for (j=ia[i]; j<ia[i+1]; j++)
        {
            if (ja[j] == i)
                continue; // skip diagonal entry
            indegree[ja[j]]++;
        }
    }

    // find all nodes that have indegree zero;
    // no nodes depend on these nodes
    beg = 0;
    end = 0;
    for (i=0; i<n; i++)
    {
        if (indegree[i] == 0)
        {
            p[end] = i;
            end++;
        }
    }

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

                indegree[ind]--;

                if (indegree[ind] == 0)
                {
                    // put this node on next level
                    p[nextend] = ind;
                    nextend++;
                }
            }
        }
        beg = nextbeg;
        end = nextend;
    }

    *nlevp = nlev;

    free(indegree);

    // check that everything was processed (graph was connected)
    if (end != n)
    {
        printf("number of levels %d\n", nlev);
        printf("graph not connected: end: %d for n %d\n", end, n);
        return -1;
    }

    return 0;
}

// levsch(A) where A is a matrix
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
    int *p      = (int *) malloc(n*sizeof(int));

    wavefront(n, ia, ja, &nlev, levptr, p);

    printf("number of levels: %d\n", nlev);
    printf("first node of first level: %d\n", p[0]+1); // 0-based indexing
    int i;
    for (i=0; i<nlev; i++)
        printf("size of level %5d:  %5d\n", i+1, levptr[i+1]-levptr[i]);

    free(levptr);
    free(p);
}

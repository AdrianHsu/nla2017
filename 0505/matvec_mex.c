// not yet solved: matlab cannot run <omp.h>, but gcc in command line works

#include <omp.h>
#include "matrix.h"
#include "mex.h"

// y = matvec(a, x);
// this program computes y = Ax by parallel commputing

static void
Matvec(int n, const mwIndex *ia, const mwIndex *ja, const double *a,
       const double *x, double *y)
{
    int i, j;
    double t;
// openMP parallel computing
#pragma omp parallel for private(i,j,t)
    for (i=0; i<n; i++)
    {
        t = 0.;
        for (j=ia[i]; j<=ia[i+1]-1; j++)
            t += a[j]*x[ja[j]]; // same as the writing note!
        y[i] = t;
    }
}

// y = matvec(a, x);
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int n;

    if (nrhs != 2)
        mexErrMsgTxt("matvec mex function called with bad number of arguments");

    n = mxGetN(prhs[0]);
    plhs[0] = mxCreateDoubleMatrix(n, 1, mxREAL); // create solution vector

    Matvec(n, mxGetJc(prhs[0]), mxGetIr(prhs[0]), mxGetPr(prhs[0]),
        mxGetPr(prhs[1]), mxGetPr(plhs[0]));
}

// >> mex matvec_mex.c
// Building with 'Xcode with Clang'.
// MEX completed successfully.
// >> a = rand(3, 3);
// >> a
//
// a =
//
//     0.8147    0.9134    0.2785
//     0.9058    0.6324    0.5469
//     0.1270    0.0975    0.9575
//
// >> a = sparse(a)
//
// a =
//
//    (1,1)       0.8147
//    (2,1)       0.9058
//    (3,1)       0.1270
//    (1,2)       0.9134
//    (2,2)       0.6324
//    (3,2)       0.0975
//    (1,3)       0.2785
//    (2,3)       0.5469
//    (3,3)       0.9575
//
// >> x = [1, 2, 3];
//
// >> y = matvec_mex(a, x);
// >> y
//
// y =
//
//     3.0073
//     2.4707
//     4.2448
//

// >> 0.8147 + 0.9058*2 + 0.127 * 3
//
// ans =
//
//     3.0073

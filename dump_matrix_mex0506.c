#include <stdio.h>
#include "mex.h"

// dump_matrix_mex(A) where A is a sparse matrix
// Note: Matlab stores sparse matrices in CSC format with 0-based indexing.
void
mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int n;
    const mwIndex *ia, *ja;
    const double *a;

    printf("sizeof mwIndex: %d\n", sizeof(mwIndex));

    n  = mxGetM (prhs[0]);
    ia = mxGetJc(prhs[0]); // column pointers
    ja = mxGetIr(prhs[0]); // row indices
    a  = mxGetPr(prhs[0]); // values

    int i, j;
    for (i=0; i<n; i++)
        for (j=ia[i]; j<ia[i+1]; j++)
            printf("%5d %5d   %f\n", ja[j]+1, i+1, a[j]);
}

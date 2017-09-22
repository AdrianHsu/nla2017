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

    n  = mxGetM (prhs[0]); // number of columns, 3
    ia = mxGetJc(prhs[0]); // column pointers
    ja = mxGetIr(prhs[0]); // row indices
    a  = mxGetPr(prhs[0]); // values

    int i, j;
    for (i=0; i<n; i++)
        for (j=ia[i]; j<=ia[i+1] - 1; j++)
            printf("%5d %5d   %f\n", ja[j]+1, i+1, a[j]);
}

// >> a = rand(3,3)
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

// >> mex -largeArrayDims dump_matrix_mex.c
// be careful! using sparse matrix should add the flag
// Building with 'Xcode with Clang'.
// MEX completed successfully.

// >> dump_matrix_mex(a)
// sizeof mwIndex: 8
//     1     1   0.814724
//     2     1   0.905792
//     3     1   0.126987
//     1     2   0.913376
//     2     2   0.632359
//     3     2   0.097540
//     1     3   0.278498
//     2     3   0.546882
//     3     3   0.957507

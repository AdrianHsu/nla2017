#include <stdio.h>
#include "mex.h"

/*
 * a = add_mex(b,c), where a,b,c are scalars
 */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    printf("sizeof nlhs: %d\n", nlhs);
    printf("sizeof nrhs: %d\n", nrhs);

    double b = *mxGetPr(prhs[0]);
    double c = *mxGetPr(prhs[1]);

    printf("b: %f\n", b);
    printf("c: %f\n", c);

    double a = b+c;

    plhs[0] = mxCreateDoubleScalar(a);
}

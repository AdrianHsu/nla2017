A = [3 -1 1; -1 6 2; 1 2 7];
b = transpose([1 0 4]);
tol = 0;
x = conjgrad(A, b, tol);
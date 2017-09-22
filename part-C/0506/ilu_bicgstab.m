help ilu;

A = gallery('neumann', 1600) + speye(1600);
setup.type = 'nofill';
a = nnz(A);
b = nnz(lu(A));
c = nnz(ilu(A,setup));
%  This shows that A has 7840 nonzeros, its complete LU factorization has
%      126478 nonzeros, and its incomplete LU factorization with 0 level of
%      fill-in has 7840 nonzeros, the same amount as A.
 
spy(A);

help bicgstab;

n = 21; A = gallery('wilk',n);  b = sum(A,2);
tol = 1e-12;  maxit = 15; M = diag([10:-1:1 1 1:10]);
x = bicgstab(A,b,tol,maxit,M);
figure;
spy(A);
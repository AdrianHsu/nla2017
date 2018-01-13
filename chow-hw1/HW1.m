clear all
close all
format long

load 1138_bus.mat;
A = Problem.A;
A = full(A);%LaplaceM(8192);
n = length(A);
%A = A + 10*eye(n,n);
%A_cn = cond(A)


sol = rand(n,1)-0.5;
b = A*sol;
x = rand(n,1)-0.5;
tol = 1E-5  ;
[y,iter,residhist] = CGmethod(A,b,x,tol);
y;
iter_CG = iter
r_CG = residhist(end)
semilogy(residhist)
hold on 

residhist =[];
[y,iter,residhist] = CGCGmethod(A,b,x,tol);
iter_CGCG = iter
r_CGCG = residhist(end)
semilogy(residhist)
hold on 

residhist = [];
[y,iter,residhist] = PCGMethod(A,b,x,tol);
iter_PCG = iter
r_PCG = residhist(end)
semilogy(residhist)

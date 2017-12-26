clear all
close all

load bcsstk01.mat;
A = Problem.A;
A = full(A);
n = length(A);
b = 10*rand(n,1);
x = rand(n,1)-0.5;
tol = 1E-5;
[y,iter,residhist] = CGearMethod(A,b,x,tol);
y
iter
plot(residhist)
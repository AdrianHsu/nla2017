clear all
close all

load 1138_bus.mat;
A = Problem.A;
A = full(A);
n = length(A);
b = 10*rand(n,1);
x = rand(n,1)-0.5;
tol = 1E-5;
[y,iter,residhist] = PCGMethod(A,b,x,tol);
y
iter
plot(residhist)
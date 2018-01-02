clear all
close all
format long

kmax = 11;
n = 2^kmax - 1; %length(A);
A = gen1d(n);
A = full(A);
y = [0:1/(n+1):1];
y = y(2:end-1)';

period = 8;
w = period*pi;

% b = -w*w*(cos(w*y).*cos(w*y)-sin(w*y)).*exp(sin(w*y));%(w^2)*sin(w*y);
% ex_y = exp(sin(w*y))-1;

b = (w^2)*sin(w*y);
ex_y = sin(w*y);

x = zeros(n, 1);
gs_run = 10;

result = green(A, x, b, gs_run, kmax);
plot(y, ex_y, y, result);
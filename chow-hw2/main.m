clear all
close all
format long

kmax = 9;
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

gs_run = 3;
tol = 1;
x = zeros(n, 1);

i = 0;
while tol > 1e-5

    x = gs(A, x, b, gs_run);
    % return x
    x = green(A, x, b, gs_run, kmax);
    tol = max(abs(b - A*x));
    fprintf('%f\n',tol);
    i = i + 1;
end

fprintf('round: %d\n', i);
plot(y, ex_y, y, x);

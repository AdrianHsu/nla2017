function A = gen1d(n)
% a = gen1d(n)
%  generate 1-D (negative) Laplacian matrix of dimension n
%  e.g., n=63

h = 1/(n+1);
t = ones(n,1)/(h*h);
A = spdiags([-t 2*t -t], -1:1, n, n);
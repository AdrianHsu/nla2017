function x = gs(A, x, b, m)
% x = gs(A, x, b, m)
%  takes m Gauss-Seidel steps

l = tril(A);
for i=1:m
  r = b - A*x;
%   residhist(i) = max(abs(r));
  x = x + l\r;
end

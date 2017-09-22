% m = 4;
% beta = 0.7;
% ax = mat_convdiff(m, beta);
% spy(ax);

function a = mat_convdiff(m, beta)
% a = mat_convdiff(m, beta)
%   Create the finite-difference discretization matrix of a 
%   2D convection-diffusion problem.  Central differences are used.  
% Inputs:
%   m = mesh dimension, e.g., m by m mesh
%   beta = strength of convection term, 0 means no convection 
% Output:
%   a = sparse discretization matrix

h = 1/(m+1);
h2 = h*h;

c1 = zeros(m*m,1);
c2 = zeros(m*m,1);
c3 = zeros(m*m,1);
c4 = zeros(m*m,1);
c5 = zeros(m*m,1);

k = 1;
for j=1:m
    for i=1:m
      c1(k) = -1/h2 - beta/(2*h)*exp(-(j-1)*h * i*h);
      c2(k) = -1/h2 - beta/(2*h)*exp( (i-1)*h * j*h);
      c3(k) =  4/h2;
      c4(k) = -1/h2 + beta/(2*h)*exp( (i+1)*h * j*h);
      c5(k) = -1/h2 + beta/(2*h)*exp(-(j+1)*h * i*h);
      k = k + 1;
    end
end
  
c1 = circshift(c1, -m);
c2 = circshift(c2, -1);
% c3 = circshift(c3, 0);
c4 = circshift(c4,  1);
c5 = circshift(c5,  m);

for i = m:m:m*m
   c2(i) = 0;
   c4(i-m+1) = 0;
end

%  A = spdiags(B,d,m,n) creates an m-by-n sparse matrix from the
%         columns of B and places them along the diagonals specified by d.
%  Example: These commands generate a sparse tridiagonal representation
%     of the classic second difference operator on n points.
%         e = ones(n,1);
%         A = spdiags([e -2*e e], -1:1, n, n)

a = spdiags([c1 c2 c3 c4 c5], [-m,-1,0,1,m], m*m, m*m);
end

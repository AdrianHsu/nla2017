function e = multigrid(A, r)
% e = multigrid(A, r)
%  Take one step of a multigrid method for solving Ae=r

n = length(r);
P = prolong((n-1)/2);
R = 0.5*P';

% relax using zero initial guess and compute e
e = zeros(n,1);
e = gs(A, e, r, 1);

% compute new residual on coarse grid (save old residual)
r2 = R*(r - A*e);

% compute coarse grid matrix
% Galerkin coarse grid operator
%A2 = R*A*P;
% use the following two lines to use rediscretization for coarse grid
m = size(R,1);
A2 = gen1d(m);

if (n > 20)
  % call recursively
  e2 = multigrid(A2, r2);
else
  % exact solve on coarse grid
  e2 = A2 \ r2;
end

% transfer e2 to fine grid and correct fine grid error
e = e + P*e2;

% relax using e as initial guess
e = gs(A, e, r, 1);
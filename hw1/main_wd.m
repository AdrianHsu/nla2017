% A1. example 9.3.1
% problem set a.
% A = [2 1 1; 1 2 1; 1 1 2];
% x0 = [1 -1 2]';


TOL = 1e-5;
maxIter = 100;

% problem set in Example 4, p.597
% A = [4 -1 1; -1 3 -2; 1 -2 3];
% x0 = [1 1 1]';
% A = [0 0; 1 -1];
A = [3 -1 -1 -1; -1 2 -1 0; -1 -1 3 -1; -1 0 -1 2];

x0 = [1 1 1 1]';

[eigval, eigvec] = pm(A, x0, TOL, maxIter);

x = [1;-1; 1];

[u,mu] = wd(A,eigval,eigvec,x,TOL,maxIter);

% B = [3 0 1; 0 4 0; 1 0 3];
% u =
% 
%    -2.0000
%    -1.0000
%     1.0000
% 
% 
% 
% mu =
% 
%     3.0000

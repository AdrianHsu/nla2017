tol = 1e-3;
% problem set a.
A = [2 1 1; 1 2 1; 1 1 2];
x0 = [1 -1 2]';
% % problem set b.
% A = [1 1 1; 1 1 0; 1 0 1];
% x0 = [-1 0 1]';
% % problem set c.
% A = [1 -1 0; -2 4 -2; 0 -1 2];
% x0 = [-1 2 1]';
% % problem set d.
% A = [4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];
% x0 = [1 -2 0 3]';


[mu, x] = pmethod(A, x0, tol, 100000);

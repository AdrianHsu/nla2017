% A3. example 9.3.5
% A5. example 9.3.11

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

% for testing invpmethod
% A = [-4 14 0; -5 13 0; -1 0 2];
% x0 = [1 1 1]';

% [mu, x] = invpmethod(A, x0, tol, 1000);
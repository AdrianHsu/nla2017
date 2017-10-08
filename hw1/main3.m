tol = 1e-3;
% problem set a.
% A = [2 1 1; 1 2 1; 1 1 2];
% x0 = [1 -1 2]';
% % problem set b.
% A = [1 1 1; 1 1 0; 1 0 1];
% x0 = [-1 0 1]';
% problem set c.
% A = [4.75 2.25 -0.25; 2.25 4.75 1.25; -0.25 1.25 4.75];
% x0 = [0 1 0]';
% problem set c.
% A = [4 1 -1 0; 1 3 -1 0; -1 -1 5 2; 0 0 2 4];
% x0 = [0 1 0 0]';

% for testing pmethod, sympmethod
% A = [4 -1 1; -1 3 -2; 1 -2 3];
% x0 = [1 0 0]';

% for testing invpmethod
% A = [-4 14 0; -5 13 0; -1 0 2];
% x0 = [1 1 1]';

% [mu, x] = pmethod(A, x0, tol, 1000);
% [mu, x] = sympmethod(A, x0, tol, 1000);
% [mu, x] = invpmethod(A, x0, tol, 1000);
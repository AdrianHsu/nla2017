% A1. example 9.3.1
% A2. example 9.3.3
% A4. example 9.3.7

tol = 1e-15; % don't care
N = 3;
% problem set a.
A = [2 1 1; 1 2 1; 1 1 2];
x0 = [1 -1 2]';
% % problem set b.
A = [1 1 1; 1 1 0; 1 0 1];
x0 = [-1 0 1]';
% problem set c.
A = [4.75 2.25 -0.25; 2.25 4.75 1.25; -0.25 1.25 4.75];
x0 = [0 1 0]';
% problem set d.
A = [4 1 -1 0; 1 3 -1 0; -1 -1 5 2; 0 0 2 4];
x0 = [0 1 0 0]';

% for testing pmethod, sympmethod
% p.591 Example 2
% A = [4 -1 1; -1 3 -2; 1 -2 3];
% x0 = [1 0 0]';



% [mu, x] = pmethod(A, x0, tol, N);
% [mu, x] = sympmethod(A, x0, tol, N);

% A4
tol = 1e-4;
N = 25;
[mu, x] = pmethod(A, x0, tol, N);
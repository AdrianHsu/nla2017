% A3. example 9.3.5
% A5. example 9.3.11

tol = 1e-10; % don't care
N = 3;
% problem set a.
A = [2 1 1; 1 2 1; 1 1 2];
x0 = [1 -1 2]';
% % problem set b.
A = [1 1 1; 1 1 0; 1 0 1];
x0 = [-1 0 1]';
% % problem set c.
A = [1 -1 0; -2 4 -2; 0 -1 2];
x0 = [-1 2 1]';
% % problem set d.
A = [4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];
x0 = [1 -2 0 3]';



% [mu, x] = sympmethod(A, x0, tol, N);

% A5
tol = 1e-4;
N = 25;

[mu, x] = sympmethod(A, x0, tol, N);
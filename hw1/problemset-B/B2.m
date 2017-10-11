clear;
% clc;

% EXERCISE 2. Download some SPD from UFL collection
% compare the number of non-zeros in Cholesky factors
% using RCM and CM orderings.

Problem = load('b2-dat/1138_bus.mat');

a = Problem(1).Problem.A; % too weird
% a = full(a);

p = cm(a);
% q = p(end : -1 : 1); % change to cm/rcm ordering
q = rcm(a);
a1 = a(p, p);
a2 = a(q, q);
r = chol(a1);
r2 = chol(a2);

nnzr = nnz(r); 
nnzr2 = nnz(r2);

spy(a1);
figure;
spy(a2);


% The Cuthill-McKee algorithm is a greedy algorithm, and doesn't depend too much on the order of A on input. The reverse Cuthill-McKee algorithm is often used to produce nice orders for skyline solvers, and the skyline of the reordered matrix looks indeed quite reasonable. 
% Therefore, symrcm() and my rcm() might have different bandwidth
% https://www.mathworks.com/help/matlab/math/sparse-matrix-operations.html
% https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/lecture-notes/MIT18_335JF10_lec21b_hand.pdf


clear;
% clc;

% FROM LAB01
% E = load('butterfly.txt'); % ChicagoRegional.txt
% A = GraphAdjacency(E);
% L = GraphLaplacian(A);
% a = L;
% a = full(a);

% DEFAULT:
n = 8; % size
g = numgrid('S', n); 
a = delsq(g); 
% % a = full(a);
% spy(a);




% 1. Symmetric RCM (built-in)
% p = symrcm(a); % RESULT: nnzr = 221; nnzr2 = 191

% 2. RCM / CM
% p = rcm(a); % RESULT: nnzr = 221; nnzr2 = 191
% p = cm(a); % RESULT: nnzr = 221; nnzr2 = 191

% 3. Approximate Minimum Degree
% p = amd(a); % RESULT: nnzr = 221; nnzr2 = 168

% 4. Use with symmetric matrices
% p = symamd(a); % RESULT: nnzr = 221; nnzr2 = 168

% 5. Use with nonsymmetric matrices and 
%    symmetric matrices of the form A*A' or A'*A.
% p = colamd(a); % RESULT: nnzr = 221; nnzr2 = 186

% 6. Level Set(Breadth First) ordering
p = bfs(a); % RESULT: nnzr = 221; nnzr2 = 191

% 7. Nested Dissection -> dissect() NOT FOUND
% g2 = nested(n); % RESULT: nnzr = 221; nnzr2 = 191
% a2 = delsq(g2);
% a2 = full(a2);
% p2 = symrcm(a2);
% a2 = a2(p2, p2);

a2 = a(p, p); % for case 1-6
r = chol(a);
r2 = chol(a2); 
nnzr = nnz(r);
nnzr2 = nnz(r2);
spy(a); 
figure;
spy(a2);

% disp(nnzr);
% disp(nnzr2);

% Level Set ordering
% BF ordering
% CM ordering
% RCM ordering -> symRCM(a) 

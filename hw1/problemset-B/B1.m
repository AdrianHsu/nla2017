% https://www.mathworks.com/help/matlab/math/sparse-matrix-operations.html
% https://ocw.mit.edu/courses/mathematics/18-335j-introduction-to-numerical-methods-fall-2010/lecture-notes/MIT18_335JF10_lec21b_hand.pdf
g = numgrid('S', 9); 
a = delsq(g); 
a = full(a);
% spy(a);
% a;

% 1. RCM
% p = symrcm(a); % RESULT: nnzr = 221; nnzr2 = 191

% 2. Nested Dissection -> dissect() NOT FOUND
% Not built into MATLAB


% 3. Approximate Minimum Degree
% p = amd(a); % RESULT: nnzr = 221; nnzr2 = 168

% 4. Use with symmetric matrices
% p = symamd(a); % RESULT: nnzr = 221; nnzr2 = 168

% 5. Use with nonsymmetric matrices and 
%    symmetric matrices of the form A*A' or A'*A.
% p = colamd(a); % RESULT: nnzr = 221; nnzr2 = 186

% 6. Level Set(Breadth First) ordering
[a2, p] = rcm(a);

% a2 = a(p, p);
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

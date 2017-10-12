A = [2 -1  0  0  0  0  0; ...
    -1  2 -1  0  0  0  0; ...
     0 -1  2 -1  0  0  0; ...
     0  0 -1  2 -1  0  0; ...
     0  0  0 -1  2 -1  0; ...
     0  0  0  0 -1  2 -1; ...
     0  0  0  0  0 -1  2];
 
I = eye(7);
% a1 = linsolve(A, [1 0 0 0 0 0 0]');

M = zeros(7, 7);
for i=1:7
    ei = I(:, i);
    mi = mldivide(A, ei);
    M(:, i) = mi;
end

res = (norm(I - A*M, 'fro'))^2;
R = A*M;
disp(R);

disp(M); % M is our answer: least squares approximate inverse of A
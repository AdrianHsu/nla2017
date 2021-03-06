% A7. example 7.6.9

tol = 1e-5;

% problem set 1.
A = zeros(16);
for i = (1:16)
    A(i, i) = 4;
end
i0 = [1 2 3 5 6 7 9 10 11 13 14 15];
for i = (1:length(i0))
    A(i0(i), i0(i) + 1) = -1;
end
i1 = [2 3 4 6 7 8 10 11 12 14 15 16];
for i = (1:length(i1))
    A(i1(i), i1(i) - 1) = -1;
end
for i  = 1:12
    A(i, i + 4) = -1;
end
for i = 5:16
    A(i, i - 4) = -1;
end

b = transpose([1.902207, 1.051143, 1.175689,3.480083,0.819600, -0.264419, ...
    -0.412789, 1.175689,0.913337,-0.150209,-0.264419, 1.051143, ...
    1.966694, 0.913337, 0.819600, 1.902207]);
% 
% problem set 2.
A = zeros(25);
for i = (1:25)
    A(i, i) = 4;
end
i0 = [1 2 3 4 6 7 8 9 11 12 13 14 16 17 18 19 21 22 23 24];
for i = (1:length(i0))
    A(i0(i), i0(i) + 1) = -1;
end
i1 = [2 3 4 5 7 8 9 10 12 13 14 15 17 18 19 20 22 23 24 25];
for i = (1:length(i1))
    A(i1(i), i1(i) - 1) = -1;
end
for i = (1:20)
    A(i, i + 5) = -1;
end
for i = (6:25)
    A(i, i - 5) = -1;
end

b = transpose([1,0,-1,0,2, 1,0,-1,0,2, 1,0, -1,0,2, 1,0, ...
    -1,0,2, 1,0, -1,0,2]);

% % % problem set 3.
A = zeros(40);
for i = (1:40)
    A(i, i) = 2 * i;
end
for i = (1:39)
    A(i, i + 1) = -1;
end
for i = (2:40)
    A(i, i - 1) = -1;
end

b = zeros(40, 1);
for i = (1:40)
    b(i, 1) = 1.5 * i - 6;
end



% test1: Example in textbook
% A = [4 3 0;3 4 -1; 0 -1 4];
% b = [24 30 -24]';
% tol = 1e-3;
% w = 1.25;
% x0 = [1 1 1]';

% test2: this will cause sor() break down! when w > 1.0
% A = [5 -2 3 0 6; -3 9 1 -2 7.4; 2 -1 -7 1 6.7; ...
%     4 3 -5 7 9; 2 3.5 6.1 -4 -8.1];
% b = [-1 2 3 0.5 3.1]';
% tol = 1e-3; % for test only

% [x, iter] = jacobi(A, b, tol);
% [x, iter] = gaussseidel(A, b, tol);
[x, iter] = sor(A, b, tol, 1.1);
% [x, iter] = preconjgrad(A, b, tol);
function [x, iter] = jacobi(A, b, tol)
    
    x0 = zeros(length(b), 1);
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;
    R = L + U;
    Tj = -D\R;
    Cj = D\b;
    normVal = Inf;
    iter = 0;
    while normVal > tol
        x = Tj*x0 + Cj;
        normVal = norm(x - x0, Inf) / norm(x, Inf);
        x0 = x;
        iter = iter + 1;
    end
end

% ref: https://www.mathworks.com/examples/matlab/community/22580-gauss-seidel-method
% function [x, iter] = jacobi(A, b, tol)
%     n = length(A); % if 40x40 -> n = 40
%     x0 = zeros(length(b), 1);
%     x = x0;
%     iter = 0;
%     normVal = Inf;
%     while normVal > tol
%         x0 = x;
%         for i = (1:n)
%             sum = 0;
%             for j = (1:n)
%                 if j ~= i
%                     sum = sum + A(i, j)*x(j);
%                 end
%             end
%             x(i) = (1/A(i, i)) * (b(i) - sum);
%         end
%         
%         iter = iter + 1;
%         normVal = norm(x - x0, Inf) / norm(x, Inf);
%     end
% end
% some self-study notes...
% x10 = [1.0001 1.9998 -0.9998 0.9998]
% x9 = [0.9997 2.0004 -1.0004 1.0006]
% norm(x10 - x9, Inf)
% x10 - x9 = 
%   1.0e-03 *
%    0.4000   -0.6000    0.6000   "-0.8000" -> this one
% Def. The maximum absolute row sum of an m-by-n matrix X (with m,n >= 2)
% Def. vector inf norm: max absolute element
% ans =
%    8.0000e-04

function [x, iter] = gaussseidel(A, b, tol)
    
    x0 = zeros(length(b), 1);
    D = diag(diag(A));
    L = tril(A);
    U = triu(A) - D;
    Tg = -L\U;
    Cg = L\b;
    normVal = Inf;
    iter = 0;
    fileID = fopen('gaussseidel-a7-c.txt','w');
    fprintf(fileID,'%6s %12s %s \n','k','norm', 'x');
    while normVal > tol
        x = Tg*x0 + Cg;
        normVal = norm(x - x0, Inf) / norm(x, Inf);
        fprintf(fileID, '%6.0f %12.6f (%s)\n',iter, normVal, strjoin(cellstr(num2str(x(:))),', '));

        x0 = x;
        iter = iter + 1;
    end
end

% ref: https://www.mathworks.com/examples/matlab/community/22580-gauss-seidel-method
% function [x, iter] = gaussseidel(A, b, tol)
%     n = length(A); % if 40x40 -> n = 40
%     x0 = zeros(length(b), 1);
%     x = x0;
%     iter = 0;
%     normVal = Inf; % init
%     while normVal > tol
%         x0 = x;
%         for i = (1:n)
%             sum = 0;
%             for j=1:i-1
%                 sum = sum + A(i, j) * x(j);
%             end
%             for j=i+1:n
%                 sum = sum + A(i, j) * x0(j);
%             end
%             x(i) = (1/A(i,i)) * (b(i) - sum); 
%         end
%         iter = iter + 1;
%         normVal = norm(x - x0, Inf) / norm(x, Inf);
%     end
% end
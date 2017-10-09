function [x, iter] = sor(A, b, tol, w)

    x0 = zeros(length(b), 1);
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;
    Tw =  (D+w*L) \ ((1 - w)*D - w*U);
    cw = w * ((D+w*L) \ b);
    normVal = Inf;
    iter = 0;
    fileID = fopen('sor-a7-c.txt','w');
    fprintf(fileID,'%6s %12s %s \n','k','norm', 'x');
    while normVal > tol
        x = Tw*x0 + cw;
        normVal = norm(x - x0, Inf) / norm(x, Inf);
        fprintf(fileID, '%6.0f %12.6f (%s)\n',iter, normVal, strjoin(cellstr(num2str(x(:))),', '));

        x0 = x;
        iter = iter + 1;
    end
end

% AH: another code, matrix point of view
% ref: https://www.mathworks.com/examples/matlab/community/22580-gauss-seidel-method
% function [x, iter] = sor(A, b, tol, w)
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
%             x(i) = (w/A(i,i)) * (b(i) - sum);  % only diff from "w"
%         end
%         iter = iter + 1;
%         normVal = norm(x - x0, Inf) / norm(x, Inf);
%     end
% end




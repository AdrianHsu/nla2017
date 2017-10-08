% ref: https://www.mathworks.com/examples/matlab/community/22580-gauss-seidel-method
function [x, iter] = gaussseidel(A, b, tol)
    n = length(A); % if 40x40 -> n = 40
    x0 = zeros(length(b), 1);
    x = x0;
    iter = 0;
    normVal = Inf; % init
    while normVal > tol
        x0 = x;
        for i = (1:n)
            sum = 0;
            for j=1:i-1
                sum = sum + A(i, j) * x(j);
            end
            for j=i+1:n
                sum = sum + A(i, j) * x0(j);
            end
            x(i) = (1/A(i,i)) * (b(i) - sum); 
        end
        iter = iter + 1;
        normVal = norm(x - x0, Inf) / norm(x, Inf);
    end
end
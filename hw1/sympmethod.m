% A = [4 -1 1; -1 3 -2; 1 -2 3];
% x0 = [1 0 0]';
% N = 100000;
% tol = 1e-3;

function [mu, x] = sympmethod(A, x, tol, N)
    k = 1;
    x = x/norm(x, 2);
    while k <= N
        y = A*x;
        mu = x'*y;
        if norm(y, 2) == 0
            break;
        end
        err = norm(x - y/norm(y,2),2);
        x = y/norm(y,2);
        if err < tol
            break;
        end
        k = k + 1;
    end

end
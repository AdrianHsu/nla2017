function [mu, x] = ipm(A, x, tol, N)
    q = (x'*A*x) / (x'*x);
    k = 1;
    n = length(x);
    
    [~, index] = max(abs(x));
    
    x = x./x(index);
    
    while k <= N
        % solve for (A-qI)y = x
        y = (A-q*eye(n))\(x);
        
        mu = y(index);
        [~, index] = max(abs(y));

        err = norm(x - (y./y(index)), Inf);
        x = y./y(index);

        if err < tol
            mu = (1/mu) + q;
            break;
        end
        k = k + 1;
    end
end
function [mu, x] = pmethod(A, x, tol, maxit)

% Step 1.
    k = 1;
    N = maxit; % unused
% Step 2.
    index = 0;
    current_max = -1e10;
    for i = (1:length(x))
        if x(i) > current_max % inf-norm of n-by-1 vector
            current_max = x(i);
            index = i;
        end
    end
% Step 3.
    x = x/x(index);
% Step 4.
    while k <= N
        
        y = A*x; % Step 5.
        mu = y(index); % Step 6.
        % Step 7.
        current_max = -1e10;
        for i = (1:length(y))
            if y(i) > current_max % inf-norm of n-by-1 vector
                current_max = y(i);
                index = i;
            end
        end
        % Step 8.
        if y(index) == 0
            break;
        end
        % Step 9.
        err = norm(x - (y/y(index)), Inf);
        x = y/y(index);
        % Step 10.
        if err < tol
            break;
        end
        k = k + 1;
    end
end

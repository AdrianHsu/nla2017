function [mu, x] = pm(A, x, tol, N)

% Step 1.
    k = 1;

% Step 2.
    [~, index] = max(abs(x));

% Step 3.
    x = x/x(index);
% Step 4.
    
    while k <= N
        
        y = A*x; % Step 5.
        mu = y(index); % Step 6.
        % Step 7.
        [current_max, index] = max(abs(y));

        % Step 8.
        if current_max == 0

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

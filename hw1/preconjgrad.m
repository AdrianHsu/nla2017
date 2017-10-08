function [x, iter] = preconjgrad(A, b, tol)
    x = zeros(length(b), 1);
    D = diag(diag(A));
    invC = D^(-1/2);

    % Step 1.
    r = b - A*x;
    w = invC * r;
    v = invC' * w;
    alpha = sumsqr(w);

    % Step 2.
    k = 1;
    N = 1000000; % not used
    iter = 0;

    % Step 3.
    while iter <= N
        % Step 4.
        if norm(v, Inf) < tol
            break;
        end
        % Step 5.
        u = A*v;
        t = alpha/ sum(v.*u);
        x = x + t*v;
        r = r - t*u;
        w = invC*r;
        beta = sumsqr(w);
        % Step 6.
        if norm(beta, Inf) < tol && norm(r, Inf) < tol
            break;
        end
        % Step 7.
        s = beta/alpha;
        v = invC' * w + s*v;
        alpha = beta;
        iter = iter + 1;
    end
end
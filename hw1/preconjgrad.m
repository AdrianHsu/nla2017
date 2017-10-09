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
    fileID = fopen('precg-a7-c.txt','w');
    fprintf(fileID,'%6s %12s %s \n','k','norm', 'x');
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
        r0 = r;
        r = r - t*u;
        w = invC*r;
        beta = sumsqr(w);
        % Step 6.
        normVal = norm(r , Inf);
        fprintf(fileID, '%6.0f %12.6f (%s)\n',iter, normVal, strjoin(cellstr(num2str(x(:))),', '));

        if norm(beta, Inf) < tol && norm(r , Inf) < tol
            break;
        end
        % Step 7.
        s = beta/alpha;
        v = invC' * w + s*v;
        alpha = beta;
        iter = iter + 1;
    end
end
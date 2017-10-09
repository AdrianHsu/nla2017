function [mu, x] = invpmethod(A, x, tol, N)
    q = (x'*A*x) / (x'*x);
    k = 1;
    n = length(x);
    [~, index] = max(abs(x));
    
    x = x./x(index);
    fileID = fopen('invpmethod-d.txt','w');
    fprintf(fileID,'%6s %12s %s \n','k','mu', 'x');
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
        fprintf(fileID, '%6.0f %12.4f (%s)\n',k, mu, strjoin(cellstr(num2str(x(:))),', '));
        k = k + 1;
    end
    fclose(fileID);
end
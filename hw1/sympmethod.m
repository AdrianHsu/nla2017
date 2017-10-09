function [mu, x] = sympmethod(A, x, tol, N)
    k = 1;
    x = x/norm(x, 2);
    fileID = fopen('sympmethod-test.txt','w');
    fprintf(fileID,'%6s %12s %s \n','k','mu', 'x');
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
        fprintf(fileID, '%6.0f %12.4f (%s)\n',k, mu, strjoin(cellstr(num2str(x(:))),', '));
        k = k + 1;
    end

end
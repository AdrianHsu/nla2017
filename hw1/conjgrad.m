function [x, iter] = conjgrad(A, b, tol, N)
    x = zeros(length(b), 1);
    r = b - A*x;
    v = r;
    iter = 0;

    fileID = fopen('conjgrad-a6-a.txt','w');
    fprintf(fileID,'%6s %12s %s %30s\n','k','norm', 'x', 'r');
    for k = (1:N)
        t = dot(r, r) / dot(v, A*v);
        x = x + t * v;
        r1 = r - t * A*v;
        
        no = norm(r1 - r, Inf);
        fprintf(fileID, '%6.0f %12.4f (%s) (%s)\n',k, no, ...
            strjoin(cellstr(num2str(x(:))), ', '), strjoin(cellstr(num2str(r(:))), ', '));

        if no < tol
            break;
        end
        s = dot(r1, r1) / dot(r, r);
        v = r1 + s * v;
        r = r1;
        iter = iter + 1;
        
    end    

    fclose(fileID);
end



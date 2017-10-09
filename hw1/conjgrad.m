function [x, iter] = conjgrad(A, b, tol)
    x = zeros(length(b), 1);
    r = b - A*x;
    v = r;
    iter = 0;

    for k = (1:numel(b))
        t = dot(r, r) / dot(v, A*v);
        x = x + t * v;
        r1 = r - t * A*v;

        if norm(r1 - r, Inf) < tol
            break;
        end
        s = dot(r1, r1) / dot(r, r);
        v = r1 + s * v;
        r = r1;
        iter = iter + 1;
    end
end



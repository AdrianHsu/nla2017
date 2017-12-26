function [y,iter,residhist] = CGearMethod(A,b,x,tol)
    rk = b - A*x;
    pk = rk;
%     Ark = A*rk;
    alk = (rk'*rk)/(rk'*(A*rk));
    i = 1;
    xk = x;
    beta = 0;
    beta_before = 0;
    p_before = pk;
    while i < 1000 
        xk = xk + alk*pk;
        Apk = A*rk + beta_before*A*p_before;
        rk_1 = rk;
        rk = rk - alk*A*pk;
%         Ark1 = A*rk;
        beta_before = beta;
        beta = (rk'*rk)/(rk_1'*rk_1);
        alk = (rk'*rk)/(((A*rk)'*rk)-(beta_before/alk)*(rk'*rk));
        p_before = pk;
        pk = rk + beta*pk;
        y = xk;
        iter = i;
        i = i + 1;
        residhist(i) = max(abs(rk));
    end
end
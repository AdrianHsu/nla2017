function [y,iter,residhist] = PCGearMethod(A,b,xk,tol)
    rk = b - A*xk;
    pk = rk;
    wk = A*rk;
    sk = A*pk;
    wk = A*rk;
    zk = A*sk;
    i = 1;
    beta = 0;
    al = 0;
    rk_1 = rk;
    beta_1 = beta;
    
    while i < 100
        qk = A*wk;

        if i == 1
            beta = 0;
            al = (rk'*rk)/(wk'*rk);
        else
            beta = (rk'*rk)/(rk_1'*rk_1);
            al = (rk'*rk)/((wk'*rk)-(beta_1/al)*(rk'*rk));
        end
        zk = qk + beta*zk;
        sk = wk + beta*sk;
        pk = rk + beta*pk;
        xk = xk + al*pk;
        rk = rk - al*sk;
        wk = wk - al*zk;
        
        y = xk;
        iter = i;
        residhist(i) = max(abs(rk));
        i = i + 1;
    end
end
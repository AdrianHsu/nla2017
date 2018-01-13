function [y,iter,residhist] = PCGearMethod(A,b,xk,tol,sol)
    rk = b - A*xk;
    wk = A*rk;
    
    pk = 0*rk;
    sk = 0*pk;
    zk = 0*sk;
    
    i = 0;
    al = 0;
    
    while max(abs(rk)) >tol
        %i < 100i < 10000i < length(A)
        qk = A*wk;
        rn = rk'*rk;
        

        if i == 0
            beta = 0;
            al = rn/(wk'*rk);
        else
            %beta_1 = beta;
            beta = rn/(rk_1'*rk_1);
            
            al = 1/(((wk'*rk)/rn) - (beta/al));
            %rn/((wk'*rk)-((beta/al)*rn));
            
        end
        zk = qk + beta*zk;
        sk = wk + beta*sk;
        pk = rk + beta*pk;
        xk = xk + al*pk;
        rk_1 = rk;
        rk = rk - al*sk;
        wk = wk - al*zk;
        
        
        i = i + 1;
        iter = i;
        %ern = (sol-xk)'*A*(sol-xk);
        residhist(i) = max(abs(rk));
        
    end
    y = xk;
end
function [y,iter,residhist] = CGearMethod(A,b,x,tol)
r = b-A*x;
p = r;
iter = 0;
while max(abs(r)) > tol
    al = (r'*r)/(p'*A*p);
    x = x+al*p;
    u = r;
    r = r-al*A*p;
    beta = (r'*r)/(u'*u);
    p = r + beta*p;
    iter = iter +1;
    residhist(iter) = max(abs(r));
    y = x;
end
tol = 1e-3;
% problem set a.
A = [2 1 1; 1 2 1; 1 1 2];
X = [1 -1 2]';
N = 10;
n = 3;
tol = 1e-3;


x=ones(n,1);
count=0;
c=0;
for k=1:N
    x=A\x;
    a=max(abs(x));
    b=max(x);
    if(a==b)
        M=a;
    else
        M=min(x);
    end
    x=rdivide(x,M);
    count=count+1;
    e = 1/M;
    if((e-c)*100/e<tol)
        break;
    end
    c=e;
end
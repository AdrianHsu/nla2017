TOL = 1e-5;
maxIter = 100;
A = [3 -1 -1 -1; -1 2 -1 0; -1 -1 3 -1; -1 0 -1 2];
x0 = [1 1 1 1]';
x = [1; 1; 1];

% A = [0 0; -1 1];
% x0 = [1 1]';
% x = [1];

[eigval, eigvec] = pm(A, x0, TOL, maxIter);


i = 1;
n = length(A);
m = max(abs(eigvec));
B = zeros(n-1);
w = zeros(n,1);
u = zeros(n,1);
% Step 1.
while i<=length(eigvec)
    if abs(eigvec(i)) == m
        break;
    end
    i = i + 1;
end

% Step 2.
if i~=1
    k = 1;
    while k<=(i-1)
        j = 1;
        while j<=(i-1)
            B(k,j) = A(k,j)-(eigvec(k)/eigvec(i))*A(i,j);
            j = j + 1;
        end
        k = k + 1;
    end
end

% Step 3.
if i~=1 && i~=n 
    k = i;
    while k <= n-1 
        j = 1;
        while j <= i-1
            B(k,j) = A(k+1,j)-(eigvec(k+1)/eigvec(i))*A(i,j);
            B(j,k) = A(j,k+1)-(eigvec(j)/eigvec(i))*A(i,k+1);
            j = j + 1;
        end
        k = k + 1;
    end
end
% Step 4.

if i ~= n
    k = i;
    while k <= n-1
        j = i;
        while j <= n-1
            B(k,j) = A(k+1,j+1)-(eigvec(k+1)/eigvec(i))*A(i,j+1);
            j = j + 1;
        end
        k = k + 1;
    end
end

% Step 5.
[mu, wPrime] = pm(B,x,TOL,maxIter);
%     disp(mu);
%     disp(wPrime);

% Step 6.
if(wPrime== -1)
% 		printf("Failed");
    u = -1;
    return;
end

% Step 7.
if i ~= 1
    k = 1;
    while k <= i-1
        w(k) = wPrime(k);

        k = k + 1;
    end
end

% Step 8.
w(i)=0;

% Step 9.
if i ~= n
    k = i+1;
    while k <= n
        w(k) = wPrime(k-1);
        k = k + 1;
    end
end
%     disp(w);

% Step 10.
k = 1;
while k <= n
    j = 1;
    sum = 0;
    while j <= n
        sum = sum + A(i,j)*w(j);
        j = j + 1;
    end
    u(k) = (mu-eigval)*w(k)+(eigvec(k)/eigvec(i))*sum;
    k = k + 1;
end
%     disp(u);



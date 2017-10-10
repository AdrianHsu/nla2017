% clc;
clear;

% graph.txt
% A = [3 -1 -1 -1; -1 2 -1 0; -1 -1 3 -1; -1 0 -1 2];
% A = [7 4 1; 4 4 4; 1 4 7];
% A = [1 2; 2 1];

% WORKS! problem set in Example 4, p.597
A = [4 -1 1; -1 3 -2; 1 -2 3];
x = [1 1 1]';

% WORKS! problem in pdf
% A = [-4 14 0; -5 13 0; -1 0 2];
% x = [1 1 1]';

tol = 1e-8;
N = 10000;
n = length(A);
% x = ones(n,1);

B1 = A;

r0 = 0;
u0 = 0;
x0 = 0;

r = [];
v = [];

for i=1:n
    [r1, u1]=pm(B1,x,10^(-8),100);

% Hotelling Deflation Method
%     x1=u1/norm(u1,2)^2;
    
% Weilandt Deflation Method
    x1=B1(i,:)'/(r1*u1(i));

    tmp = r0*(x0'*u1)*u0;
    v1=(r1-r0)*u1 + tmp;
    r = [r r1];
    v = [v v1];

    if i==n
        break;
    end
    B2=B1-r1*u1*x1'; 
   
    r0 = r1;
    u0 = u1;
    x0 = x1;
    B1 = B2;
end

[V, D] = eig(A);


% v =
% 
%     6.0000    4.0000   -0.0000
%     4.2857    2.0000   -0.0000
%    -1.5000   -4.0000   -1.0000

% r =
% 
%     6.0000    3.0000    2.0000
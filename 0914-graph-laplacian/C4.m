% clc;
clear;


% data should be .tsv file
E = load('cube.txt'); % ChicagoRegional.txt
A0 = GraphAdjacency(E);
A = GraphLaplacian(A0);
A = full(A);
% spy(L);

% A = [3 -1 -1 -1; -1 2 -1 0; -1 -1 3 -1; -1 0 -1 2];
x = rand(length(A), 1); 

tol = 1e-8;
N = 10000;
n = length(A);


B1 = A;

mu0 = 0;
u0 = 0;
x0 = 0;

mu = [];
v = [];

for i=1:n
    [mu1, u1]=pm(B1,x,10^(-8),100);

% Hotelling Deflation Method
%     x1=u1/nomum(u1,2)^2;
    
% Weilandt Deflation Method
    x1=B1(i,:)'/(mu1*u1(i));

    v1=(mu1-mu0)*u1 + mu0*(x0'*u1)*u0;
    mu = [mu mu1];
    v = [v v1];

    if i==n
        break;
    end
    B2=B1-mu1*u1*x1'; 
   
    mu0 = mu1;
    u0 = u1;
    x0 = x1;
    B1 = B2;
end


[V, D] = eig(A);
% ans: mu, v
%% EXAMPLE: try and compare different orderings in MATLAB

g = numgrid('S', 8);
a = delsq(g);
spy(a);
a;
p = symrcm(a);
% spy(p);
% q = amd(a); %approximate minimum degree
a2 = a(p, p); 
r = chol(a);
r2 = chol(a2);
res = nnz(r);
res2 = nnz(r2);

% compare RCM result
[i,j] = find(a);
bw = max(i-j) + 1;
% after RCM
[i2, j2] = find(p);
bw2 = max(i2-j2) + 1;
% bw2 should be less than bw1
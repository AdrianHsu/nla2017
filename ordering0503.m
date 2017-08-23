%% EXAMPLE: try and compare different orderings in MATLAB

g = numgrid('S', 8);
a = delsq(g);
spy(a);
a;
p = symrcm(a); 
q = amd(a); %approximate minimum degree
a2 = a(p, p); 
r = chol(a);
r2 = chol(a2);
nnz(r);
res = nnz(r);
clear;
clc;
E = load('moreno_kangaroo_kangaroo');
A = GraphAdjacency(E);
L = GraphLaplacian(A);
spy(L);
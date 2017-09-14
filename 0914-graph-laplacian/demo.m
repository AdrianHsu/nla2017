clear;
clc;
E = load('graph.txt');
A = GraphAdjacency(E);
L = GraphLaplacian(A);
spy(L);
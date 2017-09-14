clear;
clc;

% data should be .tsv file
E = load('graph.txt'); % ChicagoRegional.txt
A = GraphAdjacency(E);
L = GraphLaplacian(A);
spy(L);
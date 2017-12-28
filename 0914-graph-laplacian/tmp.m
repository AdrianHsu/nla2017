E = load('out.arenas-pgp'); % ChicagoRegional.txt
A = GraphAdjacency(E);
L = GraphLaplacian(A);
a = L;
spy(a);
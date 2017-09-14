function A = GraphAdjacency(E)
n = max(max(E));
A = sparse(E(:,1), E(:,2), 1, n, n);
A = A + A.';
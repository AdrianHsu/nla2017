function [P, pi] = bfs(A, i)

    [n, m] = size(A);                                   % obtain the number of rows and cols of A
    assert(i <= n, 'Specified vertex does not exist');  % confirm chosen index is not more than the matrix size
    pi = [i];                                           % permutation with starting vertex
    count = 1;                                          % initialize counter for the visited nodes
    marked = zeros(n, 1);                               % keep track of the visited nodes
    marked(i) = 1;                                      % mark vertex i has visited 
    S = [i];                                            % initialize level set
    [IA, JA] = csr(A);
    
    while count < n 
        Snew = [];                                      % new empty level set
        
        for i = S                                       % for each node in current level set
            row_start = IA(i);
            row_stop = IA(i+1);
            
            % loop over the adjacency nodes
            for j = row_start:row_stop - 1
                column = JA(j);
                if marked(column) == 0 
                    marked(column) = 1;
                    Snew = [Snew column];
                    pi = [pi column];
                    count = count + 1;
                end   
            end
        end
        S = Snew;                                       % update level set
    end    
    % obtain permutation matrix from pi
    P = zeros(n, n);
    for i = 1:n
        P(i, pi(i)) = 1;
    end
end

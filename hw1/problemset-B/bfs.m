function [pi] = bfs(A)

    i = 1; % pseudo peripheral vertex
    [n, m] = size(A);                                   % obtain the number of rows and cols of A
    assert(i <= n, 'Specified vertex does not exist');  % confirm chosen index is not more than the matrix size
    
    pi = [i];                                           % permutation with starting vertex
    count = 1;                                          % initialize counter for the visited nodes
    marked = zeros(n, 1);                               % keep track of the visited nodes
%     mark i as seen
    marked(i) = 1;                                      % mark vertex i has visited 
    S = [i];                                            % initialize level set
    [IA, JA] = csr(A);
    % IA: row pointer (row) vectors
    % JA: nnz's column index
    
    while count < n 
        Snew = [];                                      % new empty level set        
        for i = S                                       % for each node in current level set
            row_start = IA(i);
            row_stop = IA(i+1);

%           for every neighbors of i, called it j 
%           i.e. in the "same row", all nnzs
            % loop over the adjacency nodes
            for j = row_start:row_stop - 1
                % i.e. nnz in the same row with i
                column = JA(j);

%               if j jas not been seen                
                if marked(column) == 0 
                    marked(column) = 1;
%                   put j in Snew
                    Snew = [Snew column];
                    pi = [pi column];
                    count = count + 1;
                end   
            end
        end
        S = Snew;                                       % update level set
    end    
end

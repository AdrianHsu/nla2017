function [r, n, m] = getLowestDegree(A)
    % set parameters
    [n, m] = size(A); % obtain the number of rows and cols of A
    
    % loop through the rows of A and get the non-zeros
    for i = 1:n
        nz(i) = nnz(A(i, :));
    end
    r = find(nz(:) == min(nz));
end

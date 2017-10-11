function [IA, JA] = csr(A)

    [n, m] = size(A); % square matrix, therfore n == m
    IA = ones(1, n+1); % row vector
    
    for i = 1:n
        nzr = nnz(A(i ,:)); % fix in ith row, see how many nnz columns
        IA(i+1) = nzr;  
        if i == 1
            JA = [find(A(i ,:))]; % where is nonzero, its value? e.g. j = 1, 2, 4
        else
            JA = [JA find(A(i ,:))]; % append it
        end
    end
    IA = cumsum(IA);
    
end

% e.g. a is 8-by-8, and a(1,:) is:
%      4    -1     0    -1     0     0     0     0     0
% find(a(1,:))
% 
% ans =
% 
%      1     2     4
% IA = 0 + 3 = 3 (up to now, 3 nnz in total)

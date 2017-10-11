function [IA, JA] = csr(A)

    [n, m] = size(A); 
    IA = ones(1, n+1);
    
    % for i = 1 to N
    for i = 1:n
        nzr = nnz(A(i ,:));
        IA(i+1) = nzr;  
        if i == 1
            JA = [find(A(i ,:))];
        else
            JA = [JA find(A(i ,:))];
        end
    end
    IA = cumsum(IA);
end
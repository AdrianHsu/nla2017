% a0 = [1 0 0 2 0 3; 4 5 0 0 0 0; 0 6 7 0 0 8; ... 
%     9 0 0 10 11 12; 0 13 0 0 14 0; 0 0 0 0 0 15];

a0 = [10 -3 0 1 0 0; 0 9 6 0 -2 0; 3 0 8 7 0 0; 0 6 0 7 5 4; ...
      0 0 0 0 9 13; 0 0 0 0  5 -1];
% a0 = [1 2; -2 -1];

% n = 4; % size
% g = numgrid('S', n); 
% a0 = delsq(g); 


% a0 = [1 0 0 0 1 0 1 0; 0 1 0 1 0 0 1 0; 0 0 1 0 1 0 0 1; ...
%      0 1 0 1 0 1 0 0; 1 0 1 0 1 0 0 0; 0 0 0 1 0 1 0 0; ...
%      1 1 0 0 0 0 1 0; 0 0 1 0 0 0 0 1];



% n ¡V number of rows in matrix
% p ¡V (array) mapping between original row number and sorted row number
% m ¡V number of columns (max number of nonzeros in anyrow)
% len ¡V (array) length of each column
% a ¡V array of values
% col ¡V corresponding array of column indices

[n, p, m, len, a, col, A] = jaggedDiagonal(a0);

%Write code or pseudocode for multiplying 
% a sparse matrix in JDformat by a dense vector, i.e., y = Ax 

x = ones(n, 1);
y0 = a0*x; % correct answer
% a=jdiag, col=col_ind, p=perm, len=jd_ptr

y = zeros(n, 1);
c = 1;
c0 = 1;
for i=1:length(a)
    y(p(c, 1), 1) = y(p(c, 1), 1) + a(i, 1) * x(col(i, 1), 1);
    c = c + 1;
    if c > len(c0, 1)
        c = 1;
        c0 = c0 + 1;
    end
end


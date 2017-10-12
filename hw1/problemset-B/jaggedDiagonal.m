% n ¡V number of rows in matrix
% p ¡V (array) mapping between original row number and sorted row number
% m ¡V number of columns (max number of nonzeros in anyrow)
% len ¡V (array) length of each column
% a ¡V array of values
% col ¡V corresponding array of column indices
function [n, p, m, len, a, col, a0] = jaggedDiagonal(a)

    mynnz = nnz(a);
    n = length(a);
    b = zeros(n, n);
    J0 = zeros(n, n);
    arr_nnz = zeros(1, n);
    for i = 1:n
        row = a(i, :);
        nnzi = nnz(row);
        arr_nnz(1, i) = nnzi;
        tmp_row = zeros(1, n);
        c = 1;
        for j=1:n
            if row(1, j) ~= 0
                tmp_row(1, c) = row(1, j);
                J0(i, c) = j;
                c = c + 1;
            end

        end
        b(i, :) = tmp_row;
    end

    [~, order] = sort(arr_nnz, 'descend');

    J1 = zeros(n, n);
    for i=1:n

        a(i, :) = b( order(1, i), :);
        J1(i, :) = J0( order(1, i), :);
    end


    mymax = max(arr_nnz);
    val = zeros(mynnz, 1);
    J = zeros(mynnz, 1);
    I = ones(mymax, 1);
    
    mylen = zeros(mymax, 1);

    c = 1;
    for i=1:mymax
        for j=1:nnz(a(:,i))
            val(c, 1) = a(j, i);
            J(c, 1) = J1(j, i);
            c = c + 1;
        end
        
        if i ~= 1
            I(i, 1) = I(i - 1, 1) + nnz(a(:, i - 1));
        end
        mylen(i, 1) = nnz(a(:, i));
    end
    
    n = length(a);
%     p0 = 1:n;
%     p = [p0; order]';
    p = order';
    m = mymax;
    a0  = a;
    a = val;
    len = mylen;% I;
    col = J;
end
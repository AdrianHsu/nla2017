A = numgrid('S',6);
delA = delsq(A);
[M, N] = size(delA); % m should equal to n
Arr = zeros(size(delA)); % arrange
n = N;

for i = 1:M
    ptr = 1;
    for j = 1:N
        if delA(i,j) ~= 0
            Arr(i,ptr) = delA(i,j);
            ptr = ptr + 1;
        end
    end
end

nnzArr = zeros(1,n);
for i = 1:M
    nnzArr(i) = nnz(Arr(i,:));
end
[nnzArr,p] = sort(nnzArr,'descend');
m = max(nnzArr);
len = zeros(1,m);
Arr = Arr(p,:);
for i = 1:m
    len(i) = nnz(Arr(:,i)');
end
a = Arr(Arr~=0);

col = zeros(n,m);
% for i = 1:m
%     for j = 1:len(i)
%         if delA(p(i),j) ~= 0
%             col(ptr) = j;
%             ptr = ptr+1;
%         end
%     end
% end

sortdelA = delA(p,:);
[x,y] = find(sortdelA);
colindices = sortrows([x,y]);
lastcol = 1;
ptr = 1;
for i = 1:size(y)
    if colindices(i,1) > lastcol
        ptr = 1;
        lastcol = colindices(i,1);
    end
    col(colindices(i,1),ptr) = colindices(i,2);
    ptr = ptr+1;
end
col = col(col~=0);
% disp(sortdelA);
disp(n);
disp(p);
disp(m);
% disp(Arr);
disp(len);
disp(a);
disp(col);
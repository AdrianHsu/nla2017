function p = prolong(m)
% return prolongation operator of m columns

p = spalloc(2*m+1, m, 3*m);
for i=1:m
  p(2*i-1 : 2*i+1, i) = [.5; 1; .5];
end
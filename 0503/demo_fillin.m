function demo_fillin(a)

clf
a0 = a;

n = length(a);
for i=1:n-1
  spy(a,'r'); hold on; spy(a0,'b');
  pause;
  a(i+1:end,i+1:end) = a(i+1:end,i+1:end) - a(i+1:end,i)*a(i,i+1:end)/a(i,i);
end

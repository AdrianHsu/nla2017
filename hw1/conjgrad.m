% ref: https://www.mathworks.com/matlabcentral/fileexchange/22494-conjugate-gradient-method?focused=3809602&tab=function
% Repeat Exercise 5 with TOL ¡X 10-3 in the l-inf norm.

tol = 1e-3;
% problem a.
A = [3 -1 1; -1 6 2; 1 2 7];
b = transpose([1 0 4]);
% problem b.
% A = [10 -1 0; -1 10 -2; 0 -2 10];
b = transpose([9 7 6]);
% problem c.
A = [10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b = transpose([6 25 -11 -11]);
% problem d.
A = [4 1 -1 1; 1 4 -1 -1; -1 -1 5 1; 1 -1 1 3];
b = transpose([-2 -1 0 1]);
% problem e.
A = [4 1 1 0 1; 1 3 1 1 0; 1 1 5 -1 -1; 0 1 -1 4 0; 1 0 -1 0 4];
b = transpose([6 6 6 6 6]);
% problem f.
A = [4 -1 0 0 0 0; -1 4 -1 0 0 0; 0 -1 4 0 0 0; 0 0 0 4 -1 0; ...
    0 0 0 -1 4 -1; 0 0 0 0 -1 4];
b = transpose([0 5 0 6 -2 6]);

%% start cg method
x = zeros(length(b), 1);
r = b - A*x;
v = r;

for k = (1:numel(b))
    t = dot(r, r) / dot(v, A*v);
    x = x + t * v;
    r1 = r - t * A*v;
%     display(norm(r1));
    if norm(r1 - r, Inf) < tol
%         display(k);
        break;
    end
    s = dot(r1, r1) / dot(r, r);
    v = r1 + s * v;
    r = r1;
end



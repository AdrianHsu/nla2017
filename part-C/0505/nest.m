%% natural ordering
g = numgrid('S', 63); % try 63, try 7
% 
% g =
% 
%      0     0     0     0     0     0     0
%      0     1     6    11    16    21     0
%      0     2     7    12    17    22     0
%      0     3     8    13    18    23     0
%      0     4     9    14    19    24     0
%      0     5    10    15    20    25     0
%      0     0     0     0     0     0     0


%% nested disection
g2 = nested(63); % try 63, try 7

% >> help nested
%  nested Nested dissection ordering.
%     G = nested(n) generates a nested dissection numbering of an n-by-n grid.

% g2 =
% 
%      0     0     0     0     0     0     0
%      0     3     1    21    13    11     0
%      0     4     2    22    14    12     0
%      0     9    10    23    19    20     0
%      0     7     5    24    17    15     0
%      0     8     6    25    18    16     0
%      0     0     0     0     0     0     0

% 3 1 ...
% 4 2 ...

% 9 10 ... (separator)

% 7 5 ...
% 8 6 ...

% 21~25 is the first separator from central

%% check delsq

a = delsq(g); % natural ordering
a2 = delsq(g2); % nested disection
figure;
spy(a);
figure;
spy(a2); % looks like downward pointing arrows, good for reducing fill-in


% compute a's cholesky factor 
p = amd(a);
r = chol(a(p, p));
figure;
spy(r);
nnz(r);

% compute a2's cholesky factor 
r2 = chol(a2);
figure;
spy(r2);
nnz(r2);
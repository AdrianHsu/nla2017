% Create a graph, and then compute the graph Laplacian matrix.
s = [1 1 1 1 1];
t = [2 3 4 5 6];
G = graph(s,t);
L = laplacian(G);
spy(L);

% the code demonstrates on class cannot run on this computer...
% it seems that requires SIMULINK


% a = laplacian3(10);
% a = tril(a);
% figure;
% spy(a);
% more on;
% levsch(a); % from levsch.c

% expected output should be like this:
% number of levels: 28
% first node of first level: 1
% size of level         1:     1
% size of level         2:     3
% size of level         3:     6
% size of level         4:    10
% size of level         5:    15
% size of level         6:    21
% size of level         7:    28
% size of level         8:    36
% size of level         9:    45
% size of level        10:    55
% size of level        11:    63
% size of level        12:    69
% size of level        13:    73
% size of level        14:    75
% size of level        15:    75
% size of level        16:    73
% size of level        17:    69
% size of level        18:    63
% size of level        19:    55
% size of level        20:    45
% size of level        21:    36
% size of level        22:    28
% size of level        23:    21
% size of level        24:    15
% size of level        25:    10
% size of level        26:     6
% size of level        27:     3
% size of level        28:     1


% http://yifanhu.net/GALLERY/GRAPHS/search.html
load ecology2.mat;
a = Problem.A;
a = tril(a);
figure;
spy(a);
levsch(a);

% number of levels: 1999
% first node of first level: 1
% size of level     1:      1
% size of level     2:      2
% size of level     3:      3
% size of level     4:      4
% size of level     5:      5
% size of level     6:      6
% size of level     7:      7
% size of level     8:      8
% size of level     9:      9
% size of level    10:     10
% size of level    11:     11
% size of level    12:     12
% size of level    13:     13
% size of level    14:     14
% size of level    15:     15
% size of level    16:     16
% size of level    17:     17
% size of level    18:     18
% size of level    19:     19
% size of level    20:     20
% size of level    21:     21
% size of level    22:     22
% size of level    23:     23
% size of level    24:     24
% size of level    25:     25
% size of level    26:     26
% size of level    27:     27
% size of level    28:     28
% size of level    29:     29
% size of level    30:     30
% size of level    31:     31
% ...

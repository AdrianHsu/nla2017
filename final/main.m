w1 = [1,2,3; 4,5,6];
h1 = [1,2;3,4;5,6];
w2 = [1,1,3; 4,5,6];
h2 = [1,1;3,4;5,6];

v = w1*h1;

[w0,h0] = nmf(v, w2, h2, 0.001, 10, 10);
w0
h0
v0 = w0*h0;
v0

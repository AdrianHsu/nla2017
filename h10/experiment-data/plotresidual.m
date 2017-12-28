clear;
clc;
file = '1.txt';
A = load(file);
semilogy(A(:,1),A(:,2),'r.-','MarkerSize',30);
hold on;
title('CG Convergence Curve for \sigma = 1e-7','FontSize',18);
hold off;
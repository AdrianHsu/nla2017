clear;
clc;
file = '4.txt';
A = load(file);
semilogy(A(1:50,1),A(1:50,2),'rx-','MarkerSize',10,'LineWidth',3);
hold on;
file = '5.txt';
A = load(file);
semilogy(A(1:50,1),A(1:50,2),'b.--','MarkerSize',30,'LineWidth',3);
file = '6.txt';
A = load(file);
semilogy(A(1:50,1),A(1:50,2),'g.-','MarkerSize',30);
% file = 'GMRESresidual.txt';
% A = load(file);
% semilogy(A(1:50,1),A(1:50,2),'k.-','MarkerSize',30);
title('GMRES Convergence Curve with different restart number for \sigma = 1e-7','FontSize',18);
legend('10','20','30');
hold off;
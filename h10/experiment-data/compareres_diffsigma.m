clear;
clc;
file = '30.txt';
A = load(file);
semilogy(A(1:45,1),A(1:45,2),'rx-','MarkerSize',10,'LineWidth',3);
hold on;
file = '31.txt';
A = load(file);
semilogy(A(1:45,1),A(1:45,2),'b.--','MarkerSize',30,'LineWidth',3);
file = '32.txt';
A = load(file);
semilogy(A(1:45,1),A(1:45,2),'g.-','MarkerSize',30);
file = '33.txt';
A = load(file);
semilogy(A(1:45,1),A(1:45,2),'k.-','MarkerSize',30);
title('Comparison of BICGSTAB Convergence Curve with precond ILU for different \sigma','FontSize',18);
legend('1e-3','1e-5','1e-7','1e-9');
hold off;
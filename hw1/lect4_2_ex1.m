A =[-4    14     0
    -5    13     0
    -1     0     2];

%
B1=A;
% Hotelling Method:
%
% [xsol,rv,flag,k]=PowerMethod(B1,ones(3,1),10^(-8),100);
% r1=rv(k+1);
% u1=xsol;
% x1=u1/norm(u1,2)^2;
% B2=B1-r1*u1*x1';

% [xsol,rv,flag,k]=PowerMethod(B2,ones(3,1),3,10^(-8),100);
% r2=rv(k+1);
% u2=xsol;
% x2=u2/norm(u2,2)^2;
% B3=B2-r2*u2*x2';
% [xsol,rv,flag,k]=PowerMethod(B3,ones(3,1),3,10^(-8),100);
% r3=rv(k+1);
% u3=xsol;
% [r1 r2 r3]
% %
% % Wielandt Method
% %
% [xsol,rv,flag,k]=PowerMethod(B1,ones(3,1),3,10^(-8),100);
% r1=rv(k+1);
% u1=xsol;
% x1=B1(1,1:3)'/(r1*u1(1));
% B2=B1-r1*u1*x1';
% [xsol,rv,flag,k]=PowerMethod(B2,ones(3,1),3,10^(-8),100);
% r2=rv(k+1);
% u2=xsol;
% x2=B2(2,1:3)'/(r2*u2(2));
% B3=B2-r2*u2*x2';
% [xsol,rv,flag,k]=PowerMethod(B3,ones(3,1),3,10^(-8),100);
% r3=rv(k+1);
% u3=xsol;
% [r1 r2 r3]
% %
% % Compute eigenvector
% %
[xsol,rv,flag,k]=PowerMethod(B1,ones(3,1),10^(-8),100);
r1=rv(k+1);
u1=xsol;
x1=B1(1,1:3)'/(r1*u1(1));
v1=u1;
B2=B1-r1*u1*x1';
[xsol,rv,flag,k]=PowerMethod(B2,ones(3,1),10^(-8),100);
r2=rv(k+1);
u2=xsol;
x2=B2(2,1:3)'/(r2*u2(2));
v2=(r2-r1)*u2+r1*(x1'*u2)*u1;
B3=B2-r2*u2*x2';
[xsol,rv,flag,k]=PowerMethod(B3,ones(3,1),10^(-8),100);
r3=rv(k+1);
u3=xsol;
v3=(r3-r2)*u3+r2*(x2'*u3)*u2;
[r1 r2 r3]
[A*v1-r1*v1 A*v2-r2*v2 A*v3-r3*v3]
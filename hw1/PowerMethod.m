function [xsol,lambda,flag,iter]=PowerMethod(A,x,tol,N)

xv(:,1)=x/norm(x,Inf);
iter=1;
flagct=0;
while flagct==0
      y=A*xv(:,iter);
      absy=abs(y);
      [r,I]=max(absy);
      rv(iter)=y(I);
      xv(:,iter+1)=y/y(I);
      xn(iter)=norm(xv(:,iter+1)-xv(:,iter),Inf);
      if xn(iter)>tol
          iter=iter+1;
          if iter>N
              flagct=1;
              flag=1;
              lambda = rv(k+1);
              disp('Power Method does not converge in N iterations')
          end
      else
          xsol=xv(:,iter+1);
          lambda=rv(iter);
          flagct=1;
          flag=0;
          iter=iter-1;
          disp('Power Method converges')
      end
end
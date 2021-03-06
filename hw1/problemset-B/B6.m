A = [2 -1  0  0  0  0  0; ...
    -1  2 -1  0  0  0  0; ...
     0 -1  2 -1  0  0  0; ...
     0  0 -1  2 -1  0  0; ...
     0  0  0 -1  2 -1  0; ...
     0  0  0  0 -1  2 -1; ...
     0  0  0  0  0 -1  2];
 
% a1 = linsolve(A, [1 0 0 0 0 0 0]');

% factorized least squares approximate inverse

tol = 0.42000; % parameter

% function M = spai(A,tol)

[m, n] = size(A);
M = zeros(m,n);

for k = 1:n 
    J = k;
    
    I0 = eye(7);
    e = I0(:,k);
    I = find(A(:, J));
    
    mk = mldivide(A(:,J), e);
    
    r = A(:,J)*mk - e;    
    r2 = norm(r,2);

    while r2 > tol
        
        [~, L] = find(A( abs(r) ~= 0,:));
        
        Jh = setdiff(unique(L),J);  % Jh(j) == e_j
        
        
        rTAej = r'*A(:,Jh);  
        rho = zeros(length(Jh),1);
        for j = 1:length(Jh)
            rho(j) = sqrt( r2^2 - (rTAej(j)/norm(A(:,Jh(j)), 2))^2);
        end             
        
        newJ = Jh(abs(rho-min(rho)) == 0);        
        J = [J;newJ(:)];
        J = unique(J);
        
        mk = A(:,J)\e;
        
        r = A(:,J)*mk - e; 
        r2 = norm(r,2);   
    end    
    M(J,k) = mk;
end

for i = 1:n
    for j = 1:n
        if A(i,j) == 0
            M(i, j) = 0;
        end
    end
end


I = eye(7);
res = (norm(I - A*M, 'fro'))^2;
R = A*M;
% disp(R);
% disp(M); % M is our answer: least squares approximate inverse of A
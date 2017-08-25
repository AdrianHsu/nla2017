Problem = load('apache2.mat');
% Problem = 
% 
%   struct with fields:
% 
%       name: 'GHS_psdef/apache2'
%      title: 'SPD matrix (finite difference 3D) from APACHE small'
%          A: [715176กั715176 double]
%         id: 1423
%       date: '2006'
%     author: ''
%         ed: 'N. Gould, Y. Hu, J. Scott'
%       kind: 'structural problem'
     
a = Problem.A;
spy(a); % very, very banded, since it's too large matrix


%% Exercise: download some SPD from UFL collection
% compare the number of non-zeros in Cholesky factors using RCM/CM ordering

p = symrcm(a);
q = p(end:-1,1); % reverse ordering
r = chol(a(p,p)); %compute Cholesky factor
nnz(r);
r2 = chol(a(q,q));
nnz(r2);

% Use spy() to compare the visualize patterns
% for RCM, it should have less fill-in compared to CM
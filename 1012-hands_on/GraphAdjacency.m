function A = GraphAdjacency(E, option)
% option: 'simple'  (default) : simple graph 
%         'directed'          : directed (multi) graph
%         'weighted'          : directed weighted graph
%         'uw'                : undirected weighted graph

n = max(max(E));
if nargin < 2
    if size(E, 2) == 3
        option = 'uw';
    else
        option = 'simple';
    end
end

switch option
    case 'simple'
        %A = sparse(E(:), [E(:,2); E(:,1)], 1, n, n);
        %A = spones(A);
        A = sparse(E(:,1),E(:,2),1,n,n);
        A = A + A.';
    case 'directed'
        A = sparse(E(:,1), E(:,2), 1, n, n);
    case 'weighted'
        A = sparse(E(:,1), E(:,2), E(:,3), n, n);
    case 'uw'
        A = sparse(E(:,1), E(:,2), E(:,3), n, n);
        A = A + A.';
end

%{
function A = GraphAdjacency(E,varargin)
% option: 'simple'  (default) : simple graph 
%         'directed'          : directed (multi) graph
%         'weighted'          : directed weighted graph

n = max(max(E(:,1:2)));
if nargin < 2
    if size(E, 2) == 3
        option = 'weighted';
    else
        option = 'simple';
    end
else
    option = varargin{1};
end

switch option
    case 'simple'
        A = sparse(E(:), [E(:,2); E(:,1)], 1, n, n);
        A = spones(A);
    case 'directed'
        A = sparse(E(:,1), E(:,2), 1, n, n);
    case 'weighted'
        A = sparse(E(:,1), E(:,2), E(:,3), n, n);
end
%}
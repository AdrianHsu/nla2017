a = load('uni1');
a = sparse(a(:,1),a(:,2),a(:,3));
keep = find(sum(spones(a))>1);
a = a(keep,keep);

color = multicolor(a);
% ?? can't run

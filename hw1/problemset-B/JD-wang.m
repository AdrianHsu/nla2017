function ANS = JD( n,p,m,len,a,col,x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    ANS = zeros(n,1);
    for i = 1:m
        ptr = 1;
        if i > 1
            for k = 1:i-1
                ptr = ptr + len(k);
            end
        end
        for j = 1:len(i)
            ANS(p(j)) = ANS(p(j)) + a(ptr) * x(col(ptr));
            ptr = ptr + 1;
        end
    end
end


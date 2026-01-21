function [x,y] = findp(psi,Xgrid,Ygrid,p)

n = length(Xgrid);
m = length(Ygrid);
x = [];
y = [];

for i=1:n
    for j=2:m
        if(((psi(j-1,i) <= p) && (psi(j,i) > p)) || ((psi(j-1,i) >= p) && (psi(j,i) < p)))
            x = [x,Xgrid(i)];
            Q = abs(p - psi(j,i));
            P = abs(p - psi(j-1,i));
            dy = Ygrid(j) - Ygrid(j-1);
            y = [y,Ygrid(j-1)+Q*dy/(P+Q)];
        end
    end
end

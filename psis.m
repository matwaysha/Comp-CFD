function M = psis(x0,y0,L,Xgrid,Ygrid)

% Ygrid столбец
% Xgrid строка

n = length(Ygrid);
m = length(Xgrid);

Y = Ygrid.*ones(n,m) - y0.*ones(n,m);
X = Xgrid.*ones(n,m) - x0.*ones(n,m);

M = L.*atan2(Y,X)/(2*pi);



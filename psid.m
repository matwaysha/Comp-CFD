function M = psid(x0,y0,k,Xgrid,Ygrid)

% Ygrid столбец
% Xgrid строка

n = length(Ygrid);
m = length(Xgrid);

Y = Ygrid.*ones(n,m) - y0.*ones(n,m);
X = Xgrid.*ones(n,m) - x0.*ones(n,m);

M = -k.*Y./(2*pi*(X.^2 + Y.^2));
function M = psif(U,a,Xgrid,Ygrid)

% Ygrid столбец
% Xgrid строка

n = length(Ygrid);
m = length(Xgrid);

Y = Ygrid.*ones(n,m);
X = Xgrid.*ones(n,m);

M = U.*(Y.*cosd(a) - X.*sind(a));




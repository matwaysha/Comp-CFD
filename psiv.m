function M = psiv(x0,y0,G,Xgrid,Ygrid)

% Ygrid столбец
% Xgrid строка

n = length(Ygrid);
m = length(Xgrid);

Y = Ygrid.*ones(n,m) - y0.*ones(n,m);
X = Xgrid.*ones(n,m) - x0.*ones(n,m);

M = G.*log(sqrt((X).^2 + (Y).^2))./(2.*pi);
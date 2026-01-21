function w = flow1(U,a,xp,yp,Xgrid,Ygrid)

n = length(Ygrid);
m = length(Xgrid);

Y = Ygrid.*ones(n,m);
X = Xgrid.*ones(n,m);

Z = X + 1i*Y - xp - 1i*yp;
w = U.*(Z + a.*a./Z + 1i.*2.*yp.*log10(Z./a));
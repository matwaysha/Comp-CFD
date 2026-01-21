clear
clc
fi = linspace(0,359,1000);
a = 1.1;
px = 0.14;
py = 0.25;
b = 0.9;
U = 1;
y = a.*sind(fi)+py;
x = a.*cosd(fi)+px;
lx = 3*a;
ly = 3*a;

[xpr,ypr] = Jk(x,y,b);

n = 1000;
x0 = n/2+px/(2*lx)*1000;
y0 = n/2+py/(2*ly)*1000;


Xgrid = linspace(-lx,lx,n);
Ygrid = linspace(-ly,ly,n);

w = flow1(U,a,px,py,Xgrid,Ygrid');

psi = imag(w);

[X, Y] = meshgrid(1:n, 1:n);

k = a/(2*lx)*1000;

p = [-2.498,-1.963,-1.391,-0.838,-0.427,-0.153,0.062,0.399,0.897,1.478,2.051,2.603];
    
    % Создаем маску окружности
    circle_mask = ((X - x0).^2 + (Y - y0).^2) <= k^2;
    
    % Заполняем область внутри окружности NaN
    psi(circle_mask) = NaN;


[x1,y1] = findp(psi,Xgrid,Ygrid,p(1));
[x2,y2] = findp(psi,Xgrid,Ygrid,p(2));
[x3,y3] = findp(psi,Xgrid,Ygrid,p(3));
[x4,y4] = findp(psi,Xgrid,Ygrid,p(4));
[x5,y5] = findp(psi,Xgrid,Ygrid,p(5));
[x6,y6] = findp(psi,Xgrid,Ygrid,p(6));
[x7,y7] = findp(psi,Xgrid,Ygrid,p(7));
[x8,y8] = findp(psi,Xgrid,Ygrid,p(8));
[x9,y9] = findp(psi,Xgrid,Ygrid,p(9));
[x10,y10] = findp(psi,Xgrid,Ygrid,p(10));
[x11,y11] = findp(psi,Xgrid,Ygrid,p(11));
[x12,y12] = findp(psi,Xgrid,Ygrid,p(12));


[xpl1,ypl1] = Jk(x1,y1,b);
[xpl2,ypl2] = Jk(x2,y2,b);
[xpl3,ypl3] = Jk(x3,y3,b);
[xpl4,ypl4] = Jk(x4,y4,b);
[xpl5,ypl5] = Jk(x5,y5,b);
[xpl6,ypl6] = Jk(x6,y6,b);
[xpl7,ypl7] = Jk(x7,y7,b);
[xpl8,ypl8] = Jk(x8,y8,b);
[xpl9,ypl9] = Jk(x9,y9,b);
[xpl10,ypl10] = Jk(x10,y10,b);
[xpl11,ypl11] = Jk(x11,y11,b);
[xpl12,ypl12] = Jk(x12,y12,b);

figure (1)

plot(xpr,ypr)
hold on
plot(xpl1,ypl1,'-k','LineWidth',0.7)
plot(xpl2,ypl2,'-k','LineWidth',0.7)
plot(xpl3,ypl3,'-k','LineWidth',0.7)
plot(xpl4,ypl4,'-k','LineWidth',0.7)
plot(xpl5,ypl5,'-k','LineWidth',0.7)
plot(xpl6,ypl6,'-k','LineWidth',0.7)
plot(xpl7,ypl7,'-k','LineWidth',0.7)
plot(xpl8,ypl8,'-k','LineWidth',0.7)
plot(xpl9,ypl9,'-k','LineWidth',0.7)
plot(xpl10,ypl10,'-k','LineWidth',0.7)
plot(xpl11,ypl11,'-k','LineWidth',0.7)
plot(xpl12,ypl12,'-k','LineWidth',0.7)
axis equal

figure (2)
contourf(Xgrid,Ygrid,psi,30)
hold on
plot(x5,y5)
axis equal
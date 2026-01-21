clear
clc
n = 17;
m = 25;
h = 0.25;
ksi = 10;
xmin = -3;
xmax = 3;
ymin = -2;
ymax = 2;
ermax = 0.0001;
maxcount = 2000;
x0 = 1;
y0 = 1;
ig = 0.5;

Xgrid = linspace(xmin,xmax,m);
Ygrid = linspace(ymin,ymax,n);


q = zeros(m,n);
q(floor((x0-xmin)/h +1),floor((y0-ymin)/h)+1) = -ksi;

%% Richardson

er = 0;
count = 0;
fnew = zeros(m,n);
f = ig.*ones(m,n);
f(1,:) = 0;
f(end,:) = 0;
f(:,1) = 0;
f(:,end) = 0;

while(((er > ermax) || (count == 0)) && (count < maxcount))
    for i=2:m-1
        for j=2:n-1
            fnew(i,j) = 0.25.*(f(i-1,j) + f(i+1,j) + f(i,j+1) + f(i,j-1)) - 0.25.*h.*h.*q(i,j);
        end
    end

    er = sum(sum(abs(fnew-f)));
    f = fnew;
    count = count + 1;
end

f = flipud(fliplr(f)');

figure (1)

contourf(Xgrid,Ygrid,f,30);
axis equal
title(['Richardson, count = ', num2str(count, '%.f')])

%% Liebmann

er = 0;
count = 0;
fnew = zeros(m,n);
f = ig.*ones(m,n);
f(1,:) = 0;
f(end,:) = 0;
f(:,1) = 0;
f(:,end) = 0;

while(((er > ermax) || (count == 0)) && (count < maxcount))
    for i=2:m-1
        for j=2:n-1
            fnew(i,j) = 0.25.*(fnew(i-1,j) + f(i+1,j) + fnew(i,j-1) + f(i,j+1)) - 0.25.*h.*h.*q(i,j);
        end
    end

    er = sum(sum(abs(fnew-f)));
    f = fnew;
    count = count + 1;
end

f = flipud(fliplr(f)');

figure (2)

contourf(Xgrid,Ygrid,f,30);
axis equal
title(['Liebmann, count = ', num2str(count, '%.f')])

%% Successive overrelaxation

er = 0;
count = 0;
a = cos(pi/m) + cos(pi/n);
w = (8 - 4.*sqrt(4 - a.*a))./(a.*a)
fnew = zeros(m,n);
f = ig.*ones(m,n);
f(1,:) = 0;
f(end,:) = 0;
f(:,1) = 0;
f(:,end) = 0;

while(((er > ermax) || (count == 0)) && (count < maxcount))
    for i=2:m-1
        for j=2:n-1
            fnew(i,j) = f(i,j) + w.*0.25.*(fnew(i-1,j) + f(i+1,j) + fnew(i,j-1) + f(i,j+1) - 4.*f(i,j) - h.*h.*q(i,j));
        end
    end

    er = sum(sum(abs(fnew-f)));
    f = fnew;
    count = count + 1;
end

f = flipud(fliplr(f)');

figure (3)

contourf(Xgrid,Ygrid,f,30);
axis equal
title(['Successive overrelaxation, count = ', num2str(count, '%.f')])


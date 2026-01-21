clear
clc
n = 9;
m = 25;
h = 0.25;
xmin = -3;
xmax = 3;
ymin = 0;
ymax = 2;
ermax = 0.0001;
maxcount = 2000;

ig = 0.5;

Xgrid = linspace(xmin,xmax,m);
Ygrid = linspace(ymin,ymax,n);

er = 0;
count = 0;
fnew = zeros(m,n);
f = ig.*ones(m,n);

f(1,:) = 1;
f(:,1) = 0;
f(:,end) = 1;
f(10:16,2) = 0;
f(10:16,3) = 0;
f(11:15,4) = 0;
f(13,5) = 0;
fnew(:,end) = 1;
fnew(1,:) = 1;
fnew(1,1) = 0;

while(((er > ermax) || (count == 0)) && (count < maxcount))
    for i=2:m
        for j=2:n-1
            if(j > 5)
                if(i == 25)
                    fnew(i,j) = 0.25.*(2.*fnew(i-1,j) + fnew(i,j-1) + f(i,j+1));
                else
                    fnew(i,j) = 0.25.*(fnew(i-1,j) + f(i+1,j) + fnew(i,j-1) + f(i,j+1));
                end
            elseif(((i - 13)^2 + (j - 1)^2) <= 4^2)
                fnew(i,j) = f(i,j);
            elseif((i < 13) && (((i + 1 - 13)^2 + (j - 1)^2) <= 4^2))
                a = h;
                d = h;
                b = (13 - i)*h - sqrt(1 - ((j - 1)*h).^2);
                c = (j - 1)*h - sqrt(1 - ((13 - i)*h).^2);
                fnew(i,j) = (fnew(i-1,j)/(a*(a+d)) + f(i+1,j)/(b*(c+d)) + fnew(i,j-1)/(c*(c+d)) + f(i,j+1)/(d*(c+d)))./(1/(a*d)+1/(c*d));
            elseif((i > 13) && (((i - 1 - 13)^2 + (j - 1)^2) <= 4^2))
                a = (i - 13)*h - sqrt(1 - ((j - 1)*h).^2);
                d = h;
                b = h;
                c = (j - 1)*h - sqrt(1 - ((13 - i)*h).^2);
                fnew(i,j) = (fnew(i-1,j)/(a*(a+d)) + f(i+1,j)/(b*(c+d)) + fnew(i,j-1)/(c*(c+d)) + f(i,j+1)/(d*(c+d)))./(1/(a*d)+1/(c*d));
            elseif(i < 25)
                fnew(i,j) = 0.25.*(fnew(i-1,j) + f(i+1,j) + fnew(i,j-1) + f(i,j+1));
            else
                fnew(i,j) = 0.25.*(2.*fnew(i-1,j) + fnew(i,j-1) + f(i,j+1));
            end
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
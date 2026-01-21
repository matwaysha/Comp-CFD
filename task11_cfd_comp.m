clear
clc
m = 51;
h = 0.02;
n = 50;
u = zeros(m,n);
u(:,1) = 0;
u(1,:) = 0;
i = linspace(11,31,31 - 11 +1)';
u(11:31,1) = sin(5*pi*((i-1)*h - 0.2));
u(2:m-1,2) = 0.5*(u(1:m-2,1) + u(3:m,1));
u(m,2) = u(m-1,1);
a = 340;
tau = h/a;
xgrid = linspace(0,1,m);


for j=3:n
    for i=2:m
        if(i == m)
            u(i,j) = 2*u(i-1,j-1) - u(i,j-2);
        else
            u(i,j) = u(i-1,j-1) + u(i+1,j-1) - u(i,j-2);
        end
    end
end

figure (1)
sgtitle('Одномерное волновое уравнение')

subplot(4,1,1)
plot(xgrid,u(:,1))
title(sprintf('t = 0 c'));
ylabel('u, м/с')
xlabel('x, м')
subplot(4,1,2)
plot(xgrid,u(:,16))
title(sprintf('t = %.d c',tau*16));
ylabel('u, м/с')
xlabel('x, м')
subplot(4,1,3)
plot(xgrid,u(:,35))
title(sprintf('t = %.d c',tau*35));
ylabel('u, м/с')
xlabel('x, м')
subplot(4,1,4)
plot(xgrid,u(:,45))
title(sprintf('t = %.d c',tau*45));
ylabel('u, м/с')
xlabel('x, м')








clear
clc

m = 30;
M = 1/m*ones(1,m/2);
X = zeros(1,m/2);
X = linspace(-1+1/m,1-1/m,m);
X = X(m/2 + 1:end);


Y = zeros(1,m/2);
G = sqrt(1-(X + M).^2) - sqrt(1-(X - M).^2);
y_0 = [X,Y];
T_max = 0.25;
[t,y] = ode45(@(t,y) vort_str(t,y,m,G),[0 T_max],y_0);

n = length(t);

figure (1)
sgtitle('Вихревая пелена за эллиптическим крылом')

subplot(4,1,1)
plot(y(1,1:m/2),y(1,m/2+1:m),'*k')
title(sprintf('t = 0 c'));
ylabel('y')
xlabel('x')
subplot(4,1,2)
plot(y(floor(n/3),1:m/2),y(floor(n/3),m/2+1:m),'*k')
title(sprintf('t = %.d c',t(floor(n/3))));
ylabel('y')
xlabel('x')
subplot(4,1,3)
plot(y(floor(2*n/3),1:m/2),y(floor(2*n/3),m/2+1:m),'*k')
title(sprintf('t = %.d c',t(floor(2*n/3))));
ylabel('y')
xlabel('x')
subplot(4,1,4)
plot(y(end,1:m/2),y(end,m/2+1:m),'*k')
title(sprintf('t = %.d c',t(end)));
ylabel('y')
xlabel('x')



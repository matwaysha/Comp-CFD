T_max = 0.5;
h = 0.01;

opts = odeset('MaxStep',h);

[t,y] = ode45(@Sph_fall,[0 T_max],[0,0.00001],opts);

[t1,y1] = ode_cust(@Sph_fall,[0 T_max],[0,0.00001],h);

figure 1
plot(t, -1.*y(:,1),'r*')
hold on
plot(t1,-1.*y1(:,1),'b.')
grid on
grid minor

xlabel('t, s')
ylabel('z, m')
title('Всплытие шарика для пингпонга')
legend('ode45','ode cust')

figure 2
plot(t, -1.*y(:,2),'r*')
hold on
plot(t1,-1.*y1(:,2),'b.')
grid on
grid minor

xlabel('t, s')
ylabel('v, m')
title('Всплытие шарика для пингпонга')
legend('ode45','ode cust')


a = 45;
V_0 = 50;
u_f = 0;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/3*2);
plot(y(:,1),y(:,3),'k.')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 45^o u_f = 0 m/s', ...
%     'Color', 'k', 'FontSize', 11, 'VerticalAlignment', 'bottom');
grid on
grid minor
hold on

a = 30;
V_0 = 50;
u_f = 0;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/3*2);
plot(y(:,1),y(:,3),'k.--')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 30^o u_f = 0 m/s', ...
%     'Color', 'k', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 60;
V_0 = 50;
u_f = 0;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/3*2);
plot(y(:,1),y(:,3),'k.-')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 60^o u_f = 0 m/s', ...
%     'Color', 'k', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 45;
V_0 = 50;
u_f = 20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/5*4);
plot(y(:,1),y(:,3),'b.')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 45^o u_f = 20 m/s', ...
 %    'Color', 'b', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 30;
V_0 = 50;
u_f = 20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/5*4);
plot(y(:,1),y(:,3),'b.--')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 30^o u_f = 20 m/s', ...
%     'Color', 'b', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 60;
V_0 = 50;
u_f = 20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/5*4);
plot(y(:,1),y(:,3),'b.-')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 60^o u_f = 20 m/s', ...
    % 'Color', 'b', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 45;
V_0 = 50;
u_f = -20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/7*4);
plot(y(:,1),y(:,3),'r.')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 45^o u_f = -20 m/s', ...
   %  'Color', 'r', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 30;
V_0 = 50;
u_f = -20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/7*4);
plot(y(:,1),y(:,3),'r.--')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 30^o u_f = -20 m/s', ...
   %  'Color', 'r', 'FontSize', 11, 'VerticalAlignment', 'bottom');

a = 60;
V_0 = 50;
u_f = -20;
v_f = 0;
T_max = 6;
T_prev = 4;
T_inc = 1;
y_0 = [0, V_0.*cosd(a), 0, V_0.*sind(a)];
[t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);
y_prev = y(end,3);

while true

    [t,y] = ode45(@(t,y) Sph_shot(t,y,u_f,v_f),[0 T_max],y_0);

    if (abs(y(end,3)) < 0.05)&&(y(end,4) < 0)
        break
    end

    if (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev < 0)
        T_max = T_max - T_inc;
    elseif (y(end,3) > 0)&&(y_prev > 0)
        T_max = T_max + T_inc;
    elseif (y(end,3) < 0)&&(y(end,4) < 0)&&(y_prev > 0)
        T_max = T_max - T_inc/2;
    elseif (y(end,3) > 0)&&(y_prev < 0)
        T_max = T_max + T_inc/2;
    end

    T_inc = abs(T_max - T_prev);
    T_prev = T_max;
    y_prev = y(end,3);

end

figure (1)

mid_idx = round(length(t)/7*4);
plot(y(:,1),y(:,3),'r.-')
%text(y(mid_idx,1), y(mid_idx,3), '\theta = 60^o u_f = -20 m/s', ...
    % 'Color', 'r', 'FontSize', 11, 'VerticalAlignment', 'bottom');

xlabel('x, m')
ylabel('y, m')
title('Trajectory for steel spherical projectile, d = 0.05 m, V_0 = 50 m/s')
legend('\theta = 45^o u_f = 0 m/s','\theta = 30^o u_f = 0 m/s','\theta = 60^o u_f = 0 m/s','\theta = 45^o u_f = 20 m/s','\theta = 30^o u_f = 20 m/s',...
'\theta = 60^o u_f = 20 m/s','\theta = 30^o u_f = -20 m/s','\theta = 60^o u_f = -20 m/s')

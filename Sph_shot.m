function dydt = Sph_shot(t,y,u_f,v_f)

d = 0.05;
nu = 1.49e-5;
ro_f = 1.22;
ro_b = 8000;
ro = ro_f/ro_b;
g = 9.81;
w_r = sqrt((u_f-y(2)).^2 + (v_f-y(4)).^2);

dydt = zeros(4,1);

dydt(1) = y(2);
dydt(2) = 3.*ro./(4.*d).*Cd_sph(w_r,d,nu).*(u_f - y(2)).*w_r./(1 + 0.5.*ro);
dydt(3) = y(4);
dydt(4) = (-(1 - ro).*g + 3.*ro./(4.*d).*Cd_sph(w_r,d,nu).*(v_f - y(4)).*w_r)./(1 + 0.5.*ro);
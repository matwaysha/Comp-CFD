function dydt = Sph_fall(t,y)

d = 0.036;
nu = 1e-6;
ro_f = 1000;
ro_b = 1.22;
ro = ro_f/ro_b;
g = 9.81;
A = 1 + 0.5.*ro;
B = (1 - ro).*g;
C = 3.*ro./(4.*d);

dydt = [y(2); (B - C.*y(2).*abs(y(2)).*Cd_sph(y(2),d,nu))./A];

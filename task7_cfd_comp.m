clear
clc
n = 10;
fi = linspace(9/10*pi,1/10*pi,n-1);
a = 0.1;
r = a.*sin(fi);
z = a.*cos(fi);

z0 = -a;
l = 2.*a;
U = 20;

Zmin = -3.*a;
Zmax = 3.*a;
Rmin = 0;
Rmax = 3.*a;
Nz = 2000;
Nr = 1000;

[psi,Ur,Uz] = Karman0(U,z',r',z0,l,Zmin,Zmax,Nz,Rmin,Rmax,Nr);

Zgrid = linspace(Zmin,Zmax,Nz);
Rgrid = linspace(Rmin,Rmax,Nr);

contourf(Zgrid,Rgrid,psi,30)
axis equal

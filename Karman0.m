function [psi,Ur,Uz] = Karman0(U,z,r,z0,l,Zmin,Zmax,Nz,Rmin,Rmax,Nr)

% z,r - столбцы

n = length(z) +1;

R = 0.5.*r.*r;
rr = r.*r.*ones(n-1,n);
zz = z.*ones(n-1,n);
zs = linspace(z0.*0.8,(z0+l).*0.8, n+1);
zs1 = zs(1:end-1).*ones(n-1,n);
zs2 = zs(2:end).*ones(n-1,n);

d = sqrt(rr + (zz - zs1).^2) - sqrt(rr + (zz - zs2).^2);
R = [R;0];
h = zs(2) - zs(1);
h = h.*ones(1,n);
d = [d;h];

Q = inv(d)*R;

Zgrid = linspace(Zmin,Zmax,Nz).*ones(Nr,Nz);
Rgrid = linspace(Rmin,Rmax,Nr)'.*ones(Nr,Nz);

Zgrid = setValuesBelowSurfaceToNaN(Zgrid, linspace(Zmin,Zmax,Nz), linspace(Rmin,Rmax,Nr), z, r, z0, l);
Rgrid = setValuesBelowSurfaceToNaN(Rgrid, linspace(Zmin,Zmax,Nz), linspace(Rmin,Rmax,Nr), z, r, z0, l);

D = zeros(Nr,Nz);

for i=1:n
    D = D + Q(i).*U.*(-sqrt(Rgrid.*Rgrid + (Zgrid - zs(i).*ones(Nr,Nz)).^2) + sqrt(Rgrid.*Rgrid + (Zgrid - zs(i+1).*ones(Nr,Nz)).^2));
end


psi = 0.5.*U.*Rgrid.*Rgrid + D;

Ur = zeros(Nr,Nz);

for i=1:n
    Ur = Ur - U.*Q(i)./Rgrid.*((Zgrid - zs(i+1).*ones(Nr,Nz))./sqrt(Rgrid.*Rgrid + (Zgrid - zs(i+1).*ones(Nr,Nz)).^2) - (Zgrid - zs(i).*ones(Nr,Nz))./sqrt(Rgrid.*Rgrid + (Zgrid - zs(i).*ones(Nr,Nz)).^2));
end

Uz = zeros(Nr,Nz);

for i=1:n
    Uz = Ur + Q(i).*(1./sqrt(Rgrid.*Rgrid + (Zgrid - zs(i+1).*ones(Nr,Nz)).^2) - 1./sqrt(Rgrid.*Rgrid + (Zgrid - zs(i).*ones(Nr,Nz)).^2));
end

Uz = U.*(ones(Nr,Nz) + Uz);

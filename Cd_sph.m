function Cd = Cd_sph(v, d, nu)

Re = v.*d./nu;

if(Re <= 1)
    Cd = 24./Re;
elseif((Re > 1)&&(Re <= 400))
    Cd = 24./((Re).^0.646);
elseif((Re > 400)&&(Re <= 3e5))
    Cd = 0.5;
elseif((Re > 3e5)&&(Re <= 2e6))
    Cd = 0.000366.*((Re).^0.4275);
else
    Cd = 0.18
end


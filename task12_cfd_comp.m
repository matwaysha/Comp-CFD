m = 101;
n = 55;
gamma = 1.4;
h = 0.02;
a0 = 340;
tau = 0.5*h/a0;
u = zeros(m,n);
a = zeros(m,n);
i1 = linspace(1,13,13 - 1 +1)';
i2 = linspace(14,39,39 - 14 +1)';
i3 = linspace(40,51,51 - 40 +1)';

u(1:13,1) = a0/2*(i1-1)/12;
u(14:39,1) = a0/2*(26-i2)/13;
u(40:51,1) = a0/2*(i3-51)/12;

a(:,1) = a0 + (gamma-1)/2.*u(:,1);

% ub = u(i,j) - tau/h*(u(i,j) - a(i,j))*(u(i+1,j) - u(i,j));
% ab = a(i,j) - tau/h*(u(i,j) - a(i,j))*(a(i+1,j) - a(i,j));
% ua = u(i,j) + tau/h*(u(i,j) + a(i,j))*(u(i-1,j) - u(i,j));
% aa = a(i,j) + tau/h*(u(i,j) + a(i,j))*(a(i-1,j) - a(i,j));

for j=1:n-1
    for i=1:m
        if(i == 1)
            u(i,j+1) = 0;
            ub = u(i,j) - tau/h*(u(i,j) - a(i,j))*(u(i+1,j) - u(i,j));
            ab = a(i,j) - tau/h*(u(i,j) - a(i,j))*(a(i+1,j) - a(i,j));
            a(i,j+1) = ab - (gamma-1)/2*ub;
        elseif(i == m)
            ua = u(i,j) + tau/h*(u(i,j) + a(i,j))*(u(i-1,j) - u(i,j));
            aa = a(i,j) + tau/h*(u(i,j) + a(i,j))*(a(i-1,j) - a(i,j));
            u(m,j+1) = ua + 2/(gamma-1)*(aa - a0);
            a(m,j+1) = a0;
        else
            ub = u(i,j) - tau/h*(u(i,j) - a(i,j))*(u(i+1,j) - u(i,j));
            ab = a(i,j) - tau/h*(u(i,j) - a(i,j))*(a(i+1,j) - a(i,j));
            ua = u(i,j) + tau/h*(u(i,j) + a(i,j))*(u(i-1,j) - u(i,j));
            aa = a(i,j) + tau/h*(u(i,j) + a(i,j))*(a(i-1,j) - a(i,j));
            u(i,j+1) = 0.5*(ua+ub) + 1/(gamma-1)*(aa-ab);
            a(i,j+1) = (gamma-1)/4*(ua-ub) + 0.5*(aa+ab);
        end
        if((tau/h*abs(u(i,j+1)+a(i,j+1)) > 1) || (tau/h*abs(u(i,j+1)-a(i,j+1)) > 1))
            break
        end
    end
end

plot(u(:,10))

    


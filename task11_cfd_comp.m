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


for j=3:n
    for i=2:m
        if(i == m)
            u(i,j) = 2*u(i-1,j-1) - u(i,j-2);
        else
            u(i,j) = u(i-1,j-1) + u(i+1,j-1) - u(i,j-2);
        end
    end
end


plot(u(:,16))





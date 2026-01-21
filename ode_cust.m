function [t,y] = ode_cust(fun,T_span,Y0,h)

n = ceil(T_span(end)/h);

t = [linspace(T_span(1),n*h,n+1)]';

y = Y0;

for i = 2:n+1
    d1z = h.*y(i-1,2);
    y_temp = [y(i-1,1),y(i-1,2)];
    dydt = fun(t(i-1),y_temp);
    d1v = h.*dydt(2);
    d2z = h.*(y(i-1,2) + 0.5*d1v);
    y_temp = [y(i-1,1),y(i-1,2) + 0.5*d1v];
    dydt = fun(t(i-1),y_temp);
    d2v = h.*dydt(2);
    d3z = h.*(y(i-1,2) + 0.5*d2v);
    y_temp = [y(i-1,1),y(i-1,2) + 0.5*d2v];
    dydt = fun(t(i-1),y_temp);
    d3v = h.*dydt(2);
    d4z = h.*(y(i-1,2) + d3v);
    y_temp = [y(i-1,1),y(i-1,2) + d3v];
    dydt = fun(t(i-1),y_temp);
    d4v = h.*dydt(2);

    z = y(i-1,1) + 1/6.*(d1z + 2.*d2z + 2.*d3z + d4z);
    v = y(i-1,2) + 1/6.*(d1v + 2.*d2v + 2.*d3v + d4v);
    y_temp = [z, v];
    y = [y;y_temp];
end


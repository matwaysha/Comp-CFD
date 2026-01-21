function dydt = vort_str(t,y,m,G) 

dydt = zeros(40,1);
G_t = [-1.*fliplr(G),G];
Y_t = [fliplr(y(m/2+1:end)'),y(m/2+1:end)'];
X_t = [-1*fliplr(y(1:m/2)'),y(1:m/2)'];

for i = 1:m/2
    X_dt = G_t.*(Y_t(m/2 + i) - Y_t)./((X_t(m/2 + i) - X_t).^2 + (Y_t(m/2 + i) - Y_t).^2);
    Y_dt = -1.*G_t.*(X_t(m/2 + i) - X_t)./((X_t(m/2 + i) - X_t).^2 + (Y_t(m/2 + i) - Y_t).^2);
    dydt(i) = sum(X_dt,'omitnan');
    dydt(m/2+i) = sum(Y_dt,'omitnan');
end


    

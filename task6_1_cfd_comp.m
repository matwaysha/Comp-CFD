n = 1000;

Xgrid = linspace(-1,1,n);
Ygrid = linspace(-1,1,n);

U = 10;
a = 0;
L = 10;
k = 10;
g = 30;
X0 = 1e-6;
Y0 = 0;
x0 = 500;
y0 = 500;


M1 = psif(U,a,Xgrid,Ygrid');
M2 = psid(X0,Y0,k,Xgrid,Ygrid');
M3 = psiv(X0,Y0,g,Xgrid,Ygrid');

M = M1+M2+M3;

[X, Y] = meshgrid(1:n, 1:n);

k = 200;
    
    % Создаем маску окружности
    circle_mask = ((X - x0).^2 + (Y - y0).^2) <= k^2;
    
    % Заполняем область внутри окружности NaN
    M(circle_mask) = NaN;

contourf(Xgrid,Ygrid,M,30)
axis square;

% % Устанавливаем логарифмическую шкалу для colorbar
% caxis([min(M(:)), max(M(:))]); % задаем диапазон
% colormap(jet); % или другая цветовая карта
% h = colorbar;
% 
% % Делаем шкалу логарифмической
% set(gca, 'ColorScale', 'log'); % MATLAB R2018b и новее


m = 60;
M = 1/m*ones(1,m/2);
X = zeros(1,m/2);
X = linspace(-1+1/m,1-1/m,m);
X = X(m/2 + 1:end);
%             factor = 1.3;
%             geo = zeros(1, m+2);
%             geo(1) = 0;
%             for j = 2:m+2
%                 geo(j) = geo(j-1) + factor^(j-2);
%             end
%             X = 1 - geo ./ geo(end);
%             X = fliplr(X);
%             t_uniform = linspace(0,1,m/2+1);
%             k = 3;
%             X_t = 1 - (exp(k * t_uniform) - 1) / (exp(k) - 1);
%             X_t = fliplr(X_t);
% 
%             for i=1:m/2
%                 M(i) = (X_t(i+1)-X_t(i))/2;
%                 X(i) = X_t(i) + M(i);
%             end


Y = zeros(1,m/2);
G = sqrt(1-(X + M).^2) - sqrt(1-(X - M).^2);
y_0 = [X,Y];
T_max = 0.35;
[t,y] = ode45(@(t,y) vort_str(t,y,m,G),[0 T_max],y_0);


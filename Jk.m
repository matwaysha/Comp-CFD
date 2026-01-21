function [x,y] = Jk(X,Y,b)

Z = X + 1i*Y;
z = Z + b^2./Z;
x = real(z);
y = imag(z);

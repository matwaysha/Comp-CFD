function [M,C] = msist(f0,flast,A,B,D,n,h,x0)

%Матрицу кншн можно не выводить, а выводить только диагонали, но тут
%вопрос памяти не стоит, как я понимаю

M = zeros(n,n);
x = linspace(x0+h,x0+n*h,n);
a1 = ones(1,n);
b1 = ones(1,n);
d1 = ones(1,n);
a = A(x).*a1;
b = B(x).*b1;
d = D(x).*d1;

C1 = 1 - h.*a./2;
C2 = -2 + h.*h.*b;
C3 = 1 + h.*a./2;
C4 = h.*h.*d;

C4(1) = C4(1) - f0.*C1(1);
C4(n) = C4(n) - flast.*C3(n);

C = C4';

M(1,1) = C2(1);
M(1,2) = C3(1);
M(n,n-1) = C1(n);
M(n,n) = C2(n);

for i = 2:n-1
    M(i,i-1) = C1(i);
    M(i,i) = C2(i);
    M(i,i+1) = C3(i);
end


function f = gatri(M,C)

%Матрицу кншн можно не вводить, а вводить только диагонали, но тут
%вопрос памяти не стоит, как я понимаю

n = length(C);

for i=2:n-1
    M(i,i) = M(i,i)*M(i-1,i-1) - M(i,i-1)*M(i-1,i);
    M(i,i+1) = M(i,i+1)*M(i-1,i-1);
    C(i) = C(i)*M(i-1,i-1) - M(i,i-1)*C(i-1);
    M(i,i-1) = 0;
end

f = zeros(1,n);

f(n) = (C(n)*M(n-1,n-1) - M(n,n-1)*C(n-1))/(M(n,n)*M(n-1,n-1) - M(n,n-1)*M(n-1,n));

for i=n-1:-1:1
    f(i) = (C(i) - M(i,i+1)*f(i+1))/M(i,i);
end

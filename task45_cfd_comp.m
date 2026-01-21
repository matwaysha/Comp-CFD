A = @(x) 1./x;
B = @(x) 0;
D = @(x) 9.*x;
n = 100;
x0 = 1;
xl = 4;
h = (xl - x0)/(n+1);
f0 = 1;
flast = 64-24*log(4);

[M,C] = msist(f0,flast,A,B,D,n,h,x0);

tic;
f = gatri(M,C);
toc

f = [f0,f,flast];
x = linspace(x0,xl,n+2);

F = x.^3 - 24.*log(x);

tic;
ff = cholenons(M,C);
toc
ff = [f0;ff;flast];

plot(x,f)
hold on
plot(x,F)
plot(x,ff)
function [] = fmin()
ans1 = [];
th = [0.2 0.4 0.6 0.8 1.0 1.2 1.4];
tm = [2.01 2.03 2.05 2.09 2.05 2.18 2.28];
ans1 = [];
a = 0;
b = pi/2;
for tht = th
    f = @(x,tht)(1 - ((sin(tht/2))^2 * (sin(x))^2))^(-.5);
    h = 0.0001;
    mt = [a+h:h:b-h];
    ans = 0;
    ans = ans + h*f(a,tht)/2 + h*f(b,tht)/2;
    for i = mt
        ans = ans + h*(f(i,tht));
    end
    ans1 = [ans1,ans];
end
ans1;
% expfn = @(p,xd) p(1)*exp(p(2)*xd);  %define exponential function
% errfn = @(p) sum((expfn(p,x)-y).^2);  %define sum-squared error
s = @(g) ( (16*(ans1(1)^2/g) - tm(1)^2)^2 + (16*(ans1(2)^2/g) - tm(2)^2)^2 + (16*(ans1(3)^2/g) - tm(3)^2)^2+ (16*(ans1(4)^2/g) - tm(4)^2)^2 +(16*(ans1(5)^2/g) - tm(5)^2)^2 + (16*(ans1(6)^2/g) - tm(6)^2)^2 + (16*(ans1(7)^2/g) - tm(7)^2) );
%opt = optimset ( "Display" , "iter" );
x = fminsearch( s, 10)















function [] = intgl(a,b)
f = inline('sin(x)');
h = 0.01;
mt = [a+h:h:b-h];
ans = 0;
ans = ans + h*f(a)/2 + h*f(b)/2;
for i = mt
    ans = ans + h*(f(i));
end
f1 = inline('cos(x)');
f3 = inline('-cos(x)');

fprintf('Intergral using no correction : %f\n', ans);

% Using Euler-McClaurin Integration rule.
% One correction term

ans = ans + (h^2/12)*(f1(a)-f1(b));

fprintf('Intergral using one correction : %f\n', ans);

% Two correction terms

ans = ans - (h^4/720)*(f3(a) - f3(b));

fprintf('Intergral using two corrections : %f\n', ans);
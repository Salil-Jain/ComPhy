function [ans] = intgl(a,b)
f = inline('sin(x)');
h = 0.01;
mt = [a+h:h:b-h];
ans = 0;
ans = ans + h*f(a)/2 + h*f(b)/2;
for i = mt
    ans = ans + h*(f(i));
    
end

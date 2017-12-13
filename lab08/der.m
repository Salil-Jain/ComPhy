function [y] = der(x)
fun = @(x) x*exp(x);
h = 0.0001;
forw = (fun(x+h) - fun(x))/h;
back = (fun(x) - fun(x-h))/h;
cent = (fun(x+h) - fun(x-h))/(2*h);
rich = (-fun(x+2*h) + 8*fun(x+h) - 8*fun(x-h) + fun(x-2*h))/(12*h);
%forw
%back
%cent
%rich

for power = [-9:1:0]
    h1 = 10^power;
    e1 = h1/2*(2*exp(x) + x*exp(x));
    plot(log(h1),log(e1),'*');
    hold on
    
    e2 = h1/2*(2*exp(x) + x*exp(x));
    plot(log(h1),log(e2),'*');
    hold on
    
    e3 = (h1.^2)/6 * (3*exp(x) + x*exp(x));
    plot(log(h1),log(e3),'*');
    hold on;
    
    e4 = (h1.^4)/30 * 5*exp(x) + x*exp(x);
    plot(log(h1),log(e4),'*');
    hold on;
end
hold off
end

function [y] = fun(x)
y =  x*exp(x);
end


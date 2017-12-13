% a and b are lower and upper limit for integration
function [] = int1(a,b)
x1 = [];
f = inline('exp(x)');
err1 = [];
err2 = [];
for pwr = [1:1:10]
    h = (b-a)/2^(pwr);
    mt = [a+h:h:b-h];
    answ1 = 0;
    answ2 = 0;
    answ1 = answ1 + h*f(a)/2 + h*f(b)/2;
    for i = mt
        answ1 = answ1 + h*(f(i));
    end
    answ2 = answ2 + h*f(a)/3 + h*f(b)/3;
    iter = 1;
    for i = mt
        if mod(iter,2)
            answ2 = answ2 + 4*h*(f(i))/3;
        else
            answ2 = answ2 + 2*h*(f(i))/3;
        end
        iter = iter+1;
    end
    fprintf('Number of intervals : %f | Intergral1 : %f | Integral 2 : %f\n', 2^(pwr), answ1,answ2);
    x1 = [x1,log(2^pwr)];
    err1 = [err1 , log(abs(exp(b) - exp(a) - answ1))];
    err2 = [err2 , log(abs(exp(b) - exp(a)  - answ2))];
    %err1 = log(err1);
    %err2 = log(err2);
end
plot(x1,err1);
hold on;
plot(x1,err2);
hold off;



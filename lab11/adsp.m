%global I2;
%I2 = 0;
function [ans] = adsp(a,b)
ans = 0;
f = @(x) sin(1/x);
h = (b-a)/2;
q = (a+b)/2;
I = h/3*(f(a) + 4*f(q) + f(b));
eps = 0.01;
I1 = h/6*(f(a) + 4*f((a+q)/2)+ f(q)) + h/6*(f(q) + 4*f((q+b)/2) + f(b));
if(abs(I - I1)>eps*15)
    adsp(a,q);
    fprintf("%f %f %f\n",a,q,b);
    adsp(q,b);
    %fprintf("%f %f\n",q,b);
else
    I1;
    ans = ans+I1;
    % return I1;
end
end
% Uses secant method to find optimum E.
% E1 and E2 are initial values for secant method entered by user.

function [E] = Root(E1, E2)
xL = -5;
xR = 5;
m1 = SM(xL, xR, E1)
m2 = SM(xL, xR, E2)

%tol = 1e-4;
err = 10;
while err>10e-2
    E3 = E2 - m2*(E2 - E1)/(m2 - m1);
    err = SM(xL,xR,E3);
    E2 = E3;
    E1 = E2;
    m2 = err;
    m1 = m2;
end

err
E = E2
end


function [p] = SM(xL, xR, E)

func1 = @(x,y,z) z;
func2 = @(x,y,z) (E-x*exp(-x^2))*y;

tol = 1e-4;
h = 1e-1;
y_sum = 0;
z_sum = 0;

for k = xL:h:(xR+xL)/2
    x0 = k;
    y0 = 2;
    z0 = 2;
    x1 = x0 + h;
    y1 = y0 + h*func1(x0,y0,z0);
    z1 = z0 + h*func2(x0,y0,z0);
    y2 = y0 + (h/2)*(func1(x0,y0,z0) + func1(x1,y1,z1));
    z2 = z0 + (h/2)*(func2(x0,y0,z0) + func2(x1,y1,z1));
    %y_sum = y_sum + h*y2;
    %z_sum = z_sum + h*z2;
    Y1 = y2;
    Z1 = z2;
end

for k = xR:-h:(xR+xL)/2
    x0 = k;
    y0 = 2;
    z0 = 2;
    x1 = x0 - h;
    y1 = y0 - h*func1(x0,y0,z0);
    z1 = z0 - h*func2(x0,y0,z0);
    y2 = y0 - (h/2)*(func1(x0,y0,z0) + func1(x1,y1,z1));
    z2 = z0 - (h/2)*(func2(x0,y0,z0) + func2(x1,y1,z1));
    %y_sum = y_sum + h*y2;
    %z_sum = z_sum + h*z2;
    Y2 = y2;
    Z2 = z2;
end

p = Y2*Z1 - Y1*Z2;


end


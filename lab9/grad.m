function [] = grad()

alpha = 0.0001;
iter = 0;
x_in = 2;
y_in = 0;
fx = @(x,y) (-2 + 2*x - 400*x*y + 400*x^3);
fy = @(x,y) (200*(y-x^2));
tol = 1e-9;
while ((fx(x_in,y_in))^2>tol&&(fy(x_in,y_in))^2>tol)
    errx = alpha*fx(x_in,y_in);
    erry = alpha*fy(x_in,y_in);
    x_in = x_in - errx;
    y_in = y_in - erry;
    iter = iter+1;
    
end
fprintf("Root at x = %d and y = %d\n",x_in,y_in);
%size(xmat)
%size(ymat)
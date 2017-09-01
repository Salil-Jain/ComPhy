function [J] = jac(x,y)


%J = [1 1; 0 2*y];


x1 = 2*cos(x) + cos(x+y);
x2 = cos(y) + cos(x+y);
y1 = cos(x) + cos(x+y);
y2 = 2*cos(y)*(-1) + cos(x+y);
J = [x1 x2; y1 y2];
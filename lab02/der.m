function [y] = der(x)
y = -sin(x) + 50*((cos(x)*x-sin(x))/(x*x));

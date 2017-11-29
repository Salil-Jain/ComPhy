function [] = CSpline()
len = 10
x = [0.01  1.1  2  3.3  4.2  5.0  5.3 7.1  8.9  9.9];
fx = [1.0000    0.7331    0.3326    0.0179    0.0044    0.0172    0.0170    0.0001    0.0033    0.0002];

%plot (x,fx)


B = zeros(len-1,1);

Z = zeros(len-2,len);
for i = 2:len-1
        Z(i,i) = 2*(x(i) - x(i-1) + x(i+1) - x(i));
        Z(i,i+1) = x(i+1) - x(i);
        Z(i,i-1) = x(i) - x(i-1);
end
Z = Z(2:len-1,2:end-1);
Y = zeros(len-2,1);
for i = 2:len-1
    Y(i-1) = 3*(fx(i+1) - fx(i))/(x(i+1) - x(i)) + 3*(fx(i-1) - fx(i))/(x(i) - x(i-1));
end
Y;
size(Y);
size(Z);
W = linsolve(Z,Y);
W;
B=[0;W];

A = zeros(len-1,1); 
for i = 2:len-1
    A(i-1) = (B(i) - B(i-1))/(3*(x(i) - x(i-1)));
end
A(len-1) = B(len-1)*-1/(x(i) - x(i-1));

C = zeros(len-1,1);
for i =2:len-1
    C(i-1) =   (fx(i) - fx(i-1))/(x(i) - x(i-1)) - (B(i) + 2*B(i-1))*(x(i) - x(i-1))/3;
end
C(len-1) = (fx(len) - fx(len-1))/(x(len) - x(len-1)) - (2*B(i-1))*(x(i) - x(i-1))/3;

D = zeros(len-1,1);
for i = 1:len-1
    D(i) = fx(i);
end
x1 = [];
y1 = [];
fl = 1;
for i = 1:len-1
    for p = x(i):0.01:x(i+1)
       x1 = [x1,p];
       y1 = [y1,A(i)*(p-x(i))^3 + B(i)*(p-x(i))^2 + C(i)*(p-x(i)) + D(i)];
       if (fl)
           if (A(i)*(p-x(i))^3 + B(i)*(p-x(i))^2 + C(i)*(p-x(i)) + D(i)<1e-9)
           %print("The first minima is at %d",p)
           fl = 0;
           p
           end
       end
       
       %plot(x1,y1)
    %plot(p,A(i)*(p-x(i))^3 + B(i)*(p-x(i))^2 + C(i)*(p-x(i)) + D(i))
    end
end
x1;
y1;

plot(x1,y1)
hold on
scatter(x,fx)
hold off
    
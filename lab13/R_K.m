function [] = R_K(h,y_0, x_0, t_0, T, B, f, omg)

func =@(x,y,t) -B*y - x + f*cos(omg*t);
gunc =@(y) y;
y1 = y_0;
x1 = x_0;
t1 = t_0;
tp = [t_0];
xp =[x_0];
yp = [y_0];
for t1 = t_0:h:T
    
f0 = func(x1, y1, t1);
g0 = gunc(y1);
f1 = func(x1 + h*f0/2, y1 + h*f0/2, t1 + h/2);
g1 = gunc(y1 + h*g0/2);
f2 = func(x1 + h*f1/2, y1 + h*f1/2 ,t1 + h/2);
g2 = gunc(y1 + h*g1/2);
f3 = func(x1 + h*f2, y1 + h*f2, t1 + h);
g3 = gunc(y1 + h*g2);

y1 = y1 + h/6*(f0 + 2*f1 + 2*f2 + f3);
x1 = x1 + h/6*(g0 + 2*g1 + 2*g2 + g3);

tp = [tp,t1];
xp =[xp,x1];
yp = [yp,y1];
end

plot (tp,xp,'r')
hold on
plot (tp,yp,'b')
hold off

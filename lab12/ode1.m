% x and y are limits of integration. fx is initial value
function [] = ode1(x,y,fx)
    gm = 0.1;
    omga = 1;
    f0 = 1;
    fd = @(vel,t) -gm*vel + f0*sin(omga*t);
    for h = [0.01]
        y1p = [fx];
        y2p = [fx];
        y3p = [fx];
        xp = [x];
        x1 = x;
        y1 = y;
        temp1 = fx;
        temp2 = fx;
        temp3 = fx;
        temp = 0;
        while x1<=y1
            temp1 = temp1 + h*fd(temp1,x1);
            x1 = x1 + h;
            y1p = [y1p,temp1];
            xp = [xp,x1];
            temp = temp2 + h/2*fd(temp2,x1);
            temp2 = temp2 + h*fd(temp,x1+h/2);
            y2p = [y2p,temp2];
            temp = temp3 + h*fd(temp3,x1);
            temp3 = temp3 + h/2*(fd(temp3,x1) + fd(temp3+h*temp,x1+h));
            y3p = [y3p,temp3];
        end
        plot(xp,y1p,'r');
        hold on;
        plot(xp,y2p,'g');
        hold on;
        plot(xp,y3p,'b');
        hold on;
        legend('Normal','Modified','Improved')
        %xp;
        y1p;
    end
    hold off;
function [] = ode1(x,y,fx)
    fd = @(y) cos(y);
    for h = [0.01,0.1,0.2]
        yp = [fx];
        xp = [x];
        x1 = x;
        y1 = y;
        temp = fx;
        while x1<=y1
            temp = temp + h*fd(x1);
            x1 = x1 + h;
            yp = [yp,temp];
            xp = [xp,x1];
        end
        plot(xp,yp);
        hold on;
        xp
        yp
    end
    hold off;
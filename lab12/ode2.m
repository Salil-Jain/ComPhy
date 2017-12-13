% x and y are limits of integration. fx is initial value
function [] = ode1(x,y,fx)
    gm = 0.1;
    omga = 1;
    f0 = 1;
    fd = @(vel,t) -gm*vel^2 + f0*sin(omga*t);
    h1 = 0.0001;
    xpa = [x];
    y3pa = [fx];
    x1a = x;
    y1a = y;
    temp3 = fx;
    temp = 0;
    tempn = 0;
    I = 0;
    while x1a<y1a
        tempn = temp;
        temp = temp3 + h1*fd(temp3,x1a);
        I = I + h1*(tempn+temp)/2;
        x1a = x1a + h1;
        %xpa = [xpa,x1a];
        temp3 = temp3 + h1/2*(fd(temp3,x1a) + fd(temp3+h1*temp,x1a+h1));
        y3pa = [y3pa,temp3];
    end
    I
    y3pa;
    y1po = [];
    y2po = [];
    y3po = [];
    for h = [0.1,0.01,0.001]
        %y1po = [];
        iter = 1+h/h1;
        %y2po = [];
        %y3po = [];
        xp = [x];
        x1 = x;
        y1 = y;
        temp1 = fx;
        temp2 = fx;
        I1 = 0;
        I2 = 0;
        I3 = 0;
        temp3 = fx;
        temp = 0;
        
        while x1<y1-h
            tempn = temp1;
            temp1 = temp1 + h*fd(temp1,x1);
            I1 = I1 + h*(tempn + temp1)/2;
            x1 = x1 + h;
            y1p = (temp1-y3pa(iter))^2;
            xp = [xp,x1];
            iter = iter + h/h1; 
            
            tempn = temp2;
            temp = temp2 + h/2*fd(temp2,x1);
            temp2 = temp2 + h*fd(temp,x1+h/2);
            I2 = I2 + h*(tempn + temp2)/2;
            y2p = (temp2-y3pa(iter))^2;
            
            tempn = temp3;
            temp = temp3 + h*fd(temp3,x1);
            temp3 = temp3 + h/2*(fd(temp3,x1) + fd(temp3+h*temp,x1+h));
            I3 = I3 + h*(tempn + temp3)/2;
            y3p = (temp3-y3pa(iter))^2;
        end
        I1
        I2
        I3
        %plot(xp,y1p);
        %hold on;
        %plot(xp,y2p,'g');
        %hold on;
        %plot(xp,y3p,'b');
        %hold on;
        %legend('Normal','Modified','Improved')
        %xp;
        %y1p;
        y1po = [y1po,y1p];
        y2po = [y2po,y2p];
        y3po = [y3po,y3p];
    end
    y1po
    y2po
    y3po
    
    
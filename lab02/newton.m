% x1 is initial guess. 
% tol is tolerance.
function [y] = newton(x1,tol)
err = tol*10;
i = 0;
for x = [x1,x1+pi,x1+2*pi,x1+3*pi,x1+4*pi]
    err = tol*10;
    i=0;
    while(abs(err)>abs(tol))
        i= i+1;
        del = (fofx(x)/der(x));
        x = x - del;
        err = abs(del);
    end
    fprintf('root is at : %d. Number of iterations is : %d \n',x,i);
end

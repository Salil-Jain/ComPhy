% Simple Bisection method. fun is you function
% a is lower limit and b is upper limit
function [] = nr1(a,b)
    fun = @(x) cos(x) - x;
    tol =  1;
    while tol>10e-5
        mid = (a+b)/2;
        if(fun(mid)>0)
            a = mid
        else
            b = mid
        end
        tol = b-a;
    end
    mid 
    % mid is our final answer
        
        
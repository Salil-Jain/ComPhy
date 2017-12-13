% Change f1.m, f2.m and jac.m for different functions
function [] = prog(x,y)
    a = 0;
    while a<300
        J = jac(x,y);
        inv = linsolve(J,eye(2));
        f_mat = [f1(x,y); f2(x,y)];
        mul = inv*f_mat;
        x = x - mul(1);
        y = y - mul(2);
        a = a+1;
    end
    fprintf("x = %f, y = %f\n",double(x),double(y));
end

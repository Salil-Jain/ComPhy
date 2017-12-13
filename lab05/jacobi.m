

function [y] = Jacobi(len)
iteration = 0;
A = randn(len,len);
for i = 1:len
    for j = i+1:len
        A(j,i) = A(i,j);
    end
end

while (iteration < 10)
    for i= 1:len
       for j = i+1:len 
            theta = 0.5*atan(-2*A(i,j)/(A(i,i)-A(j,j)));
            P = eye(len);
            P(i,i) = cos(theta);
            P(i,j) = sin(theta);
            P(j,i) = -1*sin(theta);
            P(j,j) = cos(theta);
            A = P'*A*P;
       end
    end
    
    iteration = iteration + 1;
end
%A
plty = diag(A);
pltx = 1:len;
plot(pltx,plty)


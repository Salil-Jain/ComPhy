function [ eigenvalue ] = eignevalue_accuracy( A, guess )

matr = eye(size(A));
error = 10 * 1e-6;
delta = 0.01;
xi = -5;
xf = -4;
while 1
       middle = (xi+xf)/2;
       y = det(A - xi*eye(4))*det(A-middle*eye(4));
       if(y>0)
          xi = middle;
       else
          xf = middle; 
       end
       root = middle;   
       if((xf-xi)<0.00001)
          break;    
       end
end
eigenvalue = root;
fprintf('eigenvalue is : %d',eigenvalue);
%eigenvector = W2;
end



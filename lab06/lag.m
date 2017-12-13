%This code implements the Lagrange interpolation
% xx is an array containing set of points to be interpolated and fx is the function value at that point
% x is an array containing known points
% N is order of interpolation

function [y] = lag(x,fx,xx,N)
n = size(xx,2);
y=zeros(1,n);

for numQueries=1:n %For every query in xx
  xcopy = zeros(size(x,2));
  closestIndicesinX = zeros(1,N);%This stores the indices of the N points we eventually use
  
  xcopy = x;
    for v=1:N
        
        [minDist,index] = min(abs(xx(numQueries) - xcopy));
        closestIndicesinX(v) = index;
        xcopy(index) = 10000+v;%here we assume 10,000 to be an upper limit on our x values. Choice is arbitrary
    end
    for j=1:N %Loop for aaddition
       Lj = 1;
      for k = 1:N %This loop is for ** individual terms
        if(j~=k)
         Lj = Lj*(xx(numQueries)-x(closestIndicesinX(k)))/(x(closestIndicesinX(j)) - x(closestIndicesinX(k)));

        end      
      end  

      y(numQueries) = y(numQueries)+ fx(closestIndicesinX(j))*Lj;
    end %Created sum
   
  y
end %end numQueries
newArrayx = cat(2,xx,x); % n new points, size(x,2) known points
newArrayfx = cat(2,y,fx);
plot(x,fx)
hold on
plot(xx,y)
end %end function

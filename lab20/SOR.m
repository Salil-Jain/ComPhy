function SOR
%a is length along x direction
%d is distance between plates
%V1: potential of +ve plate
%V2: potential of -ve plate
xrange = 10; %dimensions of
yrange = 10; %bounding box
dx = 0.01;
dy = 0.01;
p = 1000; %no of iterations

V = zeros(yrange/dy,xrange/dx);
Ex = zeros(yrange/dy,xrange/dx);
Ey = zeros(yrange/dy,xrange/dx);

%initialize
V([400:600],525) = 1;
V([400:600],475) = -1;

%calculate V
while p
    %calculate V
    for i = 2:999
        for j = 2:999
            V(i,j) = (V(i+1,j)+ V(i-1,j)+ V(i,j+1)+ V(i,j-1))/4;
        end
    end
        p = p-1;
end
    %calculating electric field
    for i = 2:999
        for j = 2:999
            Ey(i,j) = -(V(i+1,j) - V(i-1,j))/(2*dx);
            Ex(i,j) = -(V(i,j+1) - V(i,j-1))/(2*dy);
        end
    end
    

k = 1:1000;

figure(1)
contour(k,k,V)

figure(2)
quiver(k,k,Ex,Ey)


end

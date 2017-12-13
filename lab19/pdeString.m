% Ans1
% Finds the time evolution till tstop

% u(i) : wave function at the present time step
% u_min(i) : stores the wave function at the previous time step
% u_plus(i) : Here we calculate the wave form at the next time step

function [y] = pdeString (delT,delX, tstop)
 v = 1; % wave velocity 1 unit/sec
 n = (10/delX)+1;
 C = (v*delT/delX)^2;
 x = 0:delX:10;
 u = zeros (1,n);
 u = normrnd(2,0.05,[1 n]); 
 
 u_min = u; 
 u_plus = zeros (1,n); 
 
 t = 0; 
 
 while t<tstop
     t = t + delT;     
     %update all inner points
     for i = 2:n-1
         u_plus(i) = C*(u(i+1) + u(i-1)) + 2*u(i)*(1-C) - u_min(i);
     end
     u_plus(1) = 0; u_plus(n) = 0; 
    
     %initialize for next step
     for i = 1:n
         u_min(i) = u(i);
         u(i) = u_plus(i);
     end     
 end 
 
 plot (x,u_plus);
 
end 
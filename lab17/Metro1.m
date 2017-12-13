% This program will plot magnetization vs temperature.
% Not all execution of program will give the correct plot.
% So, please execute it atleast 2 to 3 times.



% n is number of particles
function [] = Metro1(n,h)
s = [];
i1 =0;

% s matrix has spins. It is randomnly initialized.
for i = [1:1:n]
    if(rand>0.5)
    	p = 1;
    else
    	p = -1;
    end
    s = [s,p];
end
s1 = s;
E = 0;
for j = [1:1:n]
    left = j-1;
    right = j+1;
    if(left == 0)
        left = n;
    end
    if(right == n+1)
        right = 1;
    end
    E = E -1*(s(j)*s(left)+s(j)*s(right)) - h*s(j);
end

EM = []; % matrix for sum of spins
kbtm = []; % matrix for different KBT {1/beta} values.
iter = 50000; % number of iterations
for T = [1:50:1001]	
    s = s1;
	while(iter)
                 if(mod(iter,10000)==1)
                     s;
                 end
	    	i = ceil(rand*n); %This will give us a random  number between 1 and n. We will flip s(i)
	    	kbt = (10^23)*T; % Defining kbt
	        s(i) = -1*s(i);
	        E1= E;
	        for j = [1:1:n]
	            left = j-1;
	            right = j+1;
	            if(left == 0)
	                left = n;
	            end
	            if(right == n+1)
	                right = 1;
	            end
	            E = E -1*(s(j)*s(left)+s(j)*s(right)) - h*s(j);
	        end
	        if(E1<E)
	            x = exp((E1 - E)/(kbt));
	            if(x<rand)
	                E = E1;
	                s(i) = s(i)*(-1);
	            end
	        else
	            E1 = E;
	        end
	    
	    
	    iter = iter -1;
    end
    s
    spsum = 0; % Now we will sum all the spins. This state is the state which we'll will get after 50000 iterations.
	for o = [1:1:n]
		spsum = spsum + s(o);
    end
    spsum = abs(spsum/n);
	kbtm = [kbtm,(10^23)*T];
	EM = [EM,spsum];
end
plot(kbtm,EM);
EM
s
end


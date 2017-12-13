% N is number of particles.

function [] = MC2D (N)

kbt = 1.1;
S = ones(N,N);
for i = 1:N
    for j = 1:N
        S(i,j) = 2*pi*rand;
    end
end
E = 0;
for i = 1:N-1
    for j = 1:N-1
        E = E - cos(S(i,j) - S(i,j+1)) - cos(S(i,j) - S(i+1,j));
    end
end
for i = 1 : N-1
    E = E - cos(S(i,N) - S(i+1,N)) - cos(S(i,N) - S(i,1));
    E = E - cos(S(N,i) - S(N,i+1)) - cos(S(N,i) - S(1,i));
end
E = E - cos(S(N,N)- S(N,1)) - cos(S(N,N)- S(1,N));
Ex = E/N;
iter = 500000;
delt = 0.01;
while(iter)
    P = S;
    E1 = E;
    a = ceil(rand*N);
    b = ceil(rand*N);
    y = (2*rand - 1)*delt;
    S1 = S(a,b) + y;
    a = a+1;
    b = b+1;
    an = mod(a-1,N) + 1;
    bn = mod(b-1,N) + 1;
    a = a-2;
    b = b-2;
    ap = mod(a+N-1,N)+1;
    bp = mod(b+N-1,N)+1;
    a = a+1;
    b = b+1;
    E = E - cos(S1 - S(ap,b)) - cos(S1 - S(an,b)) - cos(S1 - S(a,bn)) - cos(S1 - S(a,bp)); 
    E = E + cos(P(a,b) - P(ap,b)) + cos(P(a,b) - P(an,b)) + cos(P(a,b) - P(a,bn)) + cos(P(a,b) - P(a,bp));
    if (E1<E)
        x = exp((E1 - E)/kbt);
        if (x>rand)
            E1 = E;
            S(a,b) = S1;
        else    
            E = E1;
        end
    else
        E1 = E;
        S(a,b) = S1;
    end
    if(mod(iter,100000)==1)
        E/N;
    end
    iter = iter - 1;
end
Eav = E/N

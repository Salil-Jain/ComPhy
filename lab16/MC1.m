function [] = MC1()
% I = 0;
% A=[];
% h = [1e6];
% n=0;
% for i = 1:1:1
%     while n<1000
%         hx = h(i);
%         while hx
%             j = rand; 
%              I = I + exp(j);
%              hx = hx-1;
%         end
%         n= n+1;
%         I = I/h(i);
%         A = [A,I];
%     end   
% end
% 
% histogram(A)

% values calcualted using above code.
py = [0.12,0.04,0.0125,0.005,0.0012];
px = [2,3,4,5,6];
plot(px,py);
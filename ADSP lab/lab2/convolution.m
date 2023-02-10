%{
The Function to find the Linear Convolution of two sequence
author :Sudip Biswas
%}
function c = convolution(a, b)
u = length(a);
v = length(b)
m =u +v -1;

a=[a,zeros(1,v-1)];
b=[b,zeros(1,u-1)];

for i = 1:1:m
    c(i)=0;
       for j = 1:1:i
               c(i) = c(i)+ a(j)*b((i-j+1));
       end
end
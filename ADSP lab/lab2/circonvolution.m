%{
The Function to find the Circular Convolution of two sequence
author :Sudip Biswas
%}
function c = circonvolution(a, b)
u = length(a);
v = length(b)
n =max(u,v);

if(u>v)
b=[b,zeros(1,u-v)];
else
a=[a,zeros(1,v-u)];
end


for i =0:n-1
    c(i+1)=0;
    for j = 0:n-1
        k = mod((i-j),n);
        c(i+1) = c(i+1) + a(j+1)*b(k+1);
    end
end
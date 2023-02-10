%{ 
To perform decimation shift
Author : Sudip Biswas
%}
function x = DITDecimation(xn,r)

N = length(xn);         % Length of the input sample
for n=1:N
        n1 = bitor(bitsll(n-1,1),fix(bitsra(n-1,r-1)),"uint8");
        n1 = bitand(n1,N-1,"uint8");
        x(n) = xn(n1+1);
end
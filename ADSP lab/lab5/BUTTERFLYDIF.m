%{ 
To Calcuate the radix 2 butterfly in DIT for a given sequence
Author : Sudip Biswas
%}
function x = BUTTERFLYDIF(xn)

N = length(xn);        % Length of the input sample
r = log2(N);           % number of stages
if(N>2)
   for n=1:N/2
        xeven(n) = xn(n);
   end
   for n=(N/2)+1:N
        xodd(n-(N/2)) = xn(n); 
   end
   for n=1:N/2
         W = exp(-2i*pi*(n-1)/N);
        xkeven(n) = xeven(n)+xodd(n);
        xkodd(n) = (xeven(n)-xodd(n))*W;
   end
   xeven = BUTTERFLYDIF(xkeven);
   xodd  = BUTTERFLYDIF(xkodd);
   for n=1:N/2
        x(n) = xeven(n);
   end
   for n=(N/2)+1:N
        x(n) = xodd(n-(N/2));
   end
else
    x(1) = xn(1)+xn(2);
    x(2) = xn(1)-xn(2);
end









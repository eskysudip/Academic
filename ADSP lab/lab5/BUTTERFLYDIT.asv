%{ 
To Calcuate the radix 2 butterfly in DIT for a given sequence
Author : Sudip Biswas
%}
function x = BUTTERFLYDIT(xn)

N = length(xn);        % Length of the input sample
r = log2(N);           % number of stages

if ( N == 2 )
    x(1) = xn(1) + xn(2); % 2 point butterfly when N =2
    x(2) = xn(1) - xn(2);
else
    xn = DITDecimation(xn,r);
    for n=1:N/2
        xeven(n) = xn(n);
    end
    xkeven = BUTTERFLYDIT(xeven);
    for n=(N/2)+1:N
        xodd(n-(N/2)) = xn(n); 
    end
    xkodd =BUTTERFLYDIT(xodd);
    for n=1:N/2
         W = exp(-2i*pi*(n-1)/N);
        x(n) = xkeven(n)+(W * xkodd(n));
        x(n+(N/2)) = xkeven(n)-(W * xkodd(n));
    end
end








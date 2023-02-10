%{ 
To Calcuate the FFT by DIT for a given sequence
Author : Sudip Biswas
%}
function xk = DIFFFT(xn)

N = length(xn);        % Length of the input sample
r = log2(N);           % number of stages

if (r-fix(r))
error("Cannot find FFT Radix 2 via DIF");
else         
   xk = BUTTERFLYDIF(xn);
   if (r>1)
       xk = DIFDecimation(xk,r);
   end
  
   
end

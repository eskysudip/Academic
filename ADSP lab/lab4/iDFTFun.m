%{
To Calculate the inverse DFT of given sequence
Author : Sudip Biswas
%}
function xn = iDFTFun(x)
N = length(x);
idflen=0:N-1;
for k =1:N
   xn(k)=0;
   for n=1:N
       W = (1i*2*pi*(n-1)*(k-1))/N;
       xn(k) = xn(k)+ x(n)*exp(W);
   end
   xn(k) = xn(k)/N;
      
end
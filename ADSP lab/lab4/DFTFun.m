%{ 
To Calcuate the DFT of given sequence
Author : Sudip Biswas
%}

function xk = DFTFun(x)
N = length(x);
n1=0:N-1;

for k =1:N
    xk(k)=0;
    for n=1:N
        W = (-1i*2*pi*(n-1)*(k-1))/N;
        xk(k) = xk(k)+ x(n)*exp(W);
    end
end


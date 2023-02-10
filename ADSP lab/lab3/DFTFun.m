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

subplot(3,1,1);
stem(n1,x);
ylabel("Input Sequence");
xlabel("n");
subplot(3,1,2);
stem(n1,abs(xk));
ylabel("Magnitude");
xlabel("k");
subplot(3,1,3);
stem(n1,angle(xk));
ylabel("Phase");
xlabel("k");



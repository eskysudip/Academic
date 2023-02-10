%BER of BPSK in Rayleigh fading
clear all; close all; clc; % Clear all data
%  Different sample of Amplitude of 1 bit
a1 = 0:0.5:15;
%  Different sample of Amplitude of 0 bit
a2 = -a1;
BER = zeros(1,length(a1));      %initialise BER count to zero
% mean of Random Variable
mu = 0;
% variance of Random Variable
sigma = 0.5;
% Number of sample
N = 1000000;
%snr ->signal to noise ratio
snr=(a1.^2)./sigma;
snrdb = 10*log10(snr);
%AWGN Theory
q=(a1-a2)./(2*sigma); % For computation of Qfunc from ERFC
PEawgn = 1/2 .* erfc(q./sqrt(2));
%plot for AWGN Theory
semilogy(snrdb,PEawgn);
%Rayleigh Theory
PEray = 0.5.*(1-sqrt((snr./(1+snr))));
%plot snr vs ber
hold on;
semilogy(snrdb,PEray);
hold off
% Generation of Gaussian random variable samples for real part
Hr = normrnd(mu,sigma ,1,N);
% Generation of Gaussian random variable samples for imaginary part
Hi = normrnd(mu,sigma ,1,N);
% Generation of Rayleigh complex random variable
H = Hr+1j*Hi;
% Generation of Gaussian random variable samples for real part
Zr = normrnd(mu,sigma ,1,N);
% Generation of Gaussian random variable samples for imaginary part
Zi = normrnd(mu,sigma ,1,N);
% Generation of Rayleigh complex random variable
Z = Zr+1j*Zi;
x = randi([0 1],1,N);
s = zeros(1,N);%input signal
Y = zeros(1,N);%input signal
Ytil = zeros(1,N);%input signal
for i = 1:length(a1)    %sample of amplitude
       BER(i)   = 0;   %BER initialization
       txcount = 0;    % Number of symbol transmitted counter
       recvcorrect = 0;% Number of symbol received correct counter
   for j = 1:N
       if x(j)==1
           s(j) = a1(i);       % symbol with bit 1 
       else
           s(j) = a2(i);       % symbol with bit 0
       end
   end
   Y = s.*H +  Z ;       % addition of gaussian noise
   Ytil = real((Y.*(conj(H)./abs(H))));
   bound = (a1(i)+a2(i))/2;   % boundary
   for j = 1:N
       if(s(j) == a1(i))
           txcount = txcount+1;
           % Number of symbol transmitted counter
           if Ytil(j) >= bound
               recvcorrect = recvcorrect+1;
               % Number of symbol received correct counter
           end
       else
            txcount = txcount+1;
            % Number of symbol transmitted counter
            if Ytil(j) < bound
               recvcorrect = recvcorrect+1;
               % Number of symbol received correct counter
           end
       end
   end
   BER(i)  = (1- (recvcorrect/txcount)); %calculation of BER
end
%plot snr vs ber
hold on;
semilogy(snrdb,BER,"ro");
hold off
xlabel('SNR');  % label x axis
ylabel('BER');  % label y axis
title('BER of BPSK in Rayleigh fading');% Title
legend('AWGN','Rayleigh Theory','Rayleigh Experiment');% Legend
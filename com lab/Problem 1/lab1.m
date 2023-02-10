%BER for binary signals in AWGN channel
clear all; close all; clc; % Clear all data
%Task 1: Theoretical BER
a1 =[0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 2.5, 3, 3.5]; 
%  Different sample of Amplitude of 1 bit
a2 = -a1;  %  Different sample of Amplitude of 0 bit
NoiseVariance = 1;%Noise variance =1.
% Number of sample
numsamp =5000;
%pb -> probability of error(BER)
q=(a1-a2)./(2); %% For computation of Qfunc from ERFC
pb = 1/2 .* erfc(q./sqrt(2));
%snr ->signal to noise ratio
snr=(a1.^2)./NoiseVariance;
%plot snr vs probability of error
loglog(snr,pb);


%Monte carlo simulation
ber = zeros(1,length(a1));%initialise BER count to zero
for i = 1:length(a1)    %sample of amplitude
        ber(i) =0;
        tx1count =0;
        rx1count =0;
    for j = 1:numsamp
        x = randi([0 1]);
        if x==1
            s=a1(i);
        else
            s = a2(i);
        end
        n0 = randn();%Generate  AWGN
        z = s +  n0 ;       % addition of gaussian noise
        bound = (a1(i)+a2(i))/2;   % boundary
         if z >= bound
            rx1count = rx1count+1;% Num of 1 bit received for a(i)Amp
            if(s == a1(i))
                tx1count = tx1count+1;% Num of 1 bit received for a(i)Amp
            end
        end
    end
  ber(i) = abs(1- (rx1count/tx1count)); %calculation of BER  
end

%plot snr vs ber
hold on;
loglog(snr,ber,"ro");
hold off
xlabel('SNR');  % label x axis 
ylabel('BER');  % label y axis
title('BER for binary signals in AWGN channel');% Title
legend('Probability of Error','Bit Error Rate');% Legend

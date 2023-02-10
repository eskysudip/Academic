%Plot recieved power as function of distance
% Free space path loss Pr = Pt*GT*GR (1/(4*pi*R*lam)^2) 
%Free space path loss + shadowning Pr = Pt*GT*GR (c/(4*pi*R*f)^2 + S
clear all; close all; clc; % Clear all data

Ptdbm = 10;  % Transmit power in db
GT = 1; % Transmit antena gain
GR = 1; % Recived antena gain 
f = 2400000000; % frequecy of carrier
SPL=299792458;	% Speed of light
lam = SPL/f; % Wavelength 
Pt = 10^((Ptdbm-30)/10); % Transmit power in linear scale
R =[0,500,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,9000,9500,10000];%Init Distance
Prdbm = zeros(1,length(R));  % Init Recieved power in db
logshadow = zeros(1,length(R));  % Init Recieved power in db
Pr = zeros(1,length(R));  % Init Recieved power in db
for i=1:length(R)
    vari = lam/(4*pi*R(i));
     Pr(i) = Pt*GT*GR*vari^2;
     Prdbm(i) = 10*log10(Pr(i)/1000);
end   
%plot Prdb vs Distance R
plot(R,Prdbm);
for i=1:length(R)
logshadow(i) = normrnd(0,2); 
end


hold on;
%plot Prdbm+shadow vs Distance R
plot(R,Prdbm+logshadow);
hold off

xlabel('Distancse in m');  % label x axis 
ylabel('Reciever Power in dbm');  % label y axis
title('Free space path loss + shadowning');% Title
legend('Free space path loss','Free space path loss + shadowning');% Legend

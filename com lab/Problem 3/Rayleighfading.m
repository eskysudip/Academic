%Rayleigh fading
clear all; close all; clc; % Clear all data
% mean of Random Variable
mu = 0;
% variance of Random Variable
sigma = 1;
Pr = 2*sigma ;
% Number of sample
N = 100000;
% Generation of Gaussian random variable samples for real part
Rr = normrnd(mu,sigma ,1,N);
% Generation of Gaussian random variable samples for imaginary part
Ri = normrnd(mu,sigma ,1,N);
% Generation of Rayleigh complex random variable
Z = Rr+1j*Ri;
% Magnitude of Rayleigh complex random variable
Magz = abs(Z);
%Theoretical Rayleigh fading
Mag  = 0:0.01:5;
Zpdf = (2.*Mag/Pr).*(exp(-1.*Mag.*Mag./Pr)) ;
subplot(2,2,1);
plot(Mag,Zpdf);
xlabel('amplitude');  % label x axis
ylabel('PDF of amplitude');  % label y axis
title('Theoretical Rayleigh fading');% Title
% Plotting of the histogram  of Amplitude of Z
subplot(2,2,2);
HistMagZ =  histogram(Magz);
xlabel('amplitude');  % label x axis
ylabel('PDF of amplitude');  % label y axis
title('Histogram Rayleigh distribution');% Title
%Theoretical Uniform distribution
Phase = -pi:.01:pi;
Zphase = 1/(2*pi)*ones(length(Phase));
subplot(2,2,3);
plot(Phase,Zphase);
xlabel('phase');  % label x axis
ylabel('PDF of phase');  % label y axis
title('Theoretical Uniform distribution');% Title
% Phase of Rayleigh complex random variable
Phasez = angle(Z);
% Plotting of the histogram function of phase of Z
subplot(2,2,4);
HistPhaseZ =  histogram(Phasez);
xlabel('phase');  % label x axis
ylabel('PDF of phase');  % label y axis
title('Histogram Uniform distribution');% Title
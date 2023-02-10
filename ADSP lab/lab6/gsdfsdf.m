clc;
clear all;
close all;
ripplePassband=input('Enter the passband ripple: ');
rippleStopband=input('Enter the stopband ripple: ');
fpass=input('Enter the Passband frequency in hertz: ');
fstop=input('Enter the Stopband frequency in hertz: ');
fsample=input('Enter the sampling frequency in hertz: ');
wp=2*fpass/fsample;
ws=2*fstop/fsample;
m = ceil(3.32/(ws-wp));
n = 2*m+1;
n1=n+1;
if(rem(n,2)~=0)
n1=n;
n=n-1;
end
window=hamming(n1);
Hd = inline('1*(abs(om) < oc)', 'om', 'oc');
om = linspace(-pi, pi, 201);
oc = pi/4;
b=fir1(n,wp,window,'noscale'); %Low pass filter
[H,w]=freqz(b,1,om);
subplot(2,3,1)
plot(om, 20*log10(abs(H)), '-', om, 20*log10(max(Hd(om,oc),eps)), '--')
title ('LPF Magnitude Response')
grid on;
xlabel(' (a) Normalized Frequency -->');
ylabel(' Gain in dB -->');
subplot(2,3,4)
plot(w/pi,angle(H)); % Phase response
title ('LPF Phase Response')
grid on;
xlabel('Normalised freq');
ylabel('Angle');
b=fir1(n,wp,'high',window); %High pass filter
[H,w]=freqz(b,1,om);
m=20*log10(abs(H));
subplot(2,3,2)
plot((w/pi),m);
title ('HPF Magnitude Response')
grid on;
xlabel(' (b) Normalized Frequency -->');
ylabel(' Gain in dB -->');
subplot(2,3,5)
plot(w/pi,angle(H));
title ('HPF Phase Response')
grid on;
xlabel('Normalised freq');
ylabel('Angle');
wn=[wp ws];
b=fir1(n,wn,'bandpass',window); %Band pass filter
[H,w]=freqz(b,1,om);
m=20*log10(abs(H));
subplot(2,3,3)
plot((w/pi),m);
title ('BPF Magnitude Response')
grid on;
xlabel(' (c) Normalized Frequency -->');
ylabel(' Gain in dB -->');
subplot(2,3,6)
plot(w/pi,angle(H));
title ('BPF Phase Response')
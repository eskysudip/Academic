rp=0.06;   % Passband ripple 
rs=0.05;   % stop band ripple
fp=1000;   % Passband frequency
fs=3000;   % Stopband frequency 
f= 5000;    % Sampling frequency 

wp=2*pi*fp/f;
ws=2*pi*fs/f;

m = 8*pi/(ws-wp);

if(floor(m/2)==m/2)
    m = m+1;
end
n = 0:m-1;

%Hamming window
delay = (m-1)/2;
teta = 2*pi*n/(m-1);
W = 0.54 - 0.46*cos(teta);

subplot(3,1,1);
stem(n,W);
xlabel('n');
ylabel('hamming window');

%Low pass filter
p = n-((m-1)/2);
wc = (wp+ws)/2;
hd= sin(wc.*p)./(pi.*p);
hd(delay+1) = wc/pi;

h = hd.*W;
[H,w] = freqz(h);

subplot(3,1,2);
plot(w/pi,20.*log10(abs(H)));
xlabel('Normalized freq');
ylabel('Gain in Db');
subplot(3,1,3);
plot(w/pi,angle(H));
xlabel('Normalized freq');
ylabel('Angle');
rp=0.04;   % Passband ripple 
rs=0.05;   % stop band ripple
fp=2000;   % Passband frequency
fs=4000;   % Stopband frequency 
f= 8000;    % Sampling frequency 
beta = 4;

if(rp>rs)
    A = -20*log(rs);
else
    A = -20*log(rp);
end
A = floor(A);
wp=2*pi*fp/f;
ws=2*pi*fs/f;

delfreq = (ws-wp)/(2*pi);

m =(A-7.95)/(14.36*delfreq);
m=floor(m);

if(floor(m/2)==m/2)
    m = m+1;
end
n = 0:m-1;

delay = (m-1)/2;

%Kaiser window
W = kaiser(m,beta);

subplot(3,1,1);
stem(n,W);
xlabel('n');
ylabel('Kaiser window');

%Band pass filter
p = n-((m-1)/2);

hd= (sin(ws.*p) - sin(wp.*p))./(pi.*p);
hd(delay+1) = (ws-wp)/pi;
h = hd'.*W;
[H,w] = freqz(h);

subplot(3,1,2);
plot(w/pi,20.*log10(abs(H)));
xlabel('Normalized freq');
ylabel('Gain in Db');
subplot(3,1,3);
plot(w/pi,angle(H));
xlabel('Normalized freq');
ylabel('Angle');
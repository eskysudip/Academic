clear;clc ;
KP = -0.5;
KS = 25;

radp = 150;
rads = 300;

% To find the Order of Chebyshev Filter
ks = power(10,-KS/20);
kp = power(10,-KP/20);
Nks = power((1/(ks*ks) - 1),0.5);  
Nkp = power((1/(kp*kp) - 1),0.5);  
Nrad = rads/radp;
Nnum = acosh(Nks/Nkp);
Ndec = acosh(rads/radp);
N = Nnum/Ndec;
N = ceil(N);

% To find cutoff frequeny in rad/sec Chebyshev Filter
radc =  radp;

% To find Transfer fuction Chebyshev Filter
s = tf("s");

Ynum = power((1/(Nkp*Nkp)+1),0.5)+(1/Nkp);
yn = 0.5*( power(Ynum,1/N)-power(Ynum,-1/N));
Hs = 1;
if ((N/2) == floor(N/2))
   G0 = 1/power(1+Nkp*Nkp,0.5); 
    for k=1:N/2
        bk = 2*yn*sin((2*k-1)*180/N);
        ck = yn*yn+cos((2*k-1)*180/N)*cos((2*k-1)*180/N);
        Hs = Hs * 1/(s*s+bk*s+ck); 
    end
     Gain =  G0/evalfr(Hs,0);
     Hs = Gain*Hs;
else
    Hs = 1/(s+yn);
    for k=1:(N-1)/2
        bk = 2*yn*sin((2*k-1)*180/N);
        ck = yn*yn+cos((2*k-1)*180/N)*cos((2*k-1)*180/N);
        Hs = Hs * 1/(s*s+bk*s+ck); 
    end 
    Gain =  1/evalfr(Hs,0);
    Hs = Gain*Hs;
end
% To transform the transfer fuction from 
% Normalized LPF to unnormalize cutoff LPF 
[num,den] = tfdata(Hs);
[num,den] = lp2lp(num{1},den{1},radc);
Hs =  tf(num,den);

% To plot the frequency and phase of Transfer fuction using bode plot
w= logspace(0,5);
bode(Hs,w);

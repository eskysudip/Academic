kp = 0.9;  % 0.9<= H(W) <= 1 for 0<= w<= 0.2Pi  , T =1
ks = 1;   %  H(W) <= 1 for 0.4pi<= w<= Pi       , T=1
% For ks = 1 ,N ---> infinity so we assume ks = 0.2
ks = 0.2; 

KP = 20*log(kp);
KS = 20*log(ks);
wp = 0.2*pi;
ws = 0.4*pi;
fs =1;  % T=1 
% To find the Order of Butterworth Filter
Nkp = power(10,(-KP/10))-1;
Nks = power(10,(-KS/10))-1;
Nnum = log(Nkp/Nks);
Ndec = 2* log(wp/ws);
N = Nnum/Ndec;
N = ceil(N);

% To find the pole of Butterworth Filter
k = 0:2*N-1;
e = (2.*k+1)./(2*N);
p = j*exp(1*j*pi.*e);
   
i=1;
for k=1:2*N
    r = real(p);
    if (r(k)<0)
        poles(i)=p(k);
        i=i+1;
    end
end

% To find the cutoff frequeny in rad/sec Butterworth Filter
wc = wp/power(Nkp,1/(2*N));

% To find Transfer fuction Butterworth Filter
s = tf("s");
H = 1;
for k=1:N
    H = H*wc / (s+wc*poles(k));
end 

% To plot the frequency and phase of Transfer fuction using bode plot
w= logspace(-3,3);
bode(H,w);
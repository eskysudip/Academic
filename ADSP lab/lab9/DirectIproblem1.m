clear;clc;close;
b0 = 0.5;
b1 = -0.5;
a0 = 1;
a1 = 1.3;
a2 = 0.36;
n = 1:100;
xn=zeros(1,100);
wn= zeros(1,100);
yn=zeros(1,100);
A = 5;
%xn input is summation of sinwave from frequency 0.05Hz to 0.5 in step of 0.05
freq =0;
for i= 0:10
    freq = freq+0.05;
    W = 2*pi*freq;
    xn =  xn+A*sin(W*n);
    freq= freq+0.01;
end
subplot(2,1,1);
stem(n,xn);
xlabel('n samlped at 1 sec');
ylabel('xn');
title("xn input is summation of sinwave from frequency 0.05Hz to 0.5 in step of 0.05");
for n=2:100
    wn(n) = b0*xn(n)+b1*xn(n-1);
end

for n =3:100
yn(n) = a0*wn(n)-a1*yn(n-1)-a2*yn(n-2);
end
n = 1:100;
subplot(2,1,2);
stem(n,yn);
xlabel('n samlped at 1 sec');
ylabel('yn');
title('yn filtered with given IIR in direct form 1');
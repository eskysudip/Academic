clear;clc;close;
b0 = 1;
b1 = -3/2;
b2 = 7/4;
b3 = -9/8;
b4 = -3/4;
a0 = 1;

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
for n=5:100
    wn(n) = b0*xn(n)+b1*xn(n-1)+b2*xn(n-2)+b3*xn(n-3)+b4*xn(n-4);
end

for n =3:100
yn(n) = a0*wn(n);
end
n = 1:100;
subplot(2,1,2);
stem(n,yn);
xlabel('n samlped at 1 sec');
ylabel('yn');
title('yn filtered with given IIR in direct form 1');
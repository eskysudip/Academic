clear;clc;close;
hn = [1,2,3,3,2,1];

n = 1:100;
xn=zeros(1,100);
wn= zeros(1,100);
yn=zeros(1,100);
%xn input is summation of sinwave from frequency 0.05Hz to 0.5 in step of 0.05
A = 5;
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
for n =7:100
    yn(n)= hn(1)*(xn(n)+xn(n-5))+hn(2)*(xn(n-1)+xn(n-4))+hn(3)*(xn(n-2)+xn(n-3));
end
n = 1:100;
subplot(2,1,2);
stem(n,yn);
xlabel('n samlped at 1 sec');
ylabel('yn');
title('yn filtered with given FIR in direct form 1');
t = (-1:0.01:1)';

imp = t==0;
subplot(2,1,1);
plot(t,imp);
xlabel('t');
ylabel('imp');

subplot(2,1,2);
n = -20:20; 
imp1 = n==0;
stem(n,imp1);
xlabel('n');
ylabel('imp');
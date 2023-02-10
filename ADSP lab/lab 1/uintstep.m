t = linspace(-100,100,1000);
unit = (t>=0).*t;
subplot(2,1,1);
plot(t,unit);
xlabel('t');
ylabel('u(t)');


n = -20:20; 
uint1 = (n>=0).*n;
subplot(2,1,2);
stem(n,uint1);
xlabel('n');
ylabel('u(n)');
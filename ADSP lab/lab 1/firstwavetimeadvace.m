t = linspace(-100,100,1000);
x = 4*t.*t+3;
y= 4*(t+10).*(t+10)+3;
subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('x');
subplot(2,1,2);
plot(t,y);
xlabel('t');
ylabel('y');
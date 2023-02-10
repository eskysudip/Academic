t = linspace(-100,100,1000);
scale = -3;
x = 4*t.*t+3;

subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('x');

subplot(2,1,2);
plot(t,scale*x);
xlabel('t');
ylabel('y');
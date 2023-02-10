t = linspace(-100,100,1000);
x = 2*t.*t+3;
y= 4*t+8;
z= x.*y;
subplot(3,1,1);
plot(t,x);
xlabel('t');
ylabel('x');

subplot(3,1,2);
plot(t,y);
xlabel('t');
ylabel('y');

subplot(3,1,3);
plot(t,z);
xlabel('t');
ylabel('z');
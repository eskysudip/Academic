n = linspace(-100,100,100);
f=100;
x = 5*sin(2*pi*f*n);
stem(n,x);
xlabel('n');
ylabel('x');
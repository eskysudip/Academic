n = -29:30;
x = 7*n.*n+5;
y= 4*n+3;
z= x-y;
subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('x');

subplot(3,1,2);
stem(n,y);
xlabel('n');
ylabel('y');

subplot(3,1,3);
stem(n,z);
xlabel('n');
ylabel('z');
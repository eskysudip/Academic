n = -10:10;
n1 = -20:20;
x = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 0 0 0 ];
y=  [0 0 0 0 0 0 0 0 0 0 2 2 2 2 0 0 0 0 0 0 0 ];

subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('x');

subplot(3,1,2);
stem(n,y);
xlabel('n');
ylabel('y');

subplot(3,1,3);
z = convolution(x,y);
stem(n1,z);
xlabel('n');
ylabel('z');



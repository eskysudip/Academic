n = 0:10;
n1 =0:10;
x = [1 2  3 4 0 0 0 0 0 0 0 ];
y=  [1 2  1 2 0 0 0 0 0 0 0 ];

subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('x');

subplot(3,1,2);
stem(n,y);
xlabel('n');
ylabel('y');

subplot(3,1,3);
z = circonvolution(x,y);
stem(n1,z);
xlabel('n');
ylabel('z');
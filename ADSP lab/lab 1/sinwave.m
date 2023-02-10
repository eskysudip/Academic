t = linspace(-100,100,1000); % time from -100 ms to 100 ms
f = 100;  %frequency in Hz
amp = 2;

x = amp * sin(2*pi*f*t)
subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('x');

f = .05;  % f reduce to .05 for samping in 1hz 

n = -100:100; 
z = 2*sin(2*pi*f*n);
subplot(2,1,2);
stem(n,z);
xlabel('n');
ylabel('x');
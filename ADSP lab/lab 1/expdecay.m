t = linspace(-100,100,1000); % time from -100 ms to 100 ms
f = 0.05;  %frequency in Hz
duty = 50; %duty cycle
amp = 2;

x = amp*exp(-2*pi*f*t);
subplot(2,1,1);
plot(t,x)
xlabel('t');
ylabel('x');

n = -100:100; 
f = .05;  % f reduce to .05 for samping in 1hz 
z = amp*exp(-2*pi*f*n);
subplot(2,1,2);
stem(n,z)
xlabel('n');
ylabel('x');
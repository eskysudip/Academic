t = linspace(-100,100,1000); % time from -100 ms to 100 ms
f = 100;  %frequency in Hz
duty = 50; %duty cycle
amp = 2;

x = amp*sawtooth(2*pi*f*t,1/2);
subplot(2,1,1);
plot(t,x)
xlabel('t');
ylabel('x');

n = -100:100; 
f = .05;  % f reduce to .05 for samping in 1hz 
z = amp*sawtooth(2*pi*f*n,1/2);
subplot(2,1,2);
stem(n,z)
xlabel('n');
ylabel('x');
t = linspace(-100,100,1000);
unitstep = t>=0;
ramp1 = t.*unitstep;
plot(t,ramp1);
xlabel('t');
ylabel('x');
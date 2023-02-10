N = 0:127
X = N.*cos(2*pi*N*0.05);
K = DIFFFT(X);
subplot(3,1,1);
stem(N,X);
ylabel("X(n)");
xlabel("n");
subplot(3,1,2);
stem(N,abs(K));
ylabel("abs X(K)");
xlabel("n");
subplot(3,1,3);
stem(N,angle(K));
ylabel("angle X(K)");
xlabel("n");
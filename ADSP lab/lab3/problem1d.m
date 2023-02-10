x1=[3,0,2,-4] ;
x2=[1,2,3];
len1 = length(x1);
len2 = length(x2);
len = len1+len2-1;
x2 = [x2,zeros(1,len-len2)];
x1 = [x1,zeros(1,len-len1)];

n=0:len-1;
xk1 = DFTFun(x1);
xk2 = DFTFun(x2);
xkc = xk1.*xk2;
xnc = iDFTFun(xkc);
subplot(3,1,1);
stem(n,x1);
xlabel("n");
ylabel("xn 1");

subplot(3,1,2);
stem(n,x2);
xlabel("n");
ylabel("xn 2");


subplot(3,1,3);
stem(n,xnc);
xlabel("n");
ylabel("convoled seq");

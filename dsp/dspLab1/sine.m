t=(0:0.0001:0.005);
f=1000;
a=5;
x=a*sin(2*pi*f*t);
figure;
subplot(3,1,1);
plot(t,x);
xlabel('t');
ylabel('x(t) continuous');
subplot(3,1,2);
stem(t,x);
xlabel('n');
ylabel('x[n] discrete');


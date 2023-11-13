%program for verification of sampling theorem
close all; clear all; clc
t=-10:.01:10;
T=4;
fm=1/T;
x=cos(2*pi*fm*t); % input signal
subplot(2,2,1);
plot(t,x);
xlabel('time');ylabel('x(t)');title('continous time signal');
grid;
n1=-4:1:4;
fs1=1.6*fm;
fs2=2*fm;
fs3=10*fm;
%discrete time signal with fs<2fm
x1=cos(2*pi*fm/fs1*n1);
subplot(2,2,2);
stem(n1,x1,'r');
xlabel('time');ylabel('x(n)');
title('discrete time signal with fs<2fm');
hold on
subplot(2,2,2); plot(n1,x1)
grid;
%discrete time signal with fs=2fm
n2=-5:1:5;
x2=cos(2*pi*fm/fs2*n2);
subplot(2,2,3);
stem(n2,x2,'r');
xlabel('time');ylabel('x(n)');
title('discrete time signal with fs=2fm');
hold on
subplot(2,2,3); plot(n2,x2)
%discrete time signal with fs>2fm
grid;
n3=-20:1:20;
x3=cos(2*pi*fm/fs3*n3);
subplot(2,2,4); stem(n3,x3,'r');
xlabel('time');ylabel('x(n)');
title('discrete time signal with fs>2fm');
hold on
subplot(2,2,4); plot(n3,x3)
grid;
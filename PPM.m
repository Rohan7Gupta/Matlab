% pulse position modulation
close all
clear all
clc
fc=100; %Carrier Frequency
fs=1000; % Sampling Frequency
f1=80; % Mssage Frequency
t=0:1/fs:((2/f1)-(1/fs));
x1=0.4*cos(2*pi*f1*t)+0.5;
%modulation
y1=modulate(x1,fc,fs,'ppm');% Modulator
subplot(311);
plot(x1);
axis([0 15 0 1]);
title('original signal taken mesage,f1=80,fs=1000')
subplot(312);
plot(y1);
axis([0 250 -0.2 1.2]);
title('PPM')
%demodulation
x1_recov=demod(y1,fc,fs,'ppm');% Demodulator
subplot(313);
plot(x1_recov);
title('time domain recovered, single tone,f1=80')
axis([0 15 0 1]);

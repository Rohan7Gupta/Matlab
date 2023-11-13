% pulse width modulation & demodulation
close all
clear all
clc
fc=1000; % carrier Frequecny
fs=10000; % Sampling Frequency
f1=200; % Message Signal
t=0:1/fs:((2/f1)-(1/fs));
x1=0.4*cos(2*pi*f1*t)+0.5;
%modulation
y1=modulate(x1,fc,fs,'pwm'); % Modulator
subplot(311);
plot(x1);
axis([0 50 0 1]);
title('original signal taken mesage,f1=200,fs=10000')
subplot(312);
plot(y1);
axis([0 500 -0.2 1.2]);
title('PWM')
%demodulation
x1_recov=demod(y1,fc,fs,'pwm'); % Demodulator
subplot(313);
plot(x1_recov);
title('time domain recovered, single tone,f1=200')
axis([0 50 0 1]);
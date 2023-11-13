clc;
clf;
clear all;
close all;
%% Time Domain Square/Sawtooth Wave
f = input('\nEnter the frequency of square wave(in Hz): '); % Create a sine wave of f Hz.
Fs = 20*f; % Sampling frequency
t = 0:1/Fs:5/f; % Time vector upto 5 cycles
x = square(2*pi*t*f); % Generation of square wave
% x = sawtooth(2*pi*50*t);% Generation of sawtooth wave
min_x=-1/f; % Min xlabel range of plot
max_x=6/f; % Max xlabel range of plot
min_y=min(x)-1; % Min ylabel range of plot
max_y=max(x)+1; % Max ylabel range of plot

%% Frequency Domain Analysis
nfft = 1024; % Length of FFT
% Take fft, padding with zeros so that length(X) is equal to nfft
X = fft(x,nfft);
% FFT is symmetric, throw away second half
X = X(1:nfft/2);
% Take the magnitude of fft of x
mx = abs(X);
% Frequency vector
f = (0:nfft/2-1)*Fs/nfft; % Generate the plot, title and labels.
%% Time Domain Plot
figure(1)
plot(t,x,'LineWidth', 2);
axis([min_x max_x min_y max_y]);
grid on;
title('Square Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');
%% Frequency Domain Plot
figure(2)
plot(f,mx,'LineWidth', 2);
axis([min(f)-5 max(f)+5 min(mx)-1 max(mx)+1])
grid on;
title('Power Spectrum of a Square Wave');
xlabel('Frequency (Hz)');
ylabel('Power');
clc;
clf;
clear all;
close all;
%% Parameter initialization
fundFreq = input('\nEnter the Fundamental frequency (in Hz): '); % Fundamental frequency of Sine wave in Hz, say 500
nHar=input('\nEnter the number of harmonics: ');% say, 8
nfft = 2048; % Length of FFT
cycleIndex = 2;% Number of cycles to be considered for plotting
fHarIndex=5; % First harmonics is the fHarIndex times of the fundamental frequency
stepIndex=10; % The difference between two consecutive harmonics is stepIndex time fundamental frequency
%% Other Parameter calculation
fHar=(fHarIndex:stepIndex:(stepIndex*nHar-fHarIndex))*fundFreq;
Fs = 20*max(fHar); % Sampling frequency
t = 0:1/Fs:cycleIndex/fundFreq; % Time vector upto two cycles
%% Generation of Time domain Signal
x=sin(2*pi*fundFreq*t);
for i=1:nHar
x=x+sin(2*pi*fHar(i)*t); % Generation of the signal
end
%% Frequency Domain Analysis also known as Spectrum Analysis
% Take fft, padding with zeros so that length(X) is equal to nfft
X = fft(x,nfft);
% FFT is symmetric, throw away second half
X = X(1:nfft/2);
% Take the magnitude of fft of x
mx = abs(X);
% Frequency vector
f = (0:nfft/2-1)*Fs/nfft;
%% Time Domain Plot
figure(1);
plot(t,x);
axis([0 cycleIndex/fundFreq min(x)-2 max(x)+2]);
grid on;
title('Sine Wave Signal');
xlabel('Time (s)');
ylabel('Amplitude');
%% Frequency Domain Plot
figure(2);
semilogx(f,mx);
%grid on
title('Power Spectrum of a Sine Wave');
xlabel('Frequency (Hz)');
ylabel('Power');
%% Display
fprintf('\nFundamental Frequency = %g Hz\n\n', fundFreq);
fprintf('Harmonics are(in Hz): ');disp(fHar);
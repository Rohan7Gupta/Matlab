% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector from 0 to 1 second
f = 100;              % Frequency of the sine wave (Hz)
nfft = 2048;
% Generate sine wave without using cosine function
y = imag(exp(1i * 2 * pi * f * t));

% Plot
figure;
subplot(2,1,1);
plot(t, y);
title('Sine Wave without Cosine Function');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

Y=fft(y,nfft);
Y=Y(1:nfft/2); %fft symmetric
magY=abs(Y);
f = (0:nfft/2-1)*Fs/nfft;


subplot(2,1,2);
semilogx(f,magY);
title('Sine Wave in freq Domain');
xlabel('freq (hz)');
ylabel('power');

grid on;
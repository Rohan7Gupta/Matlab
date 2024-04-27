% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector from 0 to 1 second
f = 100;              % Frequency of the sine wave (Hz)
nfft=2048;

% Generate sine wave
y = 5*sin(2*pi*f*t);

% Plot in time domain
subplot(2, 1, 1);
plot(t, y);
title('Sine Wave in Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude');

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
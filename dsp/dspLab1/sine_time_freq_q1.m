% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector from 0 to 1 second
f = 100;              % Frequency of the sine wave (Hz)

% Generate sine wave
y = sin(2*pi*f*t);

% Plot in time domain
figure;
subplot(2, 1, 1);
plot(t, y);
title('Sine Wave in Time Domain');
xlabel('Time (seconds)');
ylabel('Amplitude');


% Plot in frequency domain
N = length(y);
frequencies = Fs*(0:(N-1))/N;  % Frequency axis for FFT

Y = fft(y);

subplot(2, 1, 2);
plot(frequencies, abs(Y));
title('Sine Wave in Frequency Domain');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Adjust the axis limits for better visibility
axis([0 Fs/2 0 max(abs(Y))]);



% Show grid
grid on;

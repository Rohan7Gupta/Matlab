% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:2;          % Time vector from 0 to 2 seconds
f = 5;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
square_wave = square(2 * pi * f * t);
y = filter(ones(1, 10) / 10, 1, square_wave);

% Plot
figure;
plot(t, y);
title('Sine Wave without sin or cos Functions (Square Wave Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

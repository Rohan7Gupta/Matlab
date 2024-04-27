% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:2;          % Time vector from 0 to 2 seconds
f = 5;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
y = 0.84 * t - 0.14 * t.^3;

% Plot
figure;
plot(t, y);
title('Sine Wave without sin or cos Functions (Polynomial Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

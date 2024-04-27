% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector from 0 to 1 second
f = 1000;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
y = t - (t.^3)/(3*factorial(3)) + (t.^5)/(5*factorial(5)) - (t.^7)/(7*factorial(7));

% Scale and shift to match the amplitude and frequency
y = y * (2*pi*f) / (2*pi*f)^7;

% Plot
figure;
plot(t, y);
title('Sine Wave without sin or cos Functions');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;
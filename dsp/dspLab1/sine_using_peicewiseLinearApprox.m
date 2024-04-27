% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:2;          % Time vector from 0 to 2 seconds
f = 5;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
y = zeros(size(t));

for k = 1:2:99
    y = y + (4/pi) * sin(2 * pi * k * f * t) / k;
end

% Plot
figure;
plot(t, y);
title('Sine Wave without sin or cos Functions (Piecewise Linear Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

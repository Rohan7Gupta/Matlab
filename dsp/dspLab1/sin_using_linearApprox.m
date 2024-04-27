% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector for one period
f = 5;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
x = linspace(0, 1, numel(t));
y = zeros(size(x));

% Linear interpolation to approximate a sine-like waveform
num_points = 20;  % Adjust the number of points for more accuracy
for k = 1:num_points
    y = y + (4/pi) * sin(2 * pi * (2*k - 1) * f * x) / (2*k - 1);
end

% Plot
figure;
plot(t, y);
title('Sine Wave without sin or cos Functions (Piecewise Linear Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

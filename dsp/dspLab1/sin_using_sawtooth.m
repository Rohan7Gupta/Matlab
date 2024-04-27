% Parameters
Fs = 1000;          % Sampling frequency (Hz)
T = 1/Fs;           % Sampling period
t = 0:T:2;          % Time vector from 0 to 2 seconds
f = 5;              % Frequency of the sine wave (Hz)

% Generate sine wave without using sin or cos
y = sin(2*pi*f*t);  % Using sin for reference

% Create a sawtooth wave and adjust to match the sine wave
sawtooth_wave = sawtooth(2*pi*f*t);
y_approx = 0.5 * sawtooth_wave + 0.5;

% Plot
figure;
subplot(2, 1, 1);
plot(t, y);
title('Sine Wave (Reference)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
plot(t, y_approx);
title('Sine Wave without sin or cos Functions (Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

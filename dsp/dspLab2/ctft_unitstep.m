Ts=1/100;
t = -10:Ts:10;
unitstep = t>=0;%creates a logical array unitstep where each element is true if the corresponding element in the array t is greater than or equal to zero, and false otherwise.
subplot(3,1,1);
plot(t,unitstep,'LineWidth', 2);
set(gca, 'YTick', [0 1]); 
xlim([-5, 5]); % Set limits for x-axis
ylim([-0.2, 1.2]); % Set limits for y-axis
xlabel('Time');
ylabel('Unit Step Function');
title('Unit Step Function time doamin');
grid on;

Fs=1/Ts;
% Compute the Fourier Transform using FFT
U = fft(unitstep)/Fs; % Normalize by sampling frequency

% Frequency vector
N = length(U);
Omega = linspace(-4*pi, 4*pi, N);

% Plot the magnitude of the Fourier Transform
subplot(3,1,2);
plot(Omega, fftshift(abs(U)), 'LineWidth', 2);
title('Magnitude of CTFT of Unit Step Function (Using FFT)');
xlabel('\omega');
ylabel('|U(j\omega)|');
grid on;

% Define symbolic variables
syms omega;

% Define the function
f = omega * dirac(omega) + 1/(1i * omega);

% Define the range of omega values
omega_values = linspace(-10, 10, 1000);

% Evaluate the function at different omega values
f_values = subs(f, omega, omega_values);

% Plot the function
subplot(3,1,3);
plot(omega_values, real(f_values), 'b', 'LineWidth', 2);
hold on;
plot(omega_values, imag(f_values), 'r', 'LineWidth', 2);
hold off;

title('Plot of omega*impulse(omega) + 1/(i*omega)');
xlabel('\omega');
ylabel('Function Value');
legend('Real Part', 'Imaginary Part');
grid on;


%plot(f, abs(y), 'LineWidth', 2);
%xlabel('Frequency (Hz)');
%ylabel('|CTFT|');
%title('Magnitude of CTFT of Unit Step Function');
%grid on;
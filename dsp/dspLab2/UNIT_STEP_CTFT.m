syms t omega;
u = heaviside(t); % Define the unit step function

% Compute the Fourier Transform
U = fourier(u, t, omega);

% Convert the symbolic expression to a MATLAB function
U_function = matlabFunction(U);

% Define a range of frequencies
omega_values = linspace(-10, 10, 1000);

% Evaluate the Fourier Transform function at different frequencies
U_values = U_function(omega_values);

% Plot the magnitude of the Fourier Transform
plot(omega_values, abs(U_values), 'LineWidth', 2);
title('Magnitude of CTFT of Unit Step Function');
xlabel('\omega');
ylabel('|U(j\omega)|');
grid on;

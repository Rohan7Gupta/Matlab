% Define the analog filter coefficients
num_analog = [1]; % Numerator coefficients
den_analog =conv( [1, 1],[1, 2]); % Denominator coefficients

% Set the sampling frequency (adjust as needed)
Fs = 5; % Sampling frequency in Hz

% Impulse invariance method
[num_digital, den_digital] = impinvar(num_analog, den_analog, Fs);

% Define symbolic variable
z = sym('z');
s = sym('s');

% Define analog and digital transfer functions as polynomials
H_analog_poly = poly2sym(num_analog, s) / poly2sym(den_analog, s);
H_digital_poly = poly2sym(num_digital, z) / poly2sym(den_digital, z);

% Display transfer functions in polynomial form
disp('Analog Transfer Function:');
disp(H_analog_poly);
disp('Digital Transfer Function:');
disp(H_digital_poly);

% Display the coefficients of the digital filter
disp('Numerator coefficients of the digital filter:');
disp(num_digital);
disp('Denominator coefficients of the digital filter:');
disp(den_digital);

% Display zeros and poles
disp('Zeros of the digital filter:');
disp(roots(num_digital));
disp('Poles of the digital filter:');
disp(roots(den_digital));

% Plot zeros and poles in Z-domain
figure;
zplane(num_digital, den_digital);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;
set(gca,'XMinorGrid','on','YMinorGrid','on');

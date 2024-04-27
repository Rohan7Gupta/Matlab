clc;
close all;
clear;
%  Define the coefficients of the continuous-time transfer function in s-domain
num_ct = [1 0.1]; % Numerator coefficients
den_ct = [1 0.2 9.01]; % Denominator coefficients

% Partial fraction decomposition
[r, p, ~] = residue(num_ct, den_ct);

% Sampling period
Ts = 0.2; % Sampling period

% Calculate the poles and residues in the z-domain
alpha = exp(p * Ts);%taking approximation as in calculation
poles_z = alpha;

% Convert the poles and residues to z-domain numerator and denominator coefficients
numerator_z = poly(sum(r .* poles_z));%remove poly if only 1 in numerator
denominator_z = poly(poles_z);

% Define symbolic variable
z = sym('z');
s = sym('s');

% Define analog and digital transfer functions as polynomials
H_analog_poly = poly2sym(num_ct, s) / poly2sym(den_ct, s);
H_digital_poly = poly2sym(numerator_z, z) / poly2sym(denominator_z, z);

% Display transfer functions in polynomial form
disp('Analog Transfer Function:');
disp(H_analog_poly);
disp('Digital Transfer Function:');
disp(H_digital_poly);

% Display the coefficients of the z-transform
disp('Numerator coefficients of the z-transform:');
disp(numerator_z);
disp('Denominator coefficients of the z-transform:');
disp(denominator_z);

% Display zeros and poles
disp('Zeros of the digital filter:');
disp(roots(numerator_z));
disp('Poles of the digital filter:');
disp(roots(denominator_z));

% Plot zeros and poles in Z-domain
figure;
zplane(numerator_z, denominator_z);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;
set(gca,'XMinorGrid','on','YMinorGrid','on');


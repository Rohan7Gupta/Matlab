% Define symbolic variable for Laplace domain
syms s t z;

% Define transfer function numerator and denominator
numerator = s+0.1;
denominator = s^2 + 0.2*s + 16.01;

% Define sampling period
Ts = 0.5; % Example sampling period (seconds)

% Impulse invariant transformation
s = (2/Ts) * (1 - z^(-1)) / (1 + z^(-1));

% Substituting into the transfer function
H_s = numerator / denominator; % Analog transfer function
H_z = subs(H_s, s); % Substituting s with the digital equivalent


% Display the digital transfer function
disp('Digital Transfer Function:');
disp(H_z);

% Display the transfer function in the z-domain
disp('Transfer Function in Z-domain:');
disp(H_z);

% Extract zeros and poles from the Z-domain transfer function
[num, den] = numden(H_z);
disp(num);
disp(den);
zeros_Z = roots(sym2poly(num));
poles_Z = roots(sym2poly(den));

% Print zeros and poles
disp('Zeros in Z-domain:');
disp(zeros_Z);
disp('Poles in Z-domain:');
disp(poles_Z);

% Plot zeros and poles in Z-domain
figure;
zplane(zeros_Z, poles_Z);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;
set(gca,'XMinorGrid','on','YMinorGrid','on');

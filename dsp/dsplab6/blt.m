clear;
clc;
syms s z;

numerator = s + 0.1;
denominator = s^2 + 0.2*s + 16.01;

Ts = 0.5;

s_transformed = (2/Ts) * ((z-1) / (z+1));

H_s = numerator / denominator; % Analog tf
H_z = simplify(subs(H_s, s, s_transformed)); % digital tf

disp('Analog Transfer Function:');
disp(H_s);

disp('Transfer Function in Z-domain:');
disp(H_z);

[num, den] = numden(H_z);
zeros_Z = roots(sym2poly(num));
poles_Z = roots(sym2poly(den));

disp('Zeros in Z-domain:');
disp(zeros_Z);
disp('Poles in Z-domain:');
disp(poles_Z);

figure;
zplane(zeros_Z, poles_Z);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;
set(gca,'XMinorGrid','on','YMinorGrid','on');

clear;
clc;
syms s z;
N = input('Enter the order of the filter: ');
cutoff_freq = input('Enter the cutoff frequency (Hz): ');
fs = input('Enter the sampling frequency (Hz): ');

digital_cutoff_rad = 2*pi*cutoff_freq/fs;
analog_cutoff = 2*fs*tan(digital_cutoff_rad/2);

poles_k = zeros(1,2*N);
j = 1;
for k = 0:N-1
    poles_k(j) = analog_cutoff * exp((pi*1i*(N+2*k+1)/(2*N)));
    j = j + 1;
    poles_k(j) = -analog_cutoff * exp((pi*1i*(N+2*k+1)/(2*N)));
    j = j + 1;
end

poles = zeros (1,N);
k=1;
for j = 1:2*N
    if poles_k(j) < 0
        poles(k)=poles_k(j);
        k=k+1;
    end
end

disp('poles in s')
disp(poles)

den = 1;
for k = 1 : N/2
    b_k = 2*sin((2*k-1)/(2*N))*pi;
    den = den * (s^2) + analog_cutoff * b_k * s + (analog_cutoff)^2 ;
end

denominator = den;
numerator = analog_cutoff^N;

H_s = (numerator/denominator);

disp('analog tf');
disp(H_s);

Ts = 1/fs;
s_transformed = (2/Ts) * ((z-1) / (z+1));

H_z = simplify(subs(H_s, s, s_transformed)); % digital tf

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

    

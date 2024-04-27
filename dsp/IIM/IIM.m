% Define symbolic variable for Laplace domain
syms s t z;

% Define transfer function numerator and denominator
numerator = 1;
denominator = (s + 1) * (s + 2);

% Define the transfer function
H_s = numerator / denominator;

% Display the transfer function
disp('Transfer Function in Laplace Domain:');
disp(H_s);

% Perform inverse Laplace transform
h_t = ilaplace(H_s);

% Display the time-domain transfer function
disp('Time-Domain Transfer Function:');
disp(h_t);


% Define sample time
Ts = 0.2; % Sample time (seconds)

% Sample the time-domain transfer function
h_ts = subs(h_t, t, Ts);

% Display the sampled time-domain transfer function
disp('Sampled Time-Domain Transfer Function:');
disp(h_ts);

% Convert the time-domain transfer function to the z-domain
H_z = ztrans(h_ts, t, z);

% Display the transfer function in the z-domain
disp('Transfer Function in Z-domain:');
disp(H_z);

% Extract zeros and poles from the Z-domain transfer function
[num, den] = numden(H_z);
zeros_Z = roots(sym2poly(num));
poles_Z = roots(sym2poly(den));

% Print zeros and poles
disp('Zeros in Z-domain:');
disp(zeros_Z);
disp('Poles in Z-domain:');
disp(poles_Z);

% Plot zeros and poles in Z-domain
figure;
zplane(zeros_Z,poles_Z);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;
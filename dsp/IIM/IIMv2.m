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



% Separate the terms
terms = children(h_ts);

% Display separated terms
disp('Separated Terms:');
disp(terms);

p=length(terms);

H_z_terms = sym(zeros(1, p)); % Assuming p is defined

% Loop to compute the terms
for i = 1:p
    H_z_term = 0; % Initialize the term for each iteration
    for k = 1:100
        % Compute the term symbolically
        H_z_term = H_z_term + (terms(i) * z^(-1))^(k+1);
    end
    % Store the symbolic term in the array
    H_z_terms(i) = H_z_term;
end

% Display the computed terms
disp('Computed Terms:');
disp(H_z_terms);

% Sum up the terms
H_z = sum(H_z_terms);

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
zplane(zeros_Z, poles_Z);
title('Zeros and Poles in Z-domain');
legend('Zeros', 'Poles');
grid on;

% Plot zeros and poles in Z-plane
figure;
scatter(real(poles_Z), imag(poles_Z), 'rx'); % Plot poles as red 'x'
hold on;
scatter(real(zeros_Z), imag(zeros_Z), 'bo'); % Plot zeros as blue 'o'
title('Zeros and Poles in Z-plane');
xlabel('Real');
ylabel('Imaginary');
grid on;
legend('Poles', 'Zeros');

% Label zeros and poles with coordinates
hold on;
for i = 1:length(zeros_Z)
    text(real(zeros_Z(i)), imag(zeros_Z(i)), ['Zero ', num2str(real(zeros_Z(i))), ', ', num2str(imag(zeros_Z(i)))], 'Color', 'blue', 'FontSize', 10);
end

for i = 1:length(poles_Z)
    text(real(poles_Z(i)), imag(poles_Z(i)), ['Pole ', num2str(real(poles_Z(i))), ', ', num2str(imag(poles_Z(i)))], 'Color', 'red', 'FontSize', 10);
end
hold off;
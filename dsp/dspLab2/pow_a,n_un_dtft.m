N=21;
x=ones(1,N);
n=0:1:N-1;
y=(2^n)*x;
subplot(2,1,1);
s=stem(n,y);
s.Color = 'green';
xlim([-10, 21]); % Set limits for x-axis
ylim([-0.2, 1.2]); % Set limits for y-axis
xlabel('n'),ylabel('x(n)');
title('Unit Step Sequence')
grid on;

X = fft(y);

% Compute the frequency axis for the DTFT
omega = linspace(-pi, pi, N);

% Plot the magnitude of the DTFT
subplot(2,1,2);
plot(omega, fftshift(abs(X)), 'LineWidth', 2, 'Color', 'green');
xlabel('\omega');
ylabel('|X(e^{j\omega})|');
title('Magnitude of DTFT of Unit Step Function');
grid on;
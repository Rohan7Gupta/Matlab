
sine = @(x) sum((x.^[1:2:18]) .* -((-1).^[1:9]) ./ factorial([1:2:18]));% Define anonymous function to approximate sine using Taylor series
angl = linspace(-2*pi, 2*pi, 500);% Generate an array of angles from -2*pi to 2*pi
for k1 = 1:length(angl) % Evaluate the sine function for each angle using the defined anonymous function
    sineval(k1) = sine(angl(k1));
end

nfft=2048;
% Plot time domain
figure;
subplot(2,1,1);
plot(angl, sineval);
title('Sine Wave without sin or cos Functions (Polynomial Approximation)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

Y=fft(y,nfft);
Y=Y(1:nfft/2); %fft symmetric
magY=abs(Y);
f = (0:nfft/2-1)*Fs/nfft;

%spectral plot
subplot(2,1,2);
plot(f,magY);
title('Sine Wave in freq Domain');
xlabel('freq (hz)');
ylabel('power');

grid on;
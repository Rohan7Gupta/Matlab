clear all;
clc;
L1 = input('Enter number of data points in x[n]: ');

x1 = zeros(L1, 1); %input seq 1
for i = 1:L1
    x1(i) = input(['Enter value for x[n](', num2str(i), '): ']);
end

L2 = input('Enter number of data points in h[n]: ');

x2 = zeros(L2, 1); %input seq 2
for i = 1:L2
    x2(i) = input(['Enter value for h[n](', num2str(i), '): ']);
end

disp('Input sequence x[n]:');
disp(x1);
disp('impulse sequence h[n]:');
disp(x2);

N=max(L1,L2);

%DFT of x1
X1 = zeros(N, 1);%dft seq
for k = 0:N-1
    for n = 0:N-1
        X1(k+1) = X1(k+1) + x1(n+1)*exp(-j*2*pi*n*k/N);
    end
end
%disp('DFT coefficients of x1:');
%disp(X1);

%DFT of x2
X2 = zeros(N, 1);%dft seq
for k = 0:N-1
    for n = 0:N-1
        X2(k+1) = X2(k+1) + x2(n+1)*exp(-j*2*pi*n*k/N);
    end
end
%disp('DFT coefficients of x2:');
%disp(X2);

Y=X1.*X2;

y=zeros(N,1);
%IDFT of Y
for n = 0:N-1
    for k = 0:N-1
        y(n+1) = y(n+1) + (1/N)*Y(k+1)*exp(j*2*pi*n*k/N);
    end
end
disp('circular convolution coefficient');
disp(y);

subplot(3,1,1);
plot(abs(x1));
xlabel('[n]');
ylabel('mag');
title('input seq x[n]');

subplot(3,1,2);
plot(abs(x2));
xlabel('[n]');
ylabel('mag');
title('impulse seq h[n]');

subplot(3,1,3);
plot(abs(y));
xlabel('[n]');
ylabel('mag');
title('x[n] h[n] circular convolution');

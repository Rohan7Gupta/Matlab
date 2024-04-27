N = input('Enter number of dft points N: ');
L = input('Enter number of data points L: ');

x = zeros(L, 1); %input seq
for i = 1:L
    x(i) = input(['Enter value for x(', num2str(i), '): ']);
end
if(N<L)
    error('N should always be greater / equal to L');
end
disp('Input sequence:');
disp(x);

X = zeros(N, 1);%dft seq
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1)*exp(-j*2*pi*n*k/N);
    end
end
disp('DFT coefficients:');
disp(X);

Y=zeros(N,1);%idft seq
for n = 0:N-1
    for k = 0:N-1
        Y(n+1) = Y(n+1) + (1/N)*X(k+1)*exp(j*2*pi*n*k/N);
    end
end
disp('IDFT coefficient');
disp(Y);

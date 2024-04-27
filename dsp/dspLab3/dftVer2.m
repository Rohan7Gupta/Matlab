% Get user input for the sequence
sequence = input('Enter the sequence (comma-separated): ', 's');
sequence = str2num(sequence);

% Calculate the DFT
N = length(sequence);
n = 0:N-1;
k = n.';
WN = exp(-1i*2*pi/N);
WN_matrix = WN .^ (n*k);
dft_coefficients = N * WN_matrix * sequence.'; % Adjust the scaling factor

% Print the DFT coefficients
disp('DFT Coefficients:');
disp(dft_coefficients);

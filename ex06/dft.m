function F = dft(f)
%DFT
%
%   See also fft, ifft, fft2, fftn, fftw.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get size of input function
n = numel(f);

% init omega variable of dft formula
omega = zeros(1, n + 1);

% preallocate values for omega
for ii = 1:n+1
    omega(ii + 1) = (2 * ii * pi) / n;
end

% sum up fourier coefficients
for ii=1:n
    F_tmp = 0;
    for jj=1:n
        F_tmp = F_tmp + (f(jj) * exp(-1i * omega(ii) * (jj - 1)));
    end
    F(ii) = F_tmp;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

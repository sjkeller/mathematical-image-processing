function f = idft(F)
%IDFT
%
%   See also fft, ifft, fft2, fftn, fftw.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get size of input function
n = numel(F);

% init omega variable of dft formula
omega = zeros(1, n + 1);

% preallocate values for omega
for ii = 1:n+1
    omega(ii + 1) = (2 * ii * pi) / n;
end

% sum up inverse fourier coefficients
for ii=1:4
    F_tmp = 0;
    for jj=1:n
        F_tmp = F_tmp + (F(jj) * exp(1i * omega(jj) * (ii - 1)));
    end
    f(ii) = F_tmp / n;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

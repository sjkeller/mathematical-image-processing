function f = idft(F)
%IDFT
%
%   See also fft, ifft, fft2, fftn, fftw.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get size of input function
n = numel(F);

% init omega variable of inverse dft formula
omega = zeros(1, n + 1);

% preallocate values for omega
for ii = 1:n+1
    omega(ii + 1) = (2 * ii * pi) / n;
end

f = zeros(1, n);

% sum up inverse fourier coefficients
for ii=1:n
    f_tmp = 0;
    for jj=1:n
        f_tmp = f_tmp + (F(jj) * exp(1i * omega(jj) * (ii - 1)));
    end
    f(ii) = f_tmp / n;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

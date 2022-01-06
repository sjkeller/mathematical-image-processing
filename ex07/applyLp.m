function [B] = applyLp(A,d)
%APPLYLP apply low pass filter to image
%
%See also lowpass, highpass, bandpass, bandstop, filter.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[M, ~] = size(A);
u = false(M, M);

lower_bound = int32((M/2 + 1) - d);
upper_bound = int32((M/2 + 1) + d);

for i = lower_bound:upper_bound
    for j = lower_bound:upper_bound
       u(i, j) = true; 
    end
end

A_double = im2double(A);
F = fft2(A_double);
F_shifted = fftshift(F);
F_filtered_shifted = F_shifted .*  u;
F_filtered = ifftshift(F_filtered_shifted);  %fftshift is not it's own inverse -> ifftshift (ex. uneven array)

g_double = real(ifft2(F_filtered));
B = im2uint8(g_double);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
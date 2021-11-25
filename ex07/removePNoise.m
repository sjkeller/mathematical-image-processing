%REMOVEPNOISE
%
%Removes periodic noise from mandril_pnoise.png
%
%See also.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

filtered = applyLp(mandril_pnoise, 63);

figure;
surf(X,Y,log(1+abs(fftshift(fft2(mandril_pnoise)))),'EdgeColor','none');
title("Unfiltered frequencies");

M = 512;
F = fft2(mandril_pnoise);
[X, Y] = meshgrid(1:M, 1:M);

figure;
imshow(filtered);
title("Filtered image");

figure;
surf(X,Y,log(1+abs(fftshift(fft2(filtered)))),'EdgeColor','none');
title("Filtered frequencies");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
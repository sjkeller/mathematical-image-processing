%VISUALIZEFT
%
%Visualize the fourier transform of the characteristic function of a square
%
%See also.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (i)

M = 512;
d = 10;
u = false(M, M);

lower_bound = int32((M/2 + 1) - d);
upper_bound = int32((M/2 + 1) + d);

for i = lower_bound:upper_bound
    for j = lower_bound:upper_bound
       u(i, j) = true; 
    end
end

F = fft2(u);

[X, Y] = meshgrid(1:M, 1:M);

figure;
surf(X,Y,log(1+abs(fftshift(F))),'EdgeColor','none');
title("Surf shifted");

figure;
imagesc(log(1+abs(fftshift(F)))); colormap(gray);
title("imagesc shifted");

figure;
surf(X,Y,log(1+abs((F))),'EdgeColor','none');
title("Surf non-shifted");

figure;
imagesc(log(1+abs((F)))); colormap(gray);
title("imagesc non-shifted");

% (ii) The same is plotted, but shifted by the half length of a period on
% both axes, since the image is periodical.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
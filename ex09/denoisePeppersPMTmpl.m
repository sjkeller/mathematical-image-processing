%DENOISEPEPPERS Denoise a standard image
%
%See also.

image = imread("peppers_gray.png");
noise = imnoise(image,'gaussian', 0, 0.01);

imshow(noise);

denoise = noise;

for i=0:100
    denoise = peronaMalikSteps(denoise, 0.05, 10, 0.1);
    imshow(denoise);
    pause(0.1)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
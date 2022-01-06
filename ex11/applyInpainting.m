%APPLYINPAINTING
%
% See also.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mandril_img = imread("mandril_defect.png");
R = [253 260 51 264];
niter=50;
d = 29;

% nose and hair have different frequencies => compromise between both
% needed.

mandril_new_img = inpaintRect(mandril_img, R, d, niter);

figure(1)
imshow(mandril_img)

figure(2)
imshow(mandril_new_img)

% for finding optimal d 
% for ii = 1:20
%     d = ii*5;
%     mandril_new_img = inpaintRect(mandril_img, R, d, niter);
%     figure(2)
%     imshow(mandril_new_img)
%     drawnow
%     pause(1)
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban
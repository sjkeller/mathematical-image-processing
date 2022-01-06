function B = inpaintRect(A, R, d, niter)
%INPAINTRECT
%
% See also.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A_double = im2double(A);

rect_img = A_double(R(1):R(2),R(3):R(4));
rect_border = A_double(R(1)-1:R(2)+1,R(3)-1:R(4)+1);
rect_border(2:end-1, 2:end-1) = rect_border(2:end-1, 2:end-1) - rect_img;
mean_border = sum(rect_border, 'all')/(2*(R(2)-R(1)+3) + 2*(R(4)-R(3)+1));

A_iter = A_double;
A_iter(R(1):R(2),R(3):R(4)) = mean_border;

for ii = 1: niter
    A_temp = im2double(applyLp(A_iter,d));
    A_iter(R(1):R(2),R(3):R(4)) = A_temp(R(1):R(2),R(3):R(4));
end

B = im2uint8(A_iter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% by Sergej Keller, Lennart Scherz, Pascal Urban

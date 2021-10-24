function [Ap,p] = padImg(A)
%PADIMG pad image.
%
% [Ap,p] = PADIMG(A) pads image A with enough zeros so that rotation
% is within the frame of zeros is possible. It returns the number of zeros
% p in x and y direction.
%
%See also padarray.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# calculate horizontal padding
p1 = ceil( (sqrt(size(A,1).^2 + size(A,2).^2) - size(A,1) ) / 2);

# calculate vertical padding
p2 = ceil( (sqrt(size(A,1).^2 + size(A,2).^2) - size(A,2) ) / 2);

# use greater padding size
p = max(p1, p2);

# build image parts
top = zeros(p, size(A,2) + p.*2, size(A,3));
side = zeros(size(A,1), p, size(A,3));
middle = [side, A, side];

# place parts together for final image
Ap = [top;middle; top];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%by Sergej Keller, Lennart Scherz, Pascal Urban


f = imread('peppers_light', 'png');

f = im2double(f);
[m,n]=size(f);

A = [(repelem(1:m,1,n).').^2, repmat((1:n).',m,1), ones(m*n,1)];
z = f(:);

parameters = A\z;
image_orig = f - reshape(A*parameters,m,n);

image_orig = image_orig./max(image_orig,[],'all');

imshow(im2uint8(image_orig))

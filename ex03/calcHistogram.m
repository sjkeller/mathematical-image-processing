function [H] = calcHistogram(A)
%CALCHISTOGRAM   Calculate occurences of light intensities {0,...,255}.
%
%   See also histogram, histogram2, histcounts, histcounts2, imhist.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% get color dimension and initialize histogram vector
d = size(A,3);
H = zeros(d,256);

% iterate through image an sum up grayscale shades
for c=0:255
    H(:, c + 1) = reshape(sum(A == c, [1,2]),d,1,1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

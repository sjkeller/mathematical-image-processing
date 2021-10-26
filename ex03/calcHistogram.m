function [H] = calcHistogram(A)
%CALCHISTOGRAM   Calculate occurences of light intensities {0,...,255}.
%
%   See also histogram, histogram2, histcounts, histcounts2, imhist.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initialize histogram vector
H = zeros(256,1);

% iterate through image an sum up grayscale shades
for c=0:255
    H(c + 1) = sum(A == c, "all");
end
% YOUR CODE HERE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by NAME

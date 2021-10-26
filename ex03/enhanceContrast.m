function [B] = enhanceContrast(A,method)
%ENHANCECONTRAST
%
%
%See also adapthisteq, histogram, histeq, imadjust, imcontrast, imhistmatchn.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B = zeros(size(A));
[m,n,d] = size(A);
N = 255;

switch method

    case "histEqualization"

        H = calcHistogram(A);
        ohm = numel(A);
       
        for t=1:d
            for i=1:m
                for j=1:n
                    B(i,j,t) = round(N/ohm * sum(H(t,1:(A(i,j,t)+1))));
                end
            end
        end

end        

% YOUR CODE HERE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

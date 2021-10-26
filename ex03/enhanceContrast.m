function [B] = enhanceContrast(A, method)
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

    case "contrastStretching"        
        k_min = min(A(:));        
        k_max = max(A(:));
                
        for x=1:size(A,1)
            for y=1:size(A,2)
                k = A(x, y);
                B(x, y) = round((k - k_min) / (k_max - k_min) * N);
            end
        end
        
        
    otherwise
        disp("error method not found: " + method);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

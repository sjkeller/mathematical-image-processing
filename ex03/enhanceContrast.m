function [B] = enhanceContrast(A, method)
%ENHANCECONTRAST
%
%
%See also adapthisteq, histogram, histeq, imadjust, imcontrast, imhistmatchn.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

B = zeros(size(A));

switch method 
    case "contrastStretching"        
        k_min = min(A(:));        
        k_max = max(A(:));
        
        N = 255;
        
        for x=1:size(A,1)
            for y=1:size(A,2)
                k = A(x, y);
                B(x, y) = round((k - k_min) / (k_max - k_min) * N);
            end
        end
        
    case "histEqualization"
        
    otherwise
        disp("error method not found: " + method);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

function [B] = grayscaleImg(A,method)
%GRAYSCALEIMG   Convert RGB image to grayscale.
%   B = GRAYSCALEIMG(A,METHOD) converts the RGB image to the grayscale 
%   intensity 8-bit image B using algorithm METHOD.
%
%   METHOD is a string that may be:
%
%   METHOD         DESCRIPTION
%   'average'      use arithmetic mean of r, g and b value 
%   'luma'         sum weighted colors based on human eye reception
%   'digicam'      use only green color channel
%
%   See also rgb2gray.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    red   = A(:,:,1);   % get red pane
    green = A(:,:,2);   % get green pane
    blue  = A(:,:,3);   % get blue pane

    z_dim = 3;
    
    B = zeros(size(A,1), size(A,1), z_dim);    % preallocate B matrix 

    switch(lower(method))

        % a.)
        case 'average'
            B = repmat(1/3 * (red + green + blue),1,1,z_dim);

        % b.)
        case 'luma'
            B = repmat(0.2126 * red + 0.7152 * green + 0.0722 *  blue,1,1,z_dim);

        % c.)
        case 'desaturation'
            B = repmat(1/2 * (max(A,[],3) + min(A, [],3)),1,1,z_dim);   % midpoint of min max in rgb triplets

        % d.)
        case 'digicam'
            B = repmat(green,1,1,z_dim);    % take green pane values as grey

        % e.)
        case '4bit'
            A = repmat(1/3 * (red + green + blue),1,1,z_dim);   % get average
            B = repmat((A(:,:,1)/(2^4+1))*(2^4+1),1,1,z_dim);   % convert to 4 bit
            
        % f.)
        case'unknown'

    end
    B = round(B);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%by Sergej Keller, Lennart Scherz, Pascal Urban

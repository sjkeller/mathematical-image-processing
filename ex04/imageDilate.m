function [V] = imageDilate(U,B)
%imageDilate Perform morphological dilation.
%
%
%See also imdilate, imerode, imopen, imclose.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

V = zeros(size(U));

mid_x = median(size(B,1));
mid_y = median(size(B,2));

% iterate thorugh whole image U
for x=1:size(U,1)
    for y=1:size(U,2)

        % check if pixel not white 
        if U(x,y) > 0

            % iterate around structure element B area inside image U
            for i=1:size(B,1)
                for j=1:size(B,2)
                    
                    % if indices are not out of bound apply grayscale color
                    if i-mid_x > 0 && j-mid_y > 0
                        U(i-mid_x, j-mid_y) = U(x,y);
                    end

                end
            end

        end

    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

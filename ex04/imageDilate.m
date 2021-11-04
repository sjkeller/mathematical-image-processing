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
        if U(x,y) < 255

            % iterate around structure element B area inside image U
            for i=1:size(B,1)
                for j=1:size(B,2)
                    
                    % if indices are not out of bound apply grayscale color
                    if x-mid_x > 0 && y-mid_y > 0
                        V(x-mid_x+i, y-mid_y+j) = U(x,y);
                    end

                end
            end

        end

    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%by Sergej Keller, Lennart Scherz, Pascal Urban

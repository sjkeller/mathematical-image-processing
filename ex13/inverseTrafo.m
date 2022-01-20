function u_orig = inverseTrafo(parameters, u_dist)

    a = parameters(1);
    b = parameters(2);
    c = parameters(3);

    [m,n]= size(u_dist);
    u_orig = zeros(m,n);
    for ii =1:m
        for jj = 1:n

            coords_right = round([ii,a*ii^2+b*ii+c+jj]);

            if(coords_right(1)>0 && coords_right(2)>0 && coords_right(1)<=m&& coords_right(2)<=n)
                u_orig(ii,jj) = u_dist(coords_right(1),coords_right(2));
            end
        end
    end
    u_orig = uint8(u_orig);
end
function eval = target_func(parameters, left_coords, right_coords)

    a = parameters(1);
    b = parameters(2);
    c = parameters(3);

    left_coords_trafo = zeros(size(left_coords));
    for ii = 1:size(left_coords)
        left_coords_trafo(ii,:) = [left_coords(ii,1), a*left_coords(ii,1)^2 + b*left_coords(ii,1)+c+left_coords(ii,2)];
    end

    eval = norm(right_coords - left_coords_trafo);
end
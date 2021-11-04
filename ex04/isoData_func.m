function f = isoData_func(t, U)
    mean_b = mean(U(U <=t));
    mean_w = mean(U(U >t));
    f = (mean_b + mean_w)/2 - t;
end

function p = predictOneVsAll(X, all_theta)

    [m n] = size(X);
    num_classes = size(all_theta, 1);

    p = zeros(m, 1);
    [m p] = max(sigmoid(X * all_theta'), [], 2);
    
end
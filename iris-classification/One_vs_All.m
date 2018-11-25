function [all_theta] = One_vs_All(X, y, num_classes, lambda)

    [m n] = size(X);
    % theta values for all the classes

    all_theta = zeros(num_classes, n);
    
    % iterate over all classes
    for i = 1:num_classes
        initial_theta = zeros(n, 1);
        options = optimset('GradObj', 'on', 'MaxIter', 50);

        [theta] = fmincg(@(t)(iris_cost(X, (y == i), t, lambda)), initial_theta, options);

        all_theta(i, :) = theta;
    end

end
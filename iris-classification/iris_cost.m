function [J grad] = iris_cost(X, y, theta, lambda)
    [m n] = size(X);
    J = 0;
    grad = zeros(size(theta));

    h_theta = sigmoid(X * theta);
    % make theta0 -> 0, cause we do not want to calculate grad for it
    theta(1) = 0;
    J = (1 / m) * (- y' * log(h_theta) - (1 - y)' * log(1 - h_theta)) ...
        + (lambda / (2 * m)) * sum(theta .^ 2);
    grad = (1 / m) * X' * (h_theta - y) + (lambda / m) * theta;

grad = grad(:);
end
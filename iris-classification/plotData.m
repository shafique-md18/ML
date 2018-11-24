function plotData(X, y)
% - Description
% This function plots the graph of the first two features of X

figure; hold on;

iris_setosa = find(y == 1);
iris_versicolor = find(y == 2);
iris_virginica = find(y == 3);

% plot iris-setosa
plot(X(iris_setosa, 1), X(iris_setosa, 2), 'ko', 'MarkerFaceColor', 'y', ...
    'MarkerSize', 7);
% plot iris-versicolor
plot(X(iris_versicolor, 1), X(iris_versicolor, 2), 'ko', 'MarkerFaceColor', 'r', ...
    'MarkerSize', 7);
% plot iris-virginica
plot(X(iris_virginica, 1), X(iris_virginica, 2), 'ko', 'MarkerFaceColor', 'b', ...
    'MarkerSize', 7);

xlabel('Sepal Length in cm');
ylabel('Sepal Width in cm');

legend('Iris-setosa', 'Iris-versicolor', 'Iris-virginica');

hold off;
end
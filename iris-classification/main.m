% This is the main driver file
% clear screen, local namespace, and figures
clear; close all; clc

% load the training data
data = load('iris.data');

X = data(:, 1:4);
% 1 corresponds to Iris-setosa
% 2 -> Iris-versicolor
% 3 -> Iris-virginica
y = data(:, 5);
num_classes = 3;
[m n] = size(X);
% ======== Plot the data set =======
fprintf('Plotting the data set...\n');
plotData(X, y);

% ======== Now calculate values for theta for One vs All =======
% Add the x0 col to X
X = [ones(m, 1) X];
theta = zeros(1, n);

fprintf('Training One-vs-All logistic regression...\n');
lambda = 0.1;

[all_theta] = One_vs_All(X, y, num_classes, lambda);

% ======== Now predict for one vs all ==========

pred = predictOneVsAll(X, all_theta);

fprintf('Training set accuracy = %f\n', mean(double(pred == y)) * 100);
% This is the main driver file
% clear screen, local namespace, and figures
clear; close all; clc

% load the training data
data = load('iris.data');

% only train only first 40 examples of each class
X = [data(1:40, 1:4); data(51:90, 1:4); data(101:140, 1:4)];
y = [data(1:40, 5); data(51:90, 5); data(101:140, 5)];

num_classes = 3;
[m n] = size(X);

% these examples will be used to test the accuracy
test_X = [data(41:50, 1:4); data(91:100, 1:4); data(141:150, 1:4)];
test_y = [data(41:50, 5); data(91:100, 5); data(141:150, 5)];
% ======== Plot the data set =======
fprintf('Plotting the data set...\n');
plotData(X, y);

% ======== Now calculate values for theta for One vs All =======
% Add the x0 col to X and test_X
X = [ones(m, 1) X];
test_X = [ones(size(test_X, 1), 1) test_X];

fprintf('Training One-vs-All logistic regression...\n');
lambda = 0.1;

[all_theta] = One_vs_All(X, y, num_classes, lambda);

% ======== Now predict for one vs all ==========

pred = predictOneVsAll(test_X, all_theta);

fprintf('Training set accuracy = %f\n', mean(double(pred == test_y)) * 100);
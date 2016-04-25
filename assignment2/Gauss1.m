function [ G ] = Gauss1( S )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scale = 2.5 * S;

xmin = -round(scale / 2);
xmax = round(scale / 2);

% X = linspace(xmin, xmax, scale);
X = xmin : xmax;

mu = mean(X);

G =  (1 / (S * sqrt(2 * pi))) * exp(-(((X - mu).^2) ./ (2 * S^2)));
% G = (1 / sqrt(2 * pi * S^2) * exp(-(X.^2)/(2 * S.^2)));
end


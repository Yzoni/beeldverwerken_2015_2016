function [ G ] = Gauss( S )
%GAUS Summary of this function goes here
%   Detailed explanation goes here
scale = 2.5 * S;

x = -round(scale / 2) : round(scale / 2);
y = -round(scale / 2) : round(scale / 2);

[X, Y] = meshgrid(x, y);

mu_x = mean(mean(X));
mu_y = mean(mean(Y));

G =  (1 / (2 * pi * S^2)) * exp(-(((X - mu_x).^2 + (Y - mu_y).^2)./(2 * S^2)));
% G = (1 / sqrt(2 * pi * S^2) * exp(-(X.^2 + Y.^2)/(2 * S.^2)))
end


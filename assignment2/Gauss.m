function [ G ] = gaus( S )
%GAUS Summary of this function goes here
%   Detailed explanation goes here
scale = 2.5 * S;

x = round(-scale / 2) : round(scale / 2);
y = round(-scale / 2) : round(scale / 2);

[X, Y] = meshgrid(x, y);

G = (1 / sqrt(2 * pi * S^2) * exp(-(X.^2 + Y.^2)/(2 * S.^2)))

end

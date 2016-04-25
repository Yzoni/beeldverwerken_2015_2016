function [ G ] = Gauss1( S )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scale = 100;

xmin = -round(scale / 2);
xmax = round(scale / 2);

X = linspace(xmin, xmax, scale);

G = (1 / sqrt(2 * pi * S.^2) * exp(-(X.^2)/(2 * S.^2)));
end

function [ D ] = Gd (f, sigma, xorder, yorder)
%GD Summary of this function goes here
%   Detailed explanation goes here

scale = 100 + (2.5 * S);

xmin = -round(scale / 2);
xmax = round(scale / 2);
X = linspace(xmin, xmax, scale);

gauss1 = Gauss1(sigma);
firstderiv = gauss1 * -(X/sigma.^2)
secondderiv = gauss1 * ((X^2/sigma.^4) - (1/sigma.^2))


if xorder == 0 && yorder == 1
	f = imfilter (f , firstderiv' , 'conv' , 'replicate' );
elseif xorder == 1 && yorder == 0
	f = imfilter (f , firstderiv , 'conv' , 'replicate' );
elseif xorder == 1 && yorder == 1
	f = imfilter (f , firstderiv , 'conv' , 'replicate' );
	f = imfilter (f , firstderiv' , 'conv' , 'replicate' );
elseif xorder == 1 && yorder == 2
	f = imfilter (f , firstderiv , 'conv' , 'replicate' );
	f = imfilter (f , secondderiv' , 'conv' , 'replicate' );
elseif xorder == 2 && yorder == 1
	f = imfilter (f , secondderiv , 'conv' , 'replicate' );
	f = imfilter (f , firstderiv' , 'conv' , 'replicate' );
elseif xorder == 2 && yorder == 2
	f = imfilter (f , secondderiv , 'conv' , 'replicate' );
	f = imfilter (f , secondderiv' , 'conv' , 'replicate' );
else
	f = None;
end


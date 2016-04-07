function [ resizedImage ] = addBorder( image, Mfactor, method )
%ADDBORDER Summary of this function goes here
%   Detailed explanation goes here
[imageSizeX, imageSizeY] = size(image);
imageSizeX = round(imageSizeX * Mfactor);
imageSizeY = round(imageSizeY * Mfactor);
imageCenterX = round(imageSizeX / 2);
imageCenterY = round(imageSizeY / 2);

t1 = imageCenterY;
t2 = imageCenterX;

translateCenter = [1 0 -t1/2; 0 1 -t2/2; 0 0 1];
newImage = zeros(imageSizeX, imageSizeY);

for x = 1:imageSizeX
	for y = 1:imageSizeY
		newPoint = translateCenter * [x; y; 1];
		newColor = pixelValue(image, newPoint(1), newPoint(2), method, 'constant_border');
		resizedImage(x, y) = newColor;
	end
end

end


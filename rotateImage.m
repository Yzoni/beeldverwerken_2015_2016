function [ rotatedImage ] = rotateImage( image, angle, method, borderMethodName )

[imageSizeX, imageSizeY] = size(image);
imageSizeX = round(imageSizeX);
imageSizeY = round(imageSizeY);
imageCenterX = round(imageSizeX / 2);
imageCenterY = round(imageSizeY / 2);

% Create the necessary rotation matrix
phi = angle;
t1 = imageCenterY;
t2 = imageCenterX;

rMatrix = [(cos(phi)) (-sin(phi)) t1; (sin(phi)) (cos(phi)) t2; 0 0 1];
t1Translate = [1 0 -t1; 0 1 -t2; 0 0 1];
newImage = zeros(imageSizeX, imageSizeY);

for x = 1:imageSizeX
	for y = 1:imageSizeY
		transformation = rMatrix * t1Translate;
		newPoint = transformation * [x; y; 1];
		newColor = pixelValue(image, newPoint(1), newPoint(2), method, borderMethodName);
		rotatedImage(x, y) = newColor;
	end
end


end

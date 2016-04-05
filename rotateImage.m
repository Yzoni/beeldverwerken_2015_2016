function [ rotatedImage ] = rotateImage( image, angle, method, borderMethodName )

[imageSizeX, imageSizeY] = size(image);
imageCenterX = round(imageSizeX / 2);
imageCenterY = round(imageSizeY / 2);

% Create the necessary rotation matrix
phi = angle;
t1 = imageCenterY;
t2 = imageCenterX;
rMatrix = [(cos(phi)) (-sin(phi)) t1; (sin(phi)) (cos(phi)) t2; 0 0 1];

rotatedImage = zeros(imageSizeX, imageSizeY);
for x = 1:imageSizeX
	for y = 1:imageSizeY
		t1Translate = inv([1 0 t1; 0 1 t2; 0 0 1]);
		newPoint = rMatrix * t1Translate * [x; y; 1];
		newColor = pixelValue(image, newPoint(1), newPoint(2), method, borderMethodName);
		rotatedImage(x, y) = newColor;
	end
end


end

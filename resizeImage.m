function [ resizedImage ] = addBorder( image, angle, method )
[imageSizeX, imageSizeY] = size(image)

rMatrix = [(cos(angle)) (-sin(angle)); (sin(angle)) (cos(angle))];

leftTop = rMatrix * [imageSizeX; 0];
rightTop = rMatrix * [0; 0];
leftBottom = rMatrix * [imageSizeX; imageSizeY];
rightBottom = rMatrix * [0; imageSizeY];

newImageSizeX = round(abs(max(leftBottom(1) - rightTop(1), leftTop(1) - rightBottom(1))))
newImageSizeY = round(abs(max(leftBottom(2) - rightTop(2), leftTop(2) - rightBottom(2))))

dImageSizeX = newImageSizeX - imageSizeX;
dImageSizeY = newImageSizeY - imageSizeY;

translateCenter = [1 0 -dImageSizeY/2; 0 1 -dImageSizeX/2; 0 0 1];
resizedImage = zeros(newImageSizeX, newImageSizeY);

for x = 1:newImageSizeX
	for y = 1:newImageSizeY
		newPoint = translateCenter * [x; y; 1];
		newColor = pixelValue(image, newPoint(1), newPoint(2), method, 'constant_border');
		resizedImage(x, y) = newColor;
	end
end

end


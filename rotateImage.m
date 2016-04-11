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
rotatedImage = zeros(imageSizeX, imageSizeY);

% Rotation
% Repeat matrix non sequentially and then put into 1ximageSizeX*imageSizeY matrix
xmatrix = reshape(repmat((1:imageSizeX), imageSizeY, 1), 1, imageSizeY*imageSizeX);
% repeat imageSizeX times but sequentially for y
ymatrix = repmat((1:imageSizeY), 1, imageSizeX);
% Create additional 1 vector
o = ones(1, imageSizeY * imageSizeX);
% Combine them
combined = [xmatrix; ymatrix; o];
% Transform the whole thing
transformation = rMatrix * t1Translate;
newPoint = transformation * combined;
sizeRotatedValues = size(newPoint);
% Put points in appropriate places, still need one for loop for pixel value
for i = 1:sizeRotatedValues(2)
    newColor = pixelValue(image, newPoint(1, i), newPoint(2, i), method, borderMethodName);
    rotatedImage(xmatrix(i), ymatrix(i)) = newColor;
end
end


function [ distance ] = distanceMeasure( image, method )
%
resizedImage = resizeImage(image, 2, method);
rotatedImage = rotateImage(resizedImage, (pi/6), method, 'constant_border');
doubleRotatedImage = rotateImage(rotatedImage, -(pi/6), method, 'constant_border');

matrixMeasure = (doubleRotatedImage - resizedImage).^2;
distance = sum(matrixMeasure(:));

end


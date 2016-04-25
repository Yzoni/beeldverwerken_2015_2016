clc
clear

image = imread( 'cameraman.jpg' );
image = rgb2gray(image);
image = im2double(image);

intensity = [2];
average = 1/9 * [1 1 1; 1 1 1; 1 1 1]
motionblur = 1/6 * [1 1 1 1 1 1];


subplot(2, 2, 1);
imshow(image);
title('nothing changed');

subplot(2, 2, 2);
imshow(imfilter(image, intensity, 'conv', 'replicate'));
title('intensity increase by 2');

subplot(2, 2, 3);
imshow(imfilter(image, average, 'conv', 'replicate'));
title('average 3x3');

subplot(2, 2, 4);
imshow(imfilter(image, motionblur, 'conv', 'replicate'));
title('motionblur 5 to the right');
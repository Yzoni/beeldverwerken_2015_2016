clear;
clc;

image = imread( 'res/flyers.png' );
image = imread( 'res/cameraman.jpg' );
image = rgb2gray( image );
image = im2double( image );

%pixelValue( image, 20, 20, 'nearest', 'nearest_border' );
%pixelValue( image, 20, 20, 'linear', 'constant_border' );

% plot ( profile 
%( image , 100 , 100 , 120 , 120 , 100 , 'nearest', 'nearest_border') );
% hold on;
% plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'linear', 'nearest_border') );

tic;
%figure(1)
%imshow( rotateImage( image, (pi/6), 'linear', 'periodic_border' ) )

%toc
%tic;
%figure(2)
%imshow( rotateImage( image, (pi/6), 'linear', 'periodic_border' ) )

%toc

%imshow(myAffine ( image , 1 , 357 , 357 , 357 , 357 , 1 , 500 , 500 , 'linear', 'periodic_border'))
imshow(image)
[x, y] = ginput(4);
imshow( myProjection(image, x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4), 500, 500, 'linear', 'constant_border') )
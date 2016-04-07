clear;
clc;

image = imread( 'res/cameraman.jpg' );
image = rgb2gray( image );
image = im2double( image );

%pixelValue( image, 20, 20, 'nearest', 'nearest_border' );
%pixelValue( image, 20, 20, 'linear', 'constant_border' );

% plot ( profile 
%( image , 100 , 100 , 120 , 120 , 100 , 'nearest', 'nearest_border') );
% hold on;
% plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'linear', 'nearest_border') );

%tic;
%figure(1)
%imshow( rotateImage( image, (pi/6), 'linear', 'periodic_border' ) )

%toc
%tic;
%figure(2)
%imshow( rotateImage( image, (pi/6), 'nearest', 'periodic_border' ) )

%toc

imshow(myAffine ( image , 1 , 100 , 10 , 100 , 20 , 200 , 500 , 500 , 'linear', 'periodic_border'))
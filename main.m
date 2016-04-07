clear;
clc;

image = imread( 'res/cameraman.jpg' );
image = rgb2gray( image );
image = im2double( image );

%pixelValue( image, 20, 20, 'nearest', 'nearest_border' );
%pixelValue( image, 20, 20, 'linear', 'constant_border' );

% plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'nearest', 'nearest_border') );
% hold on;
% plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'linear', 'nearest_border') );

tic;
imshow( rotateImage( image, (pi/6), 'linear', 'periodic_border' ) )
toc
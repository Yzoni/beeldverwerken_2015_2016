clear;
clc;

image = imread( 'res/view1.jpg' );
image = rgb2gray( image );
image = im2double( image );

pixelValue( image, 20, 20, 'nearest' )
pixelValue( image, 20, 20, 'linear' )

plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'nearest') );
plot ( profile ( image , 100 , 100 , 120 , 120 , 100 , 'linear') );


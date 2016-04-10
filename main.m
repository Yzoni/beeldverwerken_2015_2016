clear;
clc;

image_camera = imread( 'res/cameraman.jpg' );
image_camera = rgb2gray( image_camera );
image_camera = im2double( image_camera );

image_flyers = imread( 'res/flyers.png' );
image_flyers = rgb2gray( image_flyers );
image_flyers = rgb2gray( image_flyers );


%%%%%%%%%%%%%%
% Question 2 %
%%%%%%%%%%%%%%

%%%%%%%%%%%
% 2 a, b, c)
%%%%%%%%%%%
pixelValue( image_camera, 20, 20, 'nearest', 'nearest_border' )
pixelValue( image_camera, 20, 20, 'linear', 'constant_border' )

hold on;
plot ( profile ( image_camera , 100 , 100 , 120 , 120 , 100 , 'nearest', 'nearest_border') );
plot ( profile ( image_camera , 100 , 100 , 120 , 120 , 100 , 'linear', 'nearest_border') );
hold off;
% TODO MAKE CONSTANT BORDER CONSTANT COLOR

%%%%%
% 2 d)
%%%%%
% Three different methods were used to try to solve the border problem. 
% (1) The first solution is a constant border color. (2) The second solution is 
% using expanding the most outer pixel outside of the border, the nearest 
% border solution. (3) The third solution is using a periodic border, the image
% is repeated and placed on the sides of the image.
hold on;
plot ( profile ( image_camera , 100 , 100 , 120 , 120 , 100 , 'nearest', 'nearest_border') );
plot ( profile ( image_camera , 100 , 100 , 120 , 120 , 100 , 'linear', 'nearest_border') );
hold off;
% TODO COMPARISON


%%%%%%%%%%%%%%
% Question 3 %
%%%%%%%%%%%%%%

%%%%%%%
% 3 a b)
%%%%%%%
imshow( rotateImage( image_camera, (pi/6), 'linear', 'periodic_border' ) )
% TODO REMOVE LOOPS

%%%%%%%
% 3 c)
%%%%%%%
borderedImage = resizeImage(image_camera, (pi/6), 'nearest');
imshow( rotateImage(rotateImage( borderedImage, (pi/6), 'linear', 'periodic_border' ) )

%%%%%
% 3 d)
%%%%%
tic;
rotateImage( image_camera, (pi/6), 'nearest', 'nearest_border' );
nearest_time = toc

tic;
rotateImage( image_camera, (pi/6), 'linear', 'nearest_border' );
linear_time = toc

%%%%%
% 3 e)
%%%%%
nearest_distance = distanceMeasure(image_camera, 'nearest')
linear_distance = distanceMeasure(image_camera, 'linear')


%%%%%%%%%%%%%%
% Question 4 %
%%%%%%%%%%%%%%

%%%%%%%%%
% 4 a b c)
%%%%%%%%%
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;
x3 = 0;
y3 = 0;
imshow( myAffine(image_camera, x1, y1, x2, y2, x3, y3, 500, 500, 'linear', 'nearest_border') )
% TODO REMOVE LOOPS
% TODO SET SPECIFIC PARAMETERS


%%%%%%%%%%%%%%
% Question 5 %
%%%%%%%%%%%%%%

%%%%%%%%%%%
% 5 a b c d)
%%%%%%%%%%%
imshow(image_flyers)
[x, y] = ginput(4);
imshow( myProjection(image, x(1), y(1), x(2), y(2), x(3), y(3), x(4), y(4), 500, 500, 'linear', 'constant_border') )
% TODO REMOVE LOOPS


%%%%%%%%%%%%%%
% Question 7 %
%%%%%%%%%%%%%%

%%%%%%%%%%%
% 7 a b c d)
%%%%%%%%%%%
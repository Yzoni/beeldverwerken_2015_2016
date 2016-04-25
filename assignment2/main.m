%% Exercise 2 Beeldverwerken
% Yorick de Boer
% Jeroen Terstall

% LOAD stuff
image = imread('cameraman.jpg');
image = rgb2gray(image);
image = im2double(image);


%% Question 2.1
% See Gauss.m

%% Question 2.2
% We think that the sum will be equal to 1 because according to probability
% theory all probabilities add up to 1
% It didnt result into 1 initially because the scale was too low and did
% cut some of the function, if we give it an initial scale of 100 the value
% of 1 is obtained
sum(sum(Gauss(3)))

%% Question 2.3
mesh(Gauss(3));

%% Question 2.4
% Physical unit of scale parameter is ??????

%% Question 2.5
maxSigma = 100;
timesRun = 20;

elapsedTime = zeros(maxSigma);
for sigma = 1 : maxSigma
    totalTime = 0;
    for i = 1 : timesRun
        % Run multiple times to get an accuracte impression
        tic;        
        H = imfilter(image, Gauss(sigma), 'conv' ,'replicate');
        totalTime = totalTime + toc;
    end
    % Take average of runs to calculate runtime
    elapsedTime(sigma) = totalTime / timesRun;
end
figure
plot(1:maxSigma, elapsedTime)
xlabel('Sigma')
ylabel('Elapsed Time')

%% Question 2.6
% the graph seems to indicate a quadratic function with O(sigma^2) because
% it keeps going up

%% Question 2.7
% TODO

%% Question 2.8
% Sum seems to be near 1 so OK. Here we also start with an initial scale of
% 100
sum(Gauss1(3))

%% Question 2.9
image = imread('cameraman.jpg');
image = rgb2gray(image);
image = im2double(image);

maxSigma = 100;
timesRun = 20;

elapsedTime = zeros(maxSigma);
for sigma = 1 : maxSigma
    totalTime = 0;
    for i = 1 : timesRun
        % Run multiple times to get an accuracte impression
        tic;        
        gauss1 = Gauss1(sigma);
        % First convolve with columns
        Fnew = imfilter(image, gauss1', 'conv', 'replicate');
        % Then with rows
        imfilter(Fnew, gauss1, 'conv', 'replicate');
        totalTime = totalTime + toc;
    end
    % Take average of runs to calculate runtime
    elapsedTime(sigma) = totalTime / timesRun;
end
figure
plot(1:maxSigma, elapsedTime)
xlabel('Sigma')
ylabel('Elapsed Time')

% Complexity seems to be linear so O(sigma)

%% Question 2.10

%% Question 2.11
twojet = Gd(image, 10, 2, 2);
imshow(twojet, [])

%% Question 3.2)
x = -100:100;
y = -100:100;
[X , Y ] = meshgrid (x , y );
A = 1; B = 2; V = 6* pi /201; W = 4* pi /201;
F = A * sin ( V * X ) + B * cos ( W * Y );

Fx = V * A * cos(V * X);
Fy = W * B * -sin(W * Y);

subplot(1,3,1);
imshow (F , [] , 'xData' , x , 'yData' , y );
title('F');

subplot(1,3,2);
imshow (Fx , [] , 'xData' , x , 'yData' , y );
title('Fx');

subplot(1,3,3);
imshow (Fy , [] , 'xData' , x , 'yData' , y );
title('Fy');


%% Question 3.3)
xx = -100:10:100;
yy = -100:10:100;
[ XX , YY ] = meshgrid ( xx , yy );
Fx = V * A * cos(V * XX);
Fy = W * B * -sin(W * YY);
imshow (F , [] , 'xData' , x , 'yData' , y );
hold on ;
quiver ( xx , yy , Fx , Fy , 'r' );
hold off ;


%% Question 3.4)

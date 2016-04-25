F = imread( 'cameraman.jpg' );

%% GAUS test)
mesh(Gauss(3))


%% GAUS1 test)
plot(Gauss1(1))


%%
sum(sum(Gauss(1)))
sum(sum(Gauss1(1)))


%% GAUS time plot)
iterations = 100;
time = zeros(iterations);
for sigma = 1:iterations
    tic;
    imfilter (F , Gauss ( sigma ) , 'conv' , 'replicate' );
    time(sigma) = toc;
end

plot(time);


%% GAUS1 time plot)
iterations = 300;
time = zeros(iterations);
for sigma = 1:iterations
    tic;
    gauss1 = Gauss1 ( sigma );
    imfilter (F , gauss1 , 'conv' , 'replicate' );
    imfilter (F , gauss1' , 'conv' , 'replicate' );
    time(sigma) = toc;
end

plot(time);


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

function [ r ] = myAffine ( image , x1 , y1 , x2 , y2 , x3 , y3 , M , N , method, borderMethodName )
r = zeros (N , M ); % allocate new image of correct size

[imageSizeX, imageSizeY] = size(image);
imageCenterX = round(imageSizeX / 2);
imageCenterY = round(imageSizeY / 2);

% Create the necessary rotation matrix
phi = -pi/4;
t1 = imageCenterY;
t2 = imageCenterX;
rMatrix = [(cos(phi)) (-sin(phi)) t1; (sin(phi)) (cos(phi)) t2; 0 0 1];
t1Translate = [1 0 -t1; 0 1 -t2; 0 0 1];

% Transformed points
newPoint = rMatrix * t1Translate * [x1 x2 x3; y1 y2 y3; 1 1 1];
A = [1 1 N; 1 M M; 1 1 1];
B = [newPoint(1,1) newPoint(1,2) newPoint(1,3); newPoint(2,1) newPoint(2,2) newPoint(2,3)];
%B = [x1 x2 x3; y1 y2 y3];
X = B / A;


% Repeat matrix non sequentially Nx1 Matrix and then reshape into 1xN*M matrix
xmatrix = reshape(repmat((1:M), N, 1), 1, N*M);
% repeat M times but sequentially for y
ymatrix = repmat((1:N), 1, M);
% Create additional 1 vector
o = ones(1, N * M);
newPoint = X * [xmatrix; ymatrix; o];
% Put in appropriate place in r
for i = 1:N*M
    r ( xmatrix(i) , ymatrix(i)) = pixelValue ( image , newPoint(1, i) , newPoint(2, i) , method, borderMethodName );
end

end


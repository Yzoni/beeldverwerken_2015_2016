    function [ r ] = myAffine ( image , x1 , y1 , x2 , y2 , x3 , y3 , M , N , method, borderMethodName )
r = zeros (N , M ); % allocate new image of correct size

[imageSizeX, imageSizeY] = size(image);
imageCenterX = round(imageSizeX / 2);
imageCenterY = round(imageSizeY / 2);

% Create the necessary rotation matrix
phi = pi/4;
t1 = imageCenterY;
t2 = imageCenterX;
rMatrix = [(cos(phi)) (-sin(phi)) t1; (sin(phi)) (cos(phi)) t2; 0 0 1];
t1Translate = [1 0 -t1; 0 1 -t2; 0 0 1];

% Transformed points
newPoint = rMatrix * t1Translate * [x1 x2 x3; y1 y2 y3; 1 1 1];

A = [x1, x2, x3; y1, y2, y3; 1, 1, 1]
B = [newPoint(1,1), newPoint(1,2), newPoint(1,3); newPoint(2,1), newPoint(2,2), newPoint(2,3)]
X = B / A

for xa = 1: M
	for ya = 1: N
        newPoint = X * [xa; ya; 1];
		r ( ya , xa ) = pixelValue ( image , newPoint(1) , newPoint(2) , method, borderMethodName );
	end
end

end


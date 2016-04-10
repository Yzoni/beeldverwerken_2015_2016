function [ projection ] = myProjection ( image , x1 , y1 , x2 , y2 , ...
x3 , y3 , x4 , y4 , m , n , method )
projection = zeros (n , m ); % allocate new image of correct size
% calculate projection matrix
% xy = 
% uv =
projectMatrix = createProjectionMatrix(xy, uv);
for xIndex = 1: m
	for yIndex = 1: n
		% calculate x and y
		i = [xIndex, yIndex, 1]
		projectedMatrix = projectionMatrix * i;

		lambda = projectedMatrix(3);
		x = projectedMatrix(1) / lambda;
		y = projectedMatrix(2) / lambda;

		projection ( yIndex , xIndex ) = pixelValue ( image , x , y , method );
	end
end

end


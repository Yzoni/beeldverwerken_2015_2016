function projection = myProjection ( image , x1 , y1 , x2 , y2 , x3 , y3 , x4 , y4 , m , n , method , borderMethodName)
projection = zeros (n , m ); % allocate new image of correct size
% calculate projection matrix
xymatrix = [x1 x2 x3 x4; y1 y2 y3 y4]';
% Map corners of image to dimensions of new image so uv maps to the
% following coordinates
uvmatrix = [1 1 m m; 1 n n 1]';

M = createProjectionMatrix(xymatrix, uvmatrix);
for xIndex = 1: m
    for yIndex = 1: n
        newPoint = M \ [xIndex; yIndex; 1];
        x = newPoint(1) / newPoint(3);
        y = newPoint(2) / newPoint(3);
        projection ( yIndex , xIndex ) = ...
        pixelValue ( image , x , y , method , borderMethodName );
    end
end

end

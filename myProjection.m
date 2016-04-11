function projection = myProjection ( image , x1 , y1 , x2 , y2 , x3 , y3 , x4 , y4 , m , n , method , borderMethodName)
projection = zeros (n , m ); % allocate new image of correct size
% calculate projection matrix
xymatrix = [x1 x2 x3 x4; y1 y2 y3 y4]';
% Map corners of image to dimensions of new image so uv maps to the
% following coordinates
uvmatrix = [1 1 m m; 1 n n 1]';

M = createProjectionMatrix(xymatrix, uvmatrix);

% Repeat matrix non sequentially Nx1 Matrix and then reshape into 1xN*M matrix
xmatrix = reshape(repmat((1:m), n, 1), 1, n*m);
% repeat M times but sequentially for y
ymatrix = repmat((1:n), 1, m);
% Create additional 1 vector
o = ones(1, n * m);
% Transform the whole thing
newPoint = M \ [xmatrix; ymatrix; o];
% Calculate x values by dividing with lambda
x = newPoint(1, :) ./ newPoint(3, :);
y = newPoint(2, :) ./ newPoint(3, :);
% Rest needs to be done in a for loop
for i = 1 : n*m
    projection ( ymatrix(i) , xmatrix(i) ) = ...
    pixelValue ( image , x(i) , y(i) , method , borderMethodName );
end

end

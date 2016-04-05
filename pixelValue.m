function [ color ] = pixelValue( image, x, y, method, borderMethodName )
%
imageSize = size(image);
if not(inImage(imageSize, x, y))
    [newX, newY] = borderMethod( x, y, borderMethodName );
else
    newX = x;
    newY = y;
end

switch( method )
        case 'nearest'
            color = image( floor(newX), floor(newY) );
            return;

        case 'linear'
            % TODO a and b
            a = newX - floor(newX);
            b = newY - floor(newY);
            color = (1 - a) * (1 - b) * image( floor(newX), floor(y) ) + ...
                    (1 - a) * b * image( ceil(newX), floor(newY) ) + ...
                    a * b * image( floor(newX), ceil(newY) ) + ...
                    a * (1 - b) * image( ceil(newX), ceil(newY) );
            return;
end

end

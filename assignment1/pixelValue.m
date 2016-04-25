function [ color ] = pixelValue( image, x, y, method, borderMethodName )
%
imageSize = size(image);
if not(inImage(imageSize, x, y))
    if strcmp(borderMethodName, 'constant_border')
       color = 0;
       return;
    end
    [newX, newY] = borderMethod( imageSize, x, y, borderMethodName );
else
    newX = x;
    newY = y;
end

switch( method )
        case 'nearest'
            color = image( floor(newX), floor(newY) );
            return;

        case 'linear'
            a = ceil(newX) - floor(newX);
            b = (1 + newX) * floor(newX) - newX * floor(newX + 1);
            color = (1 - a) * (1 - b) * image( floor(newX), floor(newY) ) + ...
                    (1 - a) * b * image( floor(newX), ceil(newY) ) + ...
                    a * b * image( ceil(newX), ceil(newY) ) + ...
                    a * (1 - b) * image( ceil(newX), floor(newY) );
            return;
end

end

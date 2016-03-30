function [ color ] = pixelValue( image, x, y, method )
%
imageSize = size(image);
if inImage( imageSize, x ,y )
    switch( method )
        case 'nearest'
            color = image( floor(x), floor(y) );
            return;
        case 'linear'
        	a = x - floor(x);
        	b = y - floor(y);
        	color = (1 - a) * (1 - b) * image( floor(x), floor(y) ) + ...
        			(1 - a) * b * image( ceil(x), floor(y) ) + ...
        			a * b * image( floor(x), ceil(y) ) + ...
        			a * (1 - b) * image( ceil(x), ceil(y) );
            return;
    end

end

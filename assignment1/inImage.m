function [boolean] = inImage( imageSize, x, y )
%
boolean = x <= imageSize(1) && y <= imageSize(2) && x >= 1 && y >= 1;

end

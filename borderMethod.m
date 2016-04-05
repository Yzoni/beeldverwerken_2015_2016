function [ newX, newY ] = borderMethod( imageSize, x, y , borderMethod )
switch( borderMethod )
	case 'constant_border'
		if (x > imageSize(1)) | (x < 1)
			newX = 1;
		else
			newX = x;
		end
		
		if (y > imageSize(2)) | (y < 1)
			newY = 1;
		else
			newY = y;
		end
		return

	case 'nearest_border'
		if (x > imageSize(1))
			newX = imageSize(1);
		elseif (x < 1)
			newX = 1;
		else
			newX = x;
		end
		
		if (y > imageSize(2))
			newY = imageSize(2);
		elseif (y < 1)
			newY = 1;
		else
			newY = y;
	    end
	    return

	case 'periodic_border'
		if (x > imageSize(1)) | (x < 1)
			newX = mod(x, imageSize(1));
		else
			newX = x
		end
		
		if (y > imageSize(2)) | (y < 1)	
			newY = mod(y, imageSize(2));
		else
			newY = y
		end
		return
end

end


function [ newX, newY ] = borderMethod( imageSize, x, y , borderMethod )
switch(borderMethod)
	case 'constant'
		newX = 1
		newY = 1
		return

	case 'nearest'
		if (x > imageSize(1))
			newX = imageSize(1)
		elseif (x < 1)
			newX = 1;
		else
			newX = x
		end
		
		if (y > imageSize(2))
			newY = imageSize(2);
		elseif (y < 1)
			newY = 1;
		else
			newY = y
	    end
	    return
	case 'periodic'
		newX = mod(x, imageSize(1))
		newY = mod(y, imageSize(2))
		return
end

end


<<<<<<< HEAD
function [ newX, newY ] = borderMethod( imageSize, x, y , borderMethod )
=======
function [ newX, newY ] = borderMethod( imageSize, x, y, borderMethod )
>>>>>>> 226b398b08f305aa44eaa9d4d0acf6ca18247c7c
switch( borderMethod )
	case 'constant_border'
		newX = 100;
		newY = 100;
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
<<<<<<< HEAD
			newX = mod(x, imageSize(1));
            if newX < 1
                newX = 1;
            end
=======
			newX = mod(x, imageSize(1))
			if newX < 1
				newX = 1;
			end
>>>>>>> 226b398b08f305aa44eaa9d4d0acf6ca18247c7c
		else
			newX = x;
		end
		
		if (y > imageSize(2)) | (y < 1)	
<<<<<<< HEAD
			newY = mod(y, imageSize(2));
            if newY < 1
                newY = 1;
            end
=======
			newY = mod(y, imageSize(2))
				if newY < 1
					newY = 1;
				end
>>>>>>> 226b398b08f305aa44eaa9d4d0acf6ca18247c7c
		else
			newY = y;
		end

		return
end

end


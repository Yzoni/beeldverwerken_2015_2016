function [ r ] = myAffine ( image , x1 , y1 , x2 , y2 , x3 , y3 , M , N , method )
r = zeros (N , M ); % allocate new image of correct size
% calculate X ( insert code for this )
for xa = 1: M
	for ya = 1: N
		% calculate x and y ( insert code for this )
		r ( ya , xa ) = pixelValue ( image , x , y , method );
	end
end

end


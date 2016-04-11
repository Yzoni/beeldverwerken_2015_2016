function [ matrixA ] = matrixAQ7( xyz, uv  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = xyz (: , 1);
y = xyz (: , 2);
y = xyz (: , 3);
% we cannot use x’ and y’ in Matlab because ’ means transposed
u = uvw (: , 1);
v = uvw (: , 2);
o = ones ( size ( x ));
z = zeros ( size ( x ));
Aoddrows = [x , y ,z, o , z, z , z , z , -u .* x , -u .* y , -u .* z, -u ];
Aevenrows = [z , z , z, z, x , y , z, o , -v .* x , -v .* y , -v .* z, -v ];
A = [ Aoddrows ; Aevenrows ];

% Do Singular Value Decomposition to obtain m
[U , D , V ] = svd ( A );
m = V (: , end );
% reshape m into the 3x4 projection matrix M
matrixA = reshape (m , 3 , 4) ’;

end


% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = getLinearFilter(offset)
  %change to other coordinate system
  offset(2) = offset(2) * (-1) ;
 
  dx = [1-offset(1), offset(1)];
  dy = [1-offset(2), offset(2)];
  
  retval = dy' * dx;
end

% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = getLinearFilter(offset)
  %change to other coordinate system
  offset(2) *= -1 ;
  if(offset(1) < 0)
    offset(1) = invert1(offset(1));
  endif
  if(offset(2) < 0)
    offset(2) = invert1(offset(2));
  end
  
  dx = [1-offset(1), offset(1)];
  dy = [1-offset(2), offset(2)];
  
  retval = dy' * dx;
endfunction

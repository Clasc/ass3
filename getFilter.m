% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = getFilter(offset, func)

   offset *=-1;  
  if(offset(1) < 0)
      offset(1) = 1 - abs(offset(1));
    endif
    if(offset(2) < 0)
      offset(2) = 1 - abs(offset(2));
    end
    
    dx = [func(1), 1 - func(1)];
    dy = [1 - func(2), func(2)];
    
    retval = dx'.* dy;

endfunction

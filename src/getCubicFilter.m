% Author: Christian Lascsak
% Matr. Nr: 01363742
function [retval] = getCubicFilter (offset, alpha)
  
  if(offset(1) < 0)
    offset(1) = invert1(offset(1));
  endif
  if(offset(2) < 0)
    offset(2) = invert1(offset(2));
  end
  
  dx = [F2cubic(offset(1) - 2, alpha), F1cubic(offset(1) - 1, alpha), F1cubic(offset(1), alpha), F2cubic(offset(1) + 1, alpha)];
  
  dy = [F2cubic(offset(2) + 1, alpha), F1cubic(offset(2),alpha), F1cubic(offset(2) -1, alpha), F2cubic(offset(2) - 2, alpha)];
  
  
    retval = dx'.*dy;
  
  
endfunction

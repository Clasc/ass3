% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = getBspline (offset)

   if(offset(1) < 0)
    offset(1) = invert1(offset(1));
  endif
  if(offset(2) < 0)
    offset(2) = invert1(offset(2));
  end
  
  dx = [F2spline(offset(1) - 2), F1spline(offset(1) - 1), F1spline(offset(1)), F2spline(offset(1) + 1)];
  dy = [F2spline(offset(2) + 1), F1spline(offset(2)), F1spline(offset(2) -1), F2spline(offset(2) - 2)];
    
    retval = dx'.*dy;
  
  
end

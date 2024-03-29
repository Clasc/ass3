
function [retval] = createFilter (type, offset, alpha)
   m = 2;
   if(offset(1) < 0)
    offset(1) = invert1(offset(1));
   end
   if(offset(2) < 0)
    offset(2) = invert1(offset(2));
   end
   
  if(strcmp(type,'linear'))
      retval = getLinearFilter(offset);
    
    elseif(strcmp(type,'sinc-barlett'))
      func = [(1 - abs(offset(1)) / m) * sinc(abs(offset(1))), (1 - abs(offset(2)) / m) * sinc(abs(offset(2)))];
      retval = getFilter(offset, func);
    
    elseif(strcmp(type,'sinc-hamming'))
      func = [(0.54 + 0.46*cos(pi * abs (offset(1)) / m)) * sinc(abs(offset(1))),(0.54 + 0.46 * cos(pi * abs(offset(2)) / m)) * sinc(abs(offset(2)))];
      retval = getFilter(offset, func);
   
   elseif(strcmp(type,'sinc-rect'))
      func = [1 * sinc(abs(offset(1))), 1 * sinc(abs(offset(2)))];
      retval = getFilter(offset, func);
    
    elseif(strcmp(type,'cubic') && alpha != 0)
      retval = getCubicFilter(offset,alpha);
      
    elseif(strcmp(type,'b-spline'))
      retval = getBspline(offset);
    end;
end


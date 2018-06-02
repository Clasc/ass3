% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = getFilter(offset, func)
  
   
    dx = [1 - func(1),func(1)];
    dy = [1 - func(2), func(2)];
    
    retval = dy'.* dx;
    retval = fliplr(retval);

end

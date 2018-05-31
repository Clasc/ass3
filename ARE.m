
function [retval] = ARE (original, final)
  m = rows(final);
  n = columns(final);
  retval = sum((final./original)(:))/(m*n);
  
endfunction

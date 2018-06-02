
function [retval] = ARE (original, final)
  diff = final - original;
  retval = mean(abs(diff./original)(:));
end

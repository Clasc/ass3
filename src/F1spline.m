function [retval] = F1spline (x)
  retval = 2/3 - abs(x)^2 + (abs(x)^3)/2 ;
end
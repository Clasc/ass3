% Author: Christian Lascsak
% Matr. Nr: 0136374

function [retval] = F1cubic (x, alpha)
  retval = ((alpha + 2)*abs(x)^3 - (alpha + 3)*abs(x)^2 + 1) ;
end
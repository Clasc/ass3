
function [retval] = F2cubic (x, alpha)
  retval = (alpha * abs(x)^3 - 5*alpha*abs(x)^2 + 8*alpha*abs(x) - 4*alpha);
end

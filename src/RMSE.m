

function [retval] = RMSE (bef, after)
  n = columns(bef);
  m = rows(bef);
  imdif = bef-after;
  quad = imdif.^2;
  summ = mean(quad(:));
  retval = sqrt(summ);
end

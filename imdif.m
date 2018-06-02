% Author: Christian Lascsak
% Matr. Nr: 0136374

function [rmse, are] = imdif (original, final)
  rmse = RMSE(original, final);
  are = ARE(original, final);
end


function [] = showcase_translate ()
  addpath('./src');
  rotate -i src/lena_gray_256.tif -k 100 -o test;
end

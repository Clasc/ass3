
function [] = showcase_translate ()
  addpath('./src');
  translate -i src/lena_gray_256.tif -k 100 -o test;
end

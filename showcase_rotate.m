
function [] = showcase_rotate ()
  addpath('./src');
  rotate -i src/lena.png -k 100 -o test;
end

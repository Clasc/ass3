
function [] = showcase_rotate ()
  addpath('./src');
  rotate -i src/lena.png -k 3 -o rotat.csv;
end

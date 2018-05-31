
function [retval] = cutImage (img, ogrows, ogcols,k)
  r = rows(img);
  c = columns(img);
  retval =img(r / 3:r* 2/3 ,c / 3: c* 2/3 );
endfunction

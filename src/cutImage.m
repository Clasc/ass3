
function [retval] = cutImage (img, ogrows, ogcols,k, filtersize)
  r = rows(img);
  c = columns(img);
  k = k/abs(k);
  shift = floor(filtersize / 2) - 1;
  %Cut the convolution out of the image
  cut1 = img(1 + shift : r - shift , 1  + shift : c - shift);  
  
  %depending on the translated direction
  if( k < 0)
    cut1 = cut1(1 : end - 1, 2 : end); 
  end
  if(k > 0)
    cut1 = cut1(2 : end, 1 : end - 1); 
  end
  
   %Cut out the middle image of the 3x3 tiled image, and translate the image back by (-1,-1) without losing information.
  retval = cut1(ogrows + k -1 : ogrows * 2 - 1 ,ogcols + k + 1: ogcols * 2 + 1);
  
 
end





function [retval] = cutImage (img, ogrows, ogcols,k, filtersize)
  r = rows(img);
  c = columns(img);
  k = k/abs(k);
  
  retval = img;
  retval = img(1 + floor(filtersize / 2) - 1 : r - floor(filtersize / 2) - 1 , 1  + floor(filtersize / 2) - 1 : c - floor(filtersize / 2) - 1  );  
  
  if( k < 0)
    retval = retval (1 : end - 1, 2 : end); 
  end
  if(k > 0)
     retval = retval (2 : end, 1 : end - 1); 
  end
  retval = retval(ogrows + k : ogrows * 2 ,ogcols + k : ogcols * 2 );
end




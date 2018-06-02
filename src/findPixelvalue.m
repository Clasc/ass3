function [retval] = findPixelvalue(img, x, y, type, alpha)
  
   intX = floor(x);
   intY = floor(y) ;
  
   offset = [ x - intX , y - intY];
   filter = createFilter(type, offset, alpha);
  
   
   [h w] = size(filter);
   n = zeros(h, w);
   [height width] = size(img);
  for i = 0:w-1
        for j = 0:h-1
            
            oldX = intX + i - floor(w/2);
            oldY = intY + j - floor(h/2);
            
             if (oldY >= 1 && oldY <= height && oldX >= 1 && oldX <= width)                
               n((j+1), (i+1), :) = img(oldY, oldX, :); 
             end
            
        end
     end
  
  
     filter
     sum(filter(:))
     
     retval = sum((n.*filter)(:));
     
end
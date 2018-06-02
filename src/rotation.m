
function [retval] = rotation (img, rotimg, angle, i, type, alpha)
  [h w] = size(rotimg);
  %how much the image has already rotated
  [targetheight targetwidth]= calcSize(img, angle * i);
  angle = deg2rad(angle);
  heightoffset = (targetheight - 1) / 2.0 -1;
  widthoffset = (targetwidth - 1) / 2.0 -1;

  retval = zeros(targetheight, targetwidth);
  
 for i = 1:targetwidth
        for j = 1:targetheight
            
            v = (j - heightoffset) * cos(angle) - (i - widthoffset) * sin(angle) + (h - 1) / 2.0 +1;
            u = (j - heightoffset) * sin(angle) + (i - widthoffset) * cos(angle) + (w - 1) / 2.0 +1;
            
                        
            if (v >= 1 && v <= h && u >= 1 && u <= w)                
                retval(j, i) = findPixelvalue(rotimg, u, v, type, alpha);
            end
        end
    end
    
end

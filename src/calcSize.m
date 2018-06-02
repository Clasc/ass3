function [height,width] = calcSize (img, angle)
  [h w] = size(img)
  width = w;
  height = h;
  
  if(angle < 90)
    disp("90");
    angle = deg2rad(angle);
    width = (w * cos(angle)) + (h * sin(angle));
    height = (w * sin(angle)) + (h * cos(angle));
  
  elseif(angle < 180)
    disp("180");
    help = w;
    w = h;
    h = help;
    phi = (angle - 90);
    
    width = (w * cos(angle)) + (h * sin(angle));
    height = (w * sin(angle)) + (h * cos(angle));
    
  elseif(angle < 270)
  disp("270");
  angle = deg2rad(angle - 180);
  
    width = (w * cos(angle)) + (h * sin(angle));
    height = (w * sin(angle)) + (h * cos(angle));
  
  elseif(angle < 360)
    disp("360");
    help = w;
    w = h;
    h = help;
    phi = deg2rad(angle - 270);
    
    width = (w * cos(angle)) + (h * sin(angle));
    height = (w * sin(angle)) + (h * cos(angle));
   end
  
end

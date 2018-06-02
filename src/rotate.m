

function [retval] = rotate (varargin)
   
 options = size(varargin)(2);
  if(options == 6);
    if(strcmp(varargin{1}, '-i'))
      img = uint8 (imread(varargin{2}));
    end
    if(strcmp(varargin{3},'-k'))
      k = varargin{4};
    end
    if(strcmp(varargin{5}, '-o'))
      output = varargin{6}; 
    end
    
  k = str2double(k);
  end
  
  ogcols = columns(img);
  ogrows = rows(img);
  
  
  
  
  linear = img;
  bartlett = img;
  hamming = img;
  rect = img;
  cubic = img;
  cubic05 = img;
  cubic075 = img;
  bspline = img;
  
  angle = 360 / k;
  figure, subplot(3,3,1),imshow(img,[]);
  
  for i = 1:k
      linear = rotation(img, linear, angle, i, 'linear',0);
      subplot(3,3,i+1), imshow(linear, []);
  end
 
 
  
end



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
  subplot(3,3,1),imshow(img,[]);
  
  for i = 1:k
      linear = rotation(img, linear, angle, i, 'linear',0);
     
  end
 
   
  for i = 1:k
      bartlett = rotation(img, bartlett, angle, i, 'sinc-barlett',0);
      
  end
    
  for i = 1:k
      hamming = rotation(img, hamming, angle, i, 'sinc-hamming',0);
    
  end
    
  for i = 1:k
      rect = rotation(img, rect, angle, i, 'sinc-rect',0);
      
  end
  
   for i = 1:k
      cubic = rotation(img, cubic, angle, i, 'cubic',-1);
      
  end
  
   for i = 1:k
      cubic075= rotation(img, cubic075, angle, i, 'cubic',-0.75);
      
  end
  
   for i = 1:k
      cubic05 = rotation(img, cubic05, angle, i, 'cubic',-0.5);
      
  end
  
  
   for i = 1:k
      bspline = rotation(img, bspline, angle, i, 'b-spline',0);
      
  end
  
  i=2;
  subplot(3,3,i),imshow(linear,[]);
  i=i+1;
  subplot(3,3,i),imshow(bartlett,[]);
  i=i+1;
  subplot(3,3,i),imshow(hamming,[]);
  i=i+1;
  subplot(3,3,i),imshow(rect,[]);
  i=i+1;
  subplot(3,3,i),imshow(cubic,[]);
  i=i+1;
  subplot(3,3,i),imshow(cubic075,[]);
  i=i+1;
  subplot(3,3,i),imshow(cubic05,[]);
  i=i+1;
  subplot(3,3,i),imshow(bspline,[]);
  i=i+1;
  
  [linrmse,linare]= imdif(img,linear);
  [bartrmse,bartare] = imdif(img, bartlett);
  [hammrmse,hammare]= imdif(img,hamming);
  [rectrmse,rectare]= imdif(img,rect);
  [cubicrmse,cubicare]= imdif(img,cubic);
  [c05rmse, c05are] = imdif(img, cubic05);
  [c075rmse, c075are] = imdif(img, cubic075);
  [bsplinrmse,bsplinare]= imdif(img,bspline);
  figure,plot(linrmse, linare,bartrmse, bartare, hammrmse, hammare, rectrmse, rectare, cubicrmse, cubicare, c075rmse, c075are, c05rmse, c05are, bsplinrmse, bsplinare);
  xlabel("RMSE");
  ylabel("ARE");
  title ("Error Graph"),
  legend("Linear", "Bartlett","Hamming","Rectangle-Sinc","Cubic (a=-1)","Cubic (a=-0.75)","Cubic (a=-0.5)", "B-Spline");
  legend('Location', 'northwestoutside');
  
  
end

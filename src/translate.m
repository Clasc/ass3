% Author: Christian Lascsak
% Matr. Nr: 0136374


function [retval] = translate (varargin)


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
         
 
  offset = [1/k, 1/k];
 
  
  
  linear = img;
  bartlett = img;
  hamming = img;
  rect = img;
  cubic = img;
  cubic05 = img;
  cubic075 = img;
  bspline = img;
  
  filter = createFilter("linear", offset);
  for i=1:abs(k)
    linear = [linear,linear, linear;
              linear,linear, linear;
              linear,linear, linear];
              
    linear = conv2(linear, filter, 'full');
    
    linear = cutImage(linear, ogrows, ogcols, k, 2);
    
    
  endfor
   
  filter = createFilter("sinc-barlett", offset);
  
  for i=1:abs(k)
   bartlett = [bartlett,bartlett, bartlett;
              bartlett,bartlett, bartlett;
              bartlett,bartlett, bartlett];
              
    bartlett = conv2(bartlett, filter, 'full');
    bartlett = cutImage(bartlett, ogrows, ogcols, k, 2);
    
  endfor
  
  filter = createFilter("sinc-hamming", offset);
  
  for i=1:abs(k)
    hamming = [hamming, hamming, hamming;
               hamming, hamming, hamming;
               hamming, hamming, hamming];
               
    hamming = conv2(hamming, filter, 'full');
    hamming= cutImage(hamming, ogrows, ogcols, k, 2);
  endfor
  
  filter = createFilter("sinc-rect", offset);
  
  for i=1:abs(k)
  
   rect = [rect, rect, rect;
           rect, rect, rect;
           rect, rect, rect];
               
    rect = conv2(rect, filter, 'full');
    rect = cutImage(rect, ogrows, ogcols, k, 2);
  endfor
  
  filter = createFilter("cubic", offset, -1);
   
  for i=1:abs(k)
   cubic = [cubic, cubic, cubic;
            cubic, cubic, cubic;
            cubic, cubic, cubic];
               
    cubic = conv2(cubic, filter, 'full');
    cubic = cutImage(cubic, ogrows, ogcols, k, 4);
  endfor
   
  filter = createFilter("cubic", offset, -0.75);
  
  for i=1:abs(k)
   cubic075 = [cubic075, cubic075, cubic075;
            cubic075, cubic075, cubic075;
            cubic075, cubic075, cubic075];
               
    cubic075 = conv2(cubic075, filter, 'full');
    cubic075 = cutImage(cubic075, ogrows, ogcols, k, 4);
  endfor
   
  filter = createFilter("cubic", offset, -0.5);
  
  for i=1:abs(k)
   cubic05 = [cubic05 , cubic05 , cubic05;
            cubic05 , cubic05 , cubic05;
            cubic05 , cubic05 , cubic05];
               
    cubic05 = conv2(cubic05, filter, 'full');
    
    cubic05 = cutImage(cubic05, ogrows, ogcols, k, 4);
  end
  
  filter = createFilter("b-spline", offset);
  
  for i=1:abs(k)
    bspline = [bspline, bspline, bspline;
               bspline, bspline, bspline;
               bspline, bspline, bspline];
    bspline = conv2(bspline, filter, 'full');
    bspline = cutImage(bspline, ogrows, ogcols, k, 4);
  end
  
  i=1;
  rows = 3;
  cols = 3;

  subplot(rows, cols, i), imshow(img), title("original");
  i = i+1;
  subplot(rows, cols, i), imshow(linear,[]),title("linear");
  i = i+1;
  subplot(rows, cols, i), imshow(bartlett,[]),title("Bartlett");
  i = i+1;
  subplot(rows, cols, i), imshow(hamming,[]),title("Hamming");
  i = i+1;
  subplot(rows, cols, i), imshow(rect,[]),title("Rectangle");
  i = i+1;
  subplot(rows, cols, i), imshow(cubic,[]),title("Cubic - alpha = -1");
  i = i+1;
  subplot(rows, cols, i), imshow(cubic075,[]),title("Cubic - alpha = -0.75");
  i = i+1;
  subplot(rows, cols, i), imshow(cubic05,[]),title("Cubic - alpha = -0.5");
  i = i+1;
  subplot(rows, cols, i), imshow(bspline,[]),title("B-spline");
  
  
  %Plot the graph
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
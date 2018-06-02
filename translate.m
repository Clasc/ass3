% Author: Christian Lascsak
% Matr. Nr: 0136374


function [retval] = translate (varargin)

 options = size(varargin)(2);
  if(options == 6);
    if(strcmp(varargin{1}, '-i'))
      img = imread(varargin{2});
    end
    if(strcmp(varargin{3},'-k'))
      k = varargin{4};
    end
    if(strcmp(varargin{5}, '-o'))
      output = varargin{6}; 
    end
    
  k = str2num(k);
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
  
  filter = createFilter("linear",img, offset);
  for i=1:abs(k)
    linear = [linear,linear, linear;
              linear,linear, linear;
              linear,linear, linear];
              
    linear = conv2(linear, filter, 'full');
    
    linear = cutImage(linear, ogrows, ogcols, k, 2);
    
    
  endfor
   
  filter = createFilter("sinc-barlett",img, offset);
  disp(filter);
  for i=1:abs(k)
   bartlett = [bartlett,bartlett, bartlett;
              bartlett,bartlett, bartlett;
              bartlett,bartlett, bartlett];
              
    bartlett = conv2(bartlett, filter, 'full');
    bartlett = cutImage(bartlett, ogrows, ogcols, k, 2);
    
  endfor
  
  filter = createFilter("sinc-hamming",img, offset);
  disp(filter);
  for i=1:abs(k)
    hamming = [hamming, hamming, hamming;
               hamming, hamming, hamming;
               hamming, hamming, hamming];
               
    hamming = conv2(hamming, filter, 'full');
    hamming= cutImage(hamming, ogrows, ogcols, k, 2);
  endfor
  
  filter = createFilter("sinc-rect",img, offset);
  disp(filter);
  for i=1:abs(k)
  
   rect = [rect, rect, rect;
           rect, rect, rect;
           rect, rect, rect];
               
    rect = conv2(rect, filter, 'full');
    rect = cutImage(rect, ogrows, ogcols, k, 2);
  endfor
  
  filter = createFilter("cubic",img, offset, -1);
  disp(filter);
  for i=1:abs(k)
   cubic = [cubic, cubic, cubic;
            cubic, cubic, cubic;
            cubic, cubic, cubic];
               
    cubic = conv2(cubic, filter, 'full');
    cubic = cutImage(cubic, ogrows, ogcols, k, 4);
  endfor
   
  filter = createFilter("cubic",img, offset, -0.75);
  disp(filter);
  for i=1:abs(k)
   cubic075 = [cubic075, cubic075, cubic075;
            cubic075, cubic075, cubic075;
            cubic075, cubic075, cubic075];
               
    cubic075 = conv2(cubic075, filter, 'full');
    cubic075 = cutImage(cubic075, ogrows, ogcols, k, 4);
  endfor
   
  filter = createFilter("cubic",img, offset, -0.5);
  disp(filter);
  for i=1:abs(k)
   cubic05 = [cubic05 , cubic05 , cubic05;
            cubic05 , cubic05 , cubic05;
            cubic05 , cubic05 , cubic05];
               
    cubic05 = conv2(cubic05, filter, 'full');
    cubic05 = cutImage(cubic05, ogrows, ogcols, k, 4);
  endfor
  
  filter = createFilter("b-spline",img, offset);
  disp(filter);
  for i=1:abs(k)
    bspline = [bspline, bspline, bspline;
               bspline, bspline, bspline;
               bspline, bspline, bspline];
    bspline = conv2(bspline, filter, 'full');
    
    bspline = cutImage(bspline, ogrows, ogcols, k, 4);
  endfor
  
  i=1;
  rows = 3;
  cols = 3;

  subplot(rows, cols, i++), imshow(img,[]), title("original");

  subplot(rows, cols, i++), imshow(linear,[]),title("linear");

  subplot(rows, cols, i++), imshow(bartlett,[]),title("Bartlett");

  subplot(rows, cols, i++), imshow(hamming,[]),title("Hamming");

  subplot(rows, cols, i++), imshow(rect,[]),title("Rectangle");

  subplot(rows, cols, i++), imshow(cubic,[]),title("Cubic - alpha = -1");
  
  subplot(rows, cols, i++), imshow(cubic075,[]),title("Cubic - alpha = -0.75");
  
  subplot(rows, cols, i++), imshow(cubic05,[]),title("Cubic - alpha = -0.5");

  subplot(rows, cols, i++), imshow(bspline,[]),title("B-spline");
  
  size(linear)
  size(bartlett)
  size(hamming)
  size(rect)
  size(cubic)
  size(bspline)
  
  %Plot the graph
  [linrmse,linare]= imdif(img,linear)
  [bartrmse,bartare] = imdif(img, bartlett);
  [hammrmse,hammare]= imdif(img,hamming);
  [rectrmse,rectare]= imdif(img,rect);
  [cubicrmse,cubicare]= imdif(img,cubic);
  [c05rmse, c05are] = imdif(img, cubic05);
  [c075rmse, c075are] = imdif(img, cubic075);
  [bsplinrmse,bsplinare]= imdif(img,bspline);
  figure,plot(linrmse, linare, bartrmse, bartare, hammrmse, hammare, rectrmse, rectare, cubicrmse, cubicare,c075rmse, c075are, c05rmse, c05are, bsplinrmse, bsplinare), title ("Error Graph");
  
  
end
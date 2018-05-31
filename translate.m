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

  img = [img,img,img
         img,img,img
         img,img,img];
         
 
  offset = [1/k, 1/k];
  offset
  
  
  linear = img;
  bartlett = img;
  hamming = img;
  rect = img;
  cubic = img;
  bspline = img;
  filter = createFilter("linear",img, offset);
  for i=1:abs(k)
    linear = conv2(linear, filter, 'full');
  endfor
   
  filter = createFilter("sinc-barlett",img, offset);
  disp(filter);
  for i=1:abs(k)
    bartlett = conv2(bartlett, filter, 'full');
  endfor
  
  filter = createFilter("sinc-hamming",img, offset);
  disp(filter);
  for i=1:abs(k)
    hamming = conv2(hamming, filter, 'full');
  endfor
  
  filter = createFilter("sinc-rect",img, offset);
  disp(filter);
  for i=1:abs(k)
    rect = conv2(rect, filter, 'full');
  endfor
  
  filter = createFilter("cubic",img, offset, -1);
  disp(filter);
  for i=1:abs(k)
    cubic = conv2(cubic, filter, 'full');
  endfor
  
  filter = createFilter("b-spline",img, offset);
  disp(filter);
  for i=1:abs(k)
    bspline = conv2(bspline, filter, 'full');
  endfor
  
  img = cutImage(img, ogrows, ogcols, k);
  disp("original");
  size(img)
  
  linear = cutImage(linear, ogrows, ogcols, k);
  
  size(linear)
  
  bartlett = cutImage(bartlett, ogrows, ogcols, k);
  size(bartlett)
  
  hamming= cutImage(hamming, ogrows, ogcols, k);
  size(hamming)
  
  rect = cutImage(rect, ogrows, ogcols, k);
  size(rect)
  
  cubic = cutImage(cubic, ogrows, ogcols, k);
  size(cubic)
  
  bspline = cutImage(bspline, ogrows, ogcols, k);
  size(bspline)
  
  i=1;
  rows = 3;
  cols = 3;

  subplot(rows, cols, i++), imshow(img,[]), title("original");

  subplot(rows, cols, i++), imshow(linear,[]),title("linear");

  subplot(rows, cols, i++), imshow(bartlett,[]),title("Barlett");

  subplot(rows, cols, i++), imshow(hamming,[]),title("Hamming");

  subplot(rows, cols, i++), imshow(rect,[]),title("Rectangle");

  subplot(rows, cols, i++), imshow(cubic,[]),title("Cubic");

  subplot(rows, cols, i++), imshow(bspline,[]),title("B-spline");
  
  
  rmse = RMSE(img,linear)
  
  are = ARE (img,linear)
  
  
endfunction
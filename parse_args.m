
function [retval] = parse_args (varargin)
  options = size(varargin)(2);
  if(options == 6);
    if(strcmp(varargin{1}, '-i'))
      img = varargin{2};
    end
    if(strcmp(varargin{3},'-k'))
      k = varargin{4};
    end
    if(strcmp(varargin{5}, '-o'))
      output = varargin{6}; 
    end
  disp(img);
  disp(k);
  disp(output);
  end
 
end

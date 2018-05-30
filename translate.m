## Copyright (C) 2018 Chris
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} translate (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris <chris@chris-XPS-13-9350>
## Created: 2018-05-24

function [retval] = translate (img, k, type, alpha)
  ogcols = columns(img);
  ogrows = rows(img);
  
  #image size
  img = [img,img,img
         img,img,img
         img,img,img];
         
 
  offset = [1/k, 1/k];
  m = 2;
  retval = img;
  
  if(strcmp(type,'linear'))
      filter = getLinearFilter(offset);
    
    elseif(strcmp(type,'sinc-barlett'))
      func = [(1 - abs(offset(1)) / m) * sinc(abs(offset(1))), (1 - abs(offset(2)) / m) * sinc(abs(offset(2)))];
      filter = getFilter(offset, func);
    
    elseif(strcmp(type,'sinc-hamming'))
      func = [(0.54 + 0.46*cos(pi * abs (offset(1)) / m)) * sinc(abs(offset(1))),(0.54 + 0.46 * cos(pi * abs(offset(2)) / m)) * sinc(abs(offset(2)))];
      filter = getFilter(offset, func);
    elseif(strcmp(type,'sinc-rect'))
    
      func = [1 * sinc(offset(1)), 1 * sinc(offset(2))];
      filter = getFilter(offset, func);
    
    elseif(strcmp(type,'cubic') && alpha != 0)
      filter = getCubicFilter(offset,alpha);
      
    elseif(strcmp(type,'b-spline'))
      filter = getBspline(offset);
    end;
  
  for i=1:abs(k)
    retval = conv2(retval,filter, 'same');
  endfor
  retval = retval(ogrows :ogrows * 2 -(k/abs(k)) , ogcols :ogcols * 2 -(k/abs(k)));
  disp(type);
  disp(size(retval));
  
  disp(filter);
  sum(filter(:))
  
endfunction
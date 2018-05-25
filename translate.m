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

function [retval] = translate (img, offset, type)
  #change to other coordinate system
  offset(2) *= -1 ;
  #image size
  m = columns(img)*rows(img);
  if(strcmp(type,'linear'))
    filter = getLinearFilter(offset);
  elseif(strcmp(type,'sinc-barlett'))
    func = [(1 - offset(1) / m) * sinc(offset(1)), (1 - offset(2) / m) * sinc(offset(1))];
    filter = getFilter(offset, func);
  elseif(strcmp(type,'sinc-hamming'))
    func = [(0.54 + 0.46*cos(pi*offset(1) / m)) * sinc(offset(1)),(0.54 + 0.46 * cos(pi * offset(2) / m)) * sinc(offset(2))];
    filter = getFilter(offset, func);
  endif;
  disp(filter);
  sum(filter(:))
  retval = conv2(img, filter);
  
endfunction

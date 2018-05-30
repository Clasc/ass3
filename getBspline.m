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
## @deftypefn {Function File} {@var{retval} =} getBspline (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris <chris@chris-XPS-13-9350>
## Created: 2018-05-26

function [retval] = getBspline (offset)

   if(offset(1) < 0)
    offset(1) = invert1(offset(1));
  endif
  if(offset(2) < 0)
    offset(2) = invert1(offset(2));
  end
  
  dx = [F2spline(offset(1) - 2), F1spline(offset(1) - 1), F1spline(offset(1)), F2spline(offset(1) + 1)];
  dy = [F2spline(offset(2) + 1), F1spline(offset(2)), F1spline(offset(2) -1), F2spline(offset(2) - 2)];
    
    retval = dx'.*dy;
  
  
endfunction

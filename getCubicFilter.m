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
## @deftypefn {Function File} {@var{retval} =} getCubicFilter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris <chris@chris-XPS-13-9350>
## Created: 2018-05-26

function [retval] = getCubicFilter (offset, alpha)
  
  if(offset(1) < 0)
    offset(1) = invert1(offset(1));
  endif
  if(offset(2) < 0)
    offset(2) = invert1(offset(2));
  end
  
  dx = [F2cubic(offset(1) - 2, alpha), F1cubic(offset(1) - 1, alpha), F1cubic(offset(1), alpha), F2cubic(offset(1) + 1, alpha)];
  
  dy = [F2cubic(offset(2) + 1, alpha), F1cubic(offset(2),alpha), F1cubic(offset(2) -1, alpha), F2cubic(offset(2) - 2, alpha)];
  
  
    retval = dx'.*dy;
  
  
endfunction

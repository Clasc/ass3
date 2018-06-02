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
## @deftypefn {Function File} {@var{retval} =} F2cubic (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Chris <chris@chris-XPS-13-9350>
## Created: 2018-05-26

function [retval] = F2cubic (x, alpha)
  retval = (alpha * abs(x)^3 - 5*alpha*abs(x)^2 + 8*alpha*abs(x) - 4*alpha);
endfunction

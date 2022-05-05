function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

% x
    size_x = size(x)
    start_x = x(1,1)
    end_x = x(1,end)
% y
    size_y = size(y)
    start_y = y(1,1)
    end_y = y(1,end)  

% intitial set up
I = 0
i = 1

while (1)
    i=i+1
    h = (end_x - start_x)./(size_y(2) -1) 
if length(x)~=length(y)
    error('inputs need to be the same length')
end
if range(x(2:end)-x(1:end-1))~=0
    error('x inputs are not equally spaced')
end
    if size_y(2) == 2
        warning('Apply Trapizoid Rule')
        I = h.*((end_y + start_y)./2)
        break
    elseif size_y(2) == 3
        y(2) = 4.*y(2)
        ytotal = sum(y(:))
        I = (h./3).*(ytotal)
        break
    else size_y(2) > 3
        if i == (size_x(2) -1)
            if mod(size_x(2),2) == 0
                warning('Apply Trapizoid Rule Because Odd Number of Values in Array')
                ytotal = sum(y(:)) - end_y
                I = (h/3)*ytotal + (y(size_x(2)) + y(size_x(2) -1)).*(h./2)
                break
            else mod(size_x(2),2) == 1
                ytotal = sum(y(:))
                I = (h./3).*(ytotal)  
                break
            end 
        elseif mod(i,2) == 1 % odds
            y(i) = 2*y(i)
        else mod(i,2) == 0 % evens
            y(i) = 4*y(i)
        end
    end
end
I=I
end      
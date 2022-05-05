function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Tori Entwistle
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if length(x)~=length(y)
    error('size of x must equal size y')
end

% sort
[sortedY, sortOrder] = sort(y)
sortedX = x(sortOrder)

% preset
n = length(x);
tracker = true(1,n);

% Outliers (I know these are the same)
format long
Q1 = quantile(sortedY,.25)
Q3 = quantile(sortedY,.75)
IQR = Q3 - Q1


for i=1:n
   if 1.5*IQR + Q3 < sortedY(i) && -1.5*IQR + Q1 < sortedY(i)
        tracker(i)= 0
   end
   if sortedY(i) == 0 
       tracker(i) = 0
   end
end
fY = sortedY(tracker)
fX = sortedX(tracker)
fN = length(fY)

% set up
sumY = sum(fY)
sumX = sum(fX)
avgY = (sum(fY))./fN
avgX = (sum(fX))./fN
sumX2 = sum(fX.^2)
bigsumX2 = (sum(fX)).^2
sumXY = sum(fX.*fY)

% slope
slope = ((fN*sumXY)-(sumX*sumY))./((fN*sumX2)-bigsumX2)

% intercept
intercept = avgY - (slope*avgX)

% fun stuff
linReg = slope*fX + intercept
ST = sum((fY-avgY).^2)
SR = sum((fY - linReg).^2)

% R2
Rsquared = 1 - (SR/ST)

end
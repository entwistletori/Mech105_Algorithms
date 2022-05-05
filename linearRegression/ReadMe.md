# Computes linear regression of given data set
Puts data into slope-intercept format f(x) = mx+b after having been filtered from lowest y-value to highest. Then commutes coefficient of determination (R^2), this tellls you how close your trendline matches the data.

Inputs:
* x - x-values of the data set
* y - y-values of the data set

Outputs:
* fX - Filtered x-values (i.e. the input x-values but without the outlier points), sorted from smallest to largest
* fY - Filtered y-valeus (i.e. the input y-values but without the outlier points), sorted from smallest to largest
* slope - Slope from the linear regression (m in f(x)=mx+b )
* intercept - Intercept from the linear regression (b in f(x)=mx+b)
* Rsquared - Rsquared value

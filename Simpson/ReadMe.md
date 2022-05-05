# Integrates experimental data using Simpson's 1/3 rule
Checks if there are an odd number of intervals, if there are, the trapezoidal rule is used for the last interval.

Inputs:
* x - the vector of equally spaced independent variable
* y - the vector of function values with respect to x

Output:
* I - the numerical integral calculated

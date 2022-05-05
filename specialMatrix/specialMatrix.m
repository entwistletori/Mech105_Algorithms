function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choic
A= zeros(n,m)
% Now the real challenge is to fill in the correct values of A
if nargin ~= 2;
    error('Not enough inputs for matrix specialMatrix')
end
x = 1;
y = 1;
A(1,1)=1;
for x = 1:n
 for y = 1:m
    if x==1
    A(x,y)= y;
    elseif y== 1
        A(x,y)= x 
    else 
        A(x,y)=A(x-1,y)+A(x,y-1)
    end
 end
end

end
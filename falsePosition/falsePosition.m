function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)

%falsePosition finds the root of a function using false position method
% inputs

% func = equation
% xl = lower bound
% xu = upper bound
% es = realtive error
% maxit = max iterations (default 200)
% varargin = other parameters

%outputs

% root = desired value
% fx = function at root
% ea = approximate relative error
% iter = # times performes

% errors
if nargin < 3
    error('not enough inputs')
end
if nargin < 4
    es = 0.0001;
end
if nargin < 5
    maxit = 200
end

% preset
iter=0;
ea=100;
xr=xl;

if func(xl)*func(xu)<0 || maxit>iter
  
    while ea>es
            xr = xu-(func(xu)*(xl-xu))/(func(xl)-func(xu));
            fx= func(xr, varargin {:});
            iter= iter +1;
            xr_old=xr
            if fx==0
               xr=xr;
               ea=0;
            elseif fx~=0
                if fx>0
                    ea=abs((xu-xr_old)./xu)*100;
                    xu=xr;
                else fx<0
                    ea=abs((xl-xr_old)./xl)*100;
                    xl=xr;
                end
            end
    end

elseif func(xl)*func(xu)>0 || iter>=maxit
    error('no solution')
end
fx=func(xr, varargin {:})
root=xr
iter=iter
ea=ea
end
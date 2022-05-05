function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

% erros
[r,c]=size(A)
if r ~= c
    error('Matrix A must be square');
end

n= size(A,1)
L=zeros(n)
P=eye(n)
U=zeros(n)

for k=1:n
    [maxv, q] = max(abs(A(k:n,k)));
    q = n-(n-k+1)+q;

    A([k q], :) = A([q k], :);
    P([k q], :) = P([q k], :);
    L([k q], :) = L([q k], :);

    L(k:n, k) = A(k:n, k) / A(k,k);
    U(k, 1:n) = A(k, 1:n)
    A(k+1:n,1:n) = A(k+1:n, 1:n) - L(k+1:n,k)*A(k,1:n);
end
U(:,n)= A(:, n)

[L]*[U]==[P]*[A]

end
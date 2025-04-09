x = [4,-2,1;3,6,1;2,1,5]
[L, U] = dekmpLU(x)
function [L,U] = dekmpLU(X)
[m,n] = size(X);
if m~=n
    error("Macierz nie jest kwadratowa");
end
L=eye(n);
U=X;
for k=1:n
    for i=k+1:n
        factor=U(i,k)/U(k,k);
        L(i,k) = factor;
        U(i, k:n) = U(i, k:n)-factor*U(k, k:n);
    end
end
end

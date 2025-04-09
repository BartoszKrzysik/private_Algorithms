function [detX, triX] = determinant(X)
    detX = 1;
    [m,n] = size(X);
    if m~=n
        error("Macierz nie jest kwadratowa")
    end
    triX = X;
    for k=1:n
        for i=k+1:n
            factor = triX(i,k)/triX(k,k);
            triX(i,k:n) = triX(i,k:n) - factor * triX(k,k:n);
        end
    end
    for i=1:n
        detX = detX * triX(i,i);
    end
end

function [igrek] = aproks_srednio(x,y,stopien);
    if length(y)~=length(x)
        disp('Error');
        return;
    end
    if size(y, 2) > size(y, 1)
        y = y'; 
    end
    G = ones(length(x), stopien+1);
    for i=1 : length(x)
        for j=1 : stopien+1
            G(i,j) = x(i)^(j-1);
        end
    end
    G;
    G1=G'*G;
    G1=inv(G1);
    G2=G'*y;
    igrek = G1*G2;
end

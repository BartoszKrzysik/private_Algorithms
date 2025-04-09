function [igrek, a0, ak, bk] = aproksymacja_trygonometryczna(y, T , iks, m)
    w = (2*pi)/T;
    N = length(y);        
    a0 = (1/N)*sum(y(:));
    if m==0
        ak=(2/N)*a0;
        bk=0;
        igrek = a0;
        return;
    end
    ak = zeros(1, m+1);
    for i=1:m
        for j=1:length(y)
            ak(i+1) = ak(i+1)+y(j)*cos(((2*pi)/N)*i*(j-1));
        end
        ak(i+1) = (2/N)*ak(i+1);
    end
    bk = zeros(1, m+1);
    for i=1:m
        for j=1:length(y)
            bk(i+1) = bk(i+1)+y(j)*sin(((2*pi)/N)*i*(j-1));
        end
        bk(i+1) = (2/N)*bk(i+1);
    end
    igrek = zeros(1, length(iks));
    for i = 1 : length(iks)
        for j = 1 : length(ak)-1
            igrek(i) = igrek(i) + ak(j+1)*cos(j*w*iks(i)) + bk(j+1)*sin(j*w*iks(i));
        end
        igrek(i) = igrek(i) + a0;
    end
end

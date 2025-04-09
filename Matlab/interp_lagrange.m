function [igrek] = interp_lagrange(x,y,iks);
    s = length(iks);
    igrek = zeros(1,s);
    for g = 1:s;
        n = length(x);
        w = 0 ;
        for i = 1:n;
            licznik = 1;
            mianownik = 1;
            for k = 1:n;
                if(k ~= i);
                    licznik = licznik*(iks(g) - x(k));
                    mianownik = mianownik*(x(i)-x(k));
                end
            end
            w = w + y(i)*licznik/mianownik;
        end
        igrek(g) = w;
    end
end

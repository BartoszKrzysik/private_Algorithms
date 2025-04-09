function [igrek] = interp_newton(x,y,iks);
    s = length(iks);
    igrek = zeros(1,s);
    for g=1:s;
        n = length(x);
        w = y(1);
        for i = 2:n;
            wynik = 1;
            disp(['For iks = ', num2str(iks(g))]);
            for j = 1 : i-1;
                wynik = wynik * (iks(g) - x(j));
            end
            w = w + f(x, y, y(1:i))*wynik;
            disp(['Step ', num2str(i-1), ': w = ', num2str(w)]);
        end
        igrek(g) = w;
    end
end                

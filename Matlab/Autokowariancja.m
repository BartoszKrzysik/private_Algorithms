function [z] = asc_kow(x, h)
    n = length(x);
    x_sr = mean(x);
    z = zeros(size(h));
    for i = 1:length(h)
        temp = 0;
        for j = 1 : n-h(i)
            temp = temp + (x(j) - x_sr)*(x(j+h(i))-x_sr);
        end
        z(i) = temp/n;
    end
end
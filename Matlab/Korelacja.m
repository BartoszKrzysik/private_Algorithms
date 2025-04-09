function r = korelacja(x, y)
    if length(y) ~= length(x)
        disp('Error');
        return;
    end
    x_sr = mean(x);
    y_sr = mean(y);
    denominatorx = 0;
    denominatory = 0;
    numerator = 0;
    for i =1 : numel(y)
        numerator = numerator + (x(i)-x_sr)*(y(i)-y_sr);
        denominatorx = denominatorx + (x(i)-x_sr)^2;
        denominatory = denominatory + (y(i)-y_sr)^2;
    end
    r = numerator / (sqrt(denominatorx) * sqrt(denominatory));
end
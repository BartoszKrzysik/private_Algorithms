function [y] = rrz_euler(fun, a, b, h, x0, y0)
    n = (b-a)/h;
    y = zeros(1, n+1);
    y(1) = y0;
    for i = 1:n
        y(i+1) = y(i) + h * fun(x0, y(i));
        x0 = x0 + h;
    end
end

function [tra] = rrz_trapez(fun, a, b, h, x0, y0)
    n = (b-a)/h;
    tra = zeros(1, n+1);
    tra(1) = y0;
    for i = 1:n
        tra(i+1) = tra(i) + (h/2) * (fun(x0, tra(i)) + fun(x0 + h, tra(i) + h * fun(x0, tra(i))));
        x0 = x0 + h;
    end
end

function [rk] = rrz_rk(fun, a, b, h, x0, y0)
    n = (b-a)/h;
    rk = zeros(1, n+1);
    rk(1) = y0;
    for i = 1:n
        k1 = h * fun(x0, rk(i));
        k2 = h * fun(x0 + 0.5*h, rk(i) + 0.5*k1);
        k3 = h * fun(x0 + 0.5*h, rk(i) + 0.5*k2);
        k4 = h * fun(x0 + h, rk(i) + k3);
        rk(i+1) = rk(i) + (1/6) * (k1 + 2*k2 + 2*k3 + k4);
        x0 = x0 + h;
    end
end
function [y] = rrz_ab1(fun, a,b,h,x0,y0)
    n = (b-a)/h;
    x = x0 : h : x0+n;
    y = zeros(1, n+1);
    rk = rrz_rk(fun, a, b, h, x0, y0);
    y(1) = rk(1);
    y(2) = rk(2);
    for i = 3 : n+1
        y(i) = y(i-1) + (h/2)*(-fun(x(i-2),y(i-2))+3*fun(x(i-1),y(i-1)));
    end
end
function [y] = rrz_ab2(fun, a,b,h,x0,y0)
    n = (b-a)/h;
    x = x0 : h : x0+n;
    y = zeros(1, n+1);
    rk = rrz_rk(fun, a, b, h, x0, y0);
    y(1) = rk(1);
    y(2) = rk(2);
    y(3) = rk(3);
    for i = 4 : n+1
        y(i) = y(i-1) + (h/12)*(5*fun(x(i-3),y(i-3))-16*fun(x(i-2),y(i-2))+23*fun(x(i-1),y(i-1)));
    end
end   
function [y] = rrz_ab3(fun, a,b,h,x0,y0)
    n = (b-a)/h;
    x = x0 : h : x0+n;
    y = zeros(1, n+1);
    rk = rrz_rk(fun, a, b, h, x0, y0);
    y(1) = rk(1);
    y(2) = rk(2);
    y(3) = rk(3);
    y(4) = rk(4);
    for i = 5 : n+1
        y(i) = y(i-1) + (h/24)*(-9*fun(x(i-4),y(i-4))+37*fun(x(i-3),y(i-3))-59*fun(x(i-2),y(i-2))+55*fun(x(i-1),y(i-1)));
    end
end
function [y] = rrz_ab4(fun, a,b,h,x0,y0)
    n = (b-a)/h;
    x = x0 : h : x0+n;
    y = zeros(1, n+1);
    rk = rrz_rk(fun, a, b, h, x0, y0);
    y(1) = rk(1);
    y(2) = rk(2);
    y(3) = rk(3);
    y(4) = rk(4);
    y(5) = rk(5);
    for i = 6 : n+1
        y(i) = y(i-1) + (h/720)*(251*fun(x(i-5), y(i-5)) - 1274*fun(x(i-4), y(i-4)) + 2616*fun(x(i-3), y(i-3)) - 2774*fun(x(i-2), y(i-2)) + 1901*fun(x(i-1), y(i-1)));
    end
end

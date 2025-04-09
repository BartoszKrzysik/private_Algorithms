function [x1, iter] = bisekcja(fun, a, b, eps)
    iter = 0;
    while abs(b-a)>eps
        iter=iter+1;
        x1 = (a+b)/2;
        y = fun(x1);
        if y==0
            return;
        end
        if fun(x1)*fun(a) < 0
            b = x1;
        else
            a = x1;
        end
    end
end

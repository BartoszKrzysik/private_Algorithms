function [x1, iter, x_all] = regula_falsi(fun, a, b, eps)
    iter = 0;
    x1 = a;
    x_all = [];
    while abs(fun(x1))>eps
        iter = iter + 1;
        x1 = a - fun(a)*((b-a)/(fun(b)-fun(a)));
        x_all = [x_all, x1];
        if fun(x1)==0
            return
        end
        if fun(x1)*fun(a) > 0
            a = x1;
        else
            b = x1;
        end
    end
end

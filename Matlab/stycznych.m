function [x1, iter, x_all] = stycznych(fun, pochodna, a, b, eps, x0)
    x_all = [];
    iter = 0;
    while abs(fun(x0)) > eps
        iter = iter+1;
        x1 = x0 - (fun(x0)/pochodna(fun,x0,0.1));
        x_all = [x_all,x1];
        if fun(x1)==0
            return
        end
        x0 = x1;
    end
end

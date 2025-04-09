function [y] = integral_pros(fun,a,b,h)
    z = a;
    i = 1;
    while z<=b
        x(i) = fun(z);
        z = z + h;
        i = i + 1;
    end
    y = h * sum(x(1:end-1));
end
function [y] = integral_trap(fun,a,b,h)
    z = a;
    i = 1;
    while z<=b
        x(i) = fun(z);
        z = z + h;
        i = i + 1;
    end
    y = h*((x(1)+x(end))/2) + h * sum(x(2:end-1));
end

function [I] = calka(a,b,d,num,fun)
    k=0;
    for i=1:num
        x = a+(b-a).*rand(1,1);
        y = d.*rand(1,1);
        if y<=fun(x)
            k=k+1;
        end
    end
    I = (k/num)*(b-a)*d;
end

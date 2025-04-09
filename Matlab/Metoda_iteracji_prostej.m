function [X, it, z1, z2, z3] = it_prosta(a, b, x0, eps)
    D=diag(diag(a));
    R=a-D;
    D1 = inv(D);
    W=-D1*R;
    Z=D1*b;
    z1=max(sum(abs(W),2));
    z2=max(sum(abs(W),1));
    z3=W.^2;
    z3=sqrt(sum(sum(z3)));
    if z1>=1 || z2>=1 || z3>=1
        disp("Error");
    else
        temp=1;
        it=0;
        while any(abs(temp)>eps)
            X=W*x0+Z;
            temp=X-x0;
            x0=X;
            it=it+1;
        end
    end
end

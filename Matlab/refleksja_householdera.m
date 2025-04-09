function [Q, R] = qr_ht(A)
    R=A;
    [m,n]=size(R);
    if n>m
        Q=eye(n);
        I=Q;
        z=n;
    else
        Q=eye(m);
        I=Q;
        z=m;
    end
    for k=1:n
        Ht=I(k:z,k:z);
        A1=R(k:m,k:n);
        a1=A1(:,1);
        a1_norm=norm(a1);
        a1_sign=sign(a1(1,1));
        e1=eye(length(a1),1);
        v1=a1+a1_sign*a1_norm*e1;
        H1=Ht-2.*((v1*v1')/(v1'*v1));
        Hk=I;
        Hk(k:z,k:z)=H1;
        R=Hk*R;
        Q=Q*Hk;
    end
end

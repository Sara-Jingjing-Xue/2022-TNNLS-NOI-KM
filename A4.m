% solve (25) with p from 1 to 0.1
function [E]= A4(r,D)

n=size(D,1);
p=1;
U=eye(n);
u=diag(U);
ad = -1/(2*r)*D;

for h=1:10
    for g=1:5
        for j=1:n
            ej = EProjSimplexdiag(ad(:,j), u);
            E(:,j) = ej'; 
        end
        norm2  = sqrt(sum(E.*E,2));
        u=p/2.*(norm2+eps).^(p-2);
    end   
    p=p-0.1;
end

end


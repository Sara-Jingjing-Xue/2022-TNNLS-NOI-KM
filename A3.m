% solving problem (25) with different p, r
function [E,obj]= A3(r,D, p, maxiter)

n=size(D,1);
U=eye(n);
u=diag(U);
ad = -1/(2*r)*D;

for iter=1:maxiter
    for j=1:n
        ej = EProjSimplexdiag(ad(:,j), u);
        E(:,j) = ej';
    end
    norm2  = sqrt(sum(E.*E,2));
    u=(p/2).*(norm2+eps).^(p-2); 
       
    obj(iter)=trace(E'*D) + r*(sum(norm2.^p));     
end

end


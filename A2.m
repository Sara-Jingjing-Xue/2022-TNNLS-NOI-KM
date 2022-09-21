% algorithm to solve (6) 
function [E, obj]= A2(r,D,Maxiter)


n=size(D,1);
U=2*eye(n);
u=diag(U);
ad = -1/(2*r)*D;

for iter=1:Maxiter
    for j=1:n
        ej = EProjSimplexdiag(ad(:,j), u);
        E(:,j) = ej';  
    end        
    norm2 = sqrt(sum(E.*E,2));
    u=1./(2*norm2+eps);
    
    obj(iter)=trace(E'*D) + r*sum(norm2);    
end

end





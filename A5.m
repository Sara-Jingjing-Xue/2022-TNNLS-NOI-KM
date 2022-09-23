clc
clear
close all


clc
clear
load data_Bridge.mat;  % r=100,p=0.9 %Ò»Ñש 

c=length(unique(Y));
X=X';
[d,n] = size(X);
maxiter=30;
D = EuDist0(X',X');
%% A5 
rmin=0;
rmax=min(sum(D));
for g=1:maxiter
    r=(rmin+rmax)/2;
    E= A4(r,D);
    
    E1=E;
    E1(find(E1<1E-6))=0;
    norm22 = sqrt(sum(E1.*E1,2));
    idex=find(norm22);
    c5=length(idex); 
    
    if c5<c
        rmax=r;
    elseif c5>c
        rmin=r;
    else
        break;
    end 
end
C=X(:,idex);


X=X';
C=C';
figure('name','initialization');
cm = colormap(jet(c));
plot(X(:,1),X(:,2),'.k', 'MarkerSize', 10); hold on;
rl = randperm(c);
for i=1:c
    plot(X(Y==rl(i),1),X(Y==rl(i),2),'.', 'color', cm(i,:),'MarkerSize', 14); hold on;   
end
plot(C(:,1),C(:,2),'.r', 'MarkerSize', 20); hold on;    
  

clc
clear all
x1=-10:0.01:10;
x2=-10:0.01:10;
m=size(x1,2);
n=size(x2,2);

z=zeros(m*n,1);
h=1;
x=[1.6240    7.3990   -2.5437    6.4181];

P1=[x(1), -x(3)*h; 
   -x(4)*h, x(2)*h^2];
P1S=(P1+P1')/2;
eig(P1S)

for i=1:m
    for j=1:n
        xv=[x1(i),x2(j)]';
        z( (i-1)*n+j )=xv'*P1*xv;
        if z( (i-1)*n+j )<0
           disp('matrix P is not positive definite')
        end  
    end
end

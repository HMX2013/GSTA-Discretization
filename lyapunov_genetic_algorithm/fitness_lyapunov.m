function y = fitness_lyapunov(x)
persistent runnng_time
if isempty(runnng_time)
   runnng_time=0;
end

x_axis=0:0.01:2.5;
y_axis=0:0.01:2.5;

m=size(x_axis,2);
n=size(y_axis,2);

u1=zeros(m*n,1);
u2=zeros(m*n,1);


for i=1:m
    for j=1:n
        u1( (i-1)*n+j )=x_axis(i);
        u2( (i-1)*n+j )=y_axis(j);
    end
end

area=0;
min_u1=10000;


for i=1:m*n
    h=0.1;
    P1=[x(1), -x(3)*h; 
       -x(4)*h, x(2)*h^2];
    P2=[x(5), -x(7)*h; 
       -x(8)*h, x(6)*h^2];
    P3=[x(9), -x(11)*h; 
       -x(12)*h, x(10)*h^2];
    P4=[x(13), -x(15)*h; 
       -x(16)*h, x(14)*h^2];
    P5=[x(17), -x(19)*h; 
       -x(20)*h, x(18)*h^2]; 
    P6=[x(21), -x(23)*h; 
       -x(24)*h, x(22)*h^2]; 
   
    M1=[u1(i)-1,h; (u2(i)-1)/h,1];
    
    DV1=-(M1'*P1*M1-P1);
    DV2=-(M1'*P2*M1-P2);
    DV3=-(M1'*P3*M1-P3);
    DV4=-(M1'*P4*M1-P4);
    DV5=-(M1'*P5*M1-P5);
    DV6=-(M1'*P6*M1-P6);
    
    if ( ((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=1) && (u2(i)>u1(i)/2 && u2(i)<=u1(i)))&&...
         ((det(DV1)>0 && DV1(1,1)>0 && det(P1)>0 && P1(1,1)>0)||...
          (det(DV2)>0 && DV2(1,1)>0 && det(P2)>0 && P2(1,1)>0)||...
          (det(DV3)>0 && DV3(1,1)>0 && det(P3)>0 && P3(1,1)>0)||...
          (det(DV4)>0 && DV4(1,1)>0 && det(P4)>0 && P4(1,1)>0)||...
          (det(DV5)>0 && DV5(1,1)>0 && det(P5)>0 && P5(1,1)>0)||...
          (det(DV6)>0 && DV6(1,1)>0 && det(P6)>0 && P6(1,1)>0)))
       area=area+1;
    end

    if ( ((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=1) && (u2(i)>u1(i)/2 && u2(i)<=u1(i)))&&...
         ~((det(DV1)>0 && DV1(1,1)>0 && det(P1)>0 && P1(1,1)>0)||...
          (det(DV2)>0 && DV2(1,1)>0 && det(P2)>0 && P2(1,1)>0)||...
          (det(DV3)>0 && DV3(1,1)>0 && det(P3)>0 && P3(1,1)>0)||...
          (det(DV4)>0 && DV4(1,1)>0 && det(P4)>0 && P4(1,1)>0)||...
          (det(DV5)>0 && DV5(1,1)>0 && det(P5)>0 && P5(1,1)>0)||...
          (det(DV6)>0 && DV6(1,1)>0 && det(P6)>0 && P6(1,1)>0)))
        if (u1(i)<min_u1)
            min_u1=u1(i);
        end 
    end   
       
end

% y(1)=1/area; 
% y(2)=1/min_u1;

y=1/min_u1;

runnng_time=runnng_time+1

save data_x x

end


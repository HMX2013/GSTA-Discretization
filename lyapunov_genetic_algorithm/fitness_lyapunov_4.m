function y = fitness_lyapunov_4(x)

persistent runnng_time
if isempty(runnng_time)
   runnng_time=0;
end
persistent max_u1_show
if isempty(max_u1_show)
   max_u1_show=0;
end


x_axis=0:0.008:2;
y_axis=0:0.008:1;

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

min_u1=10000;
u2_max_set=0.97;
interval=0.01;
h=0.1;

for i=1:m*n
    
    P1=[x(1), x(3)*h; 
        x(4)*h, x(2)*h^2];
    P2=[x(5), x(7)*h; 
        x(8)*h, x(6)*h^2];
    P3=[x(9), x(11)*h; 
        x(12)*h, x(10)*h^2];
    P4=[x(13), x(15)*h; 
        x(16)*h, x(14)*h^2];
   
    P1S=(P1+P1')/2; P2S=(P2+P2')/2; P3S=(P3+P3')/2; P4S=(P4+P4')/2;
%     P1S_eig=real(eig(P1S)); P2S_eig=real(eig(P2S)); P3S_eig=real(eig(P3S)); P4S_eig=real(eig(P4S));
    
    M1=[u1(i)-1,h; (u2(i)-1)/h,1];
    
    DV1=-(M1'*P1*M1-P1);
    DV2=-(M1'*P2*M1-P2);
    DV3=-(M1'*P3*M1-P3);
    DV4=-(M1'*P4*M1-P4);

    DV1S=(DV1+DV1')/2;  DV2S=(DV2+DV2')/2;  DV3S=(DV3+DV3')/2;  DV4S=(DV4+DV4')/2;
%     DV1S_eig=real(eig(DV1S)); DV2S_eig=real(eig(DV2S)); DV3S_eig=real(eig(DV3S)); DV4S_eig=real(eig(DV4S));
    
    if (((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>u1(i)/2-interval && u2(i)<=u1(i)))&&...
         ~((DV1S(1,1)>0 && (4*DV1S(1,1)*DV1S(2,2)-(DV1S(1,2)+DV1S(2,1))^2>0) && P1S(1,1)>0 && (4*P1S(1,1)*P1S(2,2)-(P1S(1,2)+P1S(2,1))^2>0))||...
           (DV2S(1,1)>0 && (4*DV2S(1,1)*DV2S(2,2)-(DV2S(1,2)+DV2S(2,1))^2>0) && P2S(1,1)>0 && (4*P2S(1,1)*P2S(2,2)-(P2S(1,2)+P2S(2,1))^2>0))||...
           (DV3S(1,1)>0 && (4*DV3S(1,1)*DV3S(2,2)-(DV3S(1,2)+DV3S(2,1))^2>0) && P3S(1,1)>0 && (4*P3S(1,1)*P3S(2,2)-(P3S(1,2)+P3S(2,1))^2>0))||...
           (DV4S(1,1)>0 && (4*DV4S(1,1)*DV4S(2,2)-(DV4S(1,2)+DV4S(2,1))^2>0) && P4S(1,1)>0 && (4*P4S(1,1)*P4S(2,2)-(P4S(1,2)+P4S(2,1))^2>0)))&&...
           (u1(i)~=0 && u2(i)~=0))
        if (u1(i)<min_u1)
            min_u1=u1(i);
        end 
    end       
%     if (((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>u1(i)/2 && u2(i)<=u1(i)))&&...
%          ~((DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0)||...
%            (DV2S_eig(1)>0 && DV2S_eig(2)>0 && P2S_eig(1)>0 && P2S_eig(2)>0)||...
%            (DV3S_eig(1)>0 && DV3S_eig(2)>0 && P3S_eig(1)>0 && P3S_eig(2)>0)||...
%            (DV4S_eig(1)>0 && DV4S_eig(2)>0 && P4S_eig(1)>0 && P4S_eig(2)>0)) && (u1(i)~=0 && u2(i)~=0))
%         if (u1(i)<min_u1)
%             min_u1=u1(i);
%         end 
%     end   
       
end

y=1/min_u1;


if(max_u1_show<min_u1 && min_u1>0 && min_u1<2.1)
    max_u1_show=min_u1;
end

max_u1_show_ = [' max_u1_show is ',num2str(max_u1_show)];
disp(max_u1_show_)

runnng_time=runnng_time+1;

runnng_time_ = [' runnng_time is ',num2str(runnng_time)];
disp(runnng_time_)


save data_x x

end


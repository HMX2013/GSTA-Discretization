function y = fitness_lyapunov_1(x)
persistent runnng_time
if isempty(runnng_time)
   runnng_time=0;
end

x_axis=0:0.01:2;
y_axis=0:0.01:2;

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
max_u1=0;
h=0.6;
score=1;

for i=1:m*n
    P1=[x(1), -x(3)*h; 
       -x(3)*h, x(2)*h^2];
%     P1S=(P1+P1')/2;
%     P1S_eig=real(eig(P1S));
    
    M1=[u1(i)-1,h; (u2(i)-1)/h,1];
    
    DV1=-(M1'*P1*M1-P1);
%     DV1S=(DV1+DV1')/2;
%     DV1S_eig=real(eig(DV1S));

    if (DV1(1,1)>0 && det(DV1)>0 && P1(1,1)>0 && det(P1)>0)
%         if (u1(i)<min_u1)
%             min_u1=u1(i);
%         end
        if (u1(i)>max_u1)
            max_u1=u1(i);
        end

%         score=score+1;
    end      
    
%     if (((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=1) && (u2(i)>=u1(i)/2 && u2(i)<=u1(i)))&&...
%          ~(DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0) && (u1(i)~=0 && u2(i)~=0))
%         if (u1(i)<min_u1)
%             min_u1=u1(i);
%         end 
%         score=score+1;
%     end   
    
%     if (((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=1) && (u2(i)>=u1(i)/2 && u2(i)<=u1(i)))&&...
%          (DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0) && (u1(i)~=0 && u2(i)~=0))
% %         if (u1(i)<min_u1)
% %             min_u1=u1(i);
% %         end
%         if (u1(i)>max_u1)
%             max_u1=u1(i);
%         end
% 
%         score=score+1;
%     end   
    
%     if (DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0)
% %         if (u1(i)<min_u1)
% %             min_u1=u1(i);
% %         end
%         if (u1(i)>max_u1)
%             max_u1=u1(i);
%         end
% 
%         score=score+1;
%     end   


end


% y=1/min_u1;
% y=1/max_u1;
y=1/score;

runnng_time=runnng_time+1

save data_x x

end


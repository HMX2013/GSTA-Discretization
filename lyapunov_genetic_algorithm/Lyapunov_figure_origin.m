
clc
clear

x_axis=0:0.002:2;
y_axis=0:0.002:2;

m=size(x_axis,2);
n=size(y_axis,2);

u1=zeros(m*n,1);
u2=zeros(m*n,1);

min_u1=1000;
u2_max_set=1;

x1_1=zeros(m*n,1);
x2_1=zeros(m*n,1);

x1_2=zeros(m*n,1);
x2_2=zeros(m*n,1);

x1_3=zeros(m*n,1);
x2_3=zeros(m*n,1);


for i=1:m
    for j=1:n
        u1( (i-1)*n+j )=x_axis(i);
        u2( (i-1)*n+j )=y_axis(j);
    end
end

score=1;

x=[1,2,-1,-1];

is_valid=true;
max_x1=0;
max_u1=0;
max_u2=0;
h=1000;
  
for i=1:m*n
    P1=[x(1), x(3)*h; 
        x(4)*h, x(2)*h^2];

    P1S=(P1+P1')/2; 

    M1=[u1(i)-1,h; (u2(i)-1)/h,1];
    
    DV1=-(M1'*P1*M1-P1);

    DV1S=(DV1+DV1')/2; 

    if((DV1S(1,1)>0 && (4*DV1S(1,1)*DV1S(2,2)-(DV1S(1,2)+DV1S(2,1))^2>0) && P1S(1,1)>0 && (4*P1S(1,1)*P1S(2,2)-(P1S(1,2)+P1S(2,1))^2>0)) &&...
       ~((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>=u1(i)/2 && u2(i)<=u1(i))))
        x1_1(i)=u1(i); x2_1(i)=u2(i);
    else
        x1_1(i)=0; x2_1(i)=0;
    end       
    
    if (((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>u1(i)/2 && u2(i)<=u1(i)))&&...
       (DV1S(1,1)>0 && (4*DV1S(1,1)*DV1S(2,2)-(DV1S(1,2)+DV1S(2,1))^2>0) && P1S(1,1)>0 && (4*P1S(1,1)*P1S(2,2)-(P1S(1,2)+P1S(2,1))^2>0))&&...
       (u1(i)~=0 && u2(i)~=0))
       x1_2(i)=u1(i); x2_2(i)=u2(i);
    else
       x1_2(i)=0; x2_2(i)=0;
    end

    if (((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>= u1(i)/2 && u2(i)<=u1(i)))&&...
       ~(DV1S(1,1)>0 && (4*DV1S(1,1)*DV1S(2,2)-(DV1S(1,2)+DV1S(2,1))^2>0) && P1S(1,1)>0 && (4*P1S(1,1)*P1S(2,2)-(P1S(1,2)+P1S(2,1))^2>0))&&...
       (u1(i)~=0 && u2(i)~=0))
   
        x1_3(i)=u1(i); x2_3(i)=u2(i);
        if (u1(i)<min_u1)
            min_u1=u1(i);
        end 
    else
        x1_3(i)=0; x2_3(i)=0;
    end
    
end


% set(gcf,'position',[600,40,468,350],'PaperPositionMode','auto');
set(gcf,'position',[600,40,303,228],'PaperPositionMode','auto');
set(gcf,'color','w');

figure(1)
set(gca,'Position',[0.118503118503119 0.144444444444444 0.862785862785862 0.838888888888889]);
p1_axis = gca; 
scatter(x1_1,x2_1,0.1,...
                    'LineWidth',0.01,...  
                    'DisplayName','$ \mathcal K $',...
                    'MarkerEdgeColor',[0.0745098039215686 0.623529411764706 1],...
                    'MarkerFaceColor',[0.0745098039215686 0.623529411764706 1] ); 
hold on
scatter(x1_2,x2_2,0.1,...
                    'LineWidth',0.1,...  
                    'DisplayName','$ \mathcal M $',...
                    'MarkerEdgeColor',[0.568627450980392 0.258823529411765 0.858823529411765],...
                    'MarkerFaceColor',[0.568627450980392 0.258823529411765 0.858823529411765] ); 
hold on
scatter(x1_3,x2_3,0.1,...
                    'LineWidth',0.01,...
                    'DisplayName','$ \mathcal K_M $',...
                    'MarkerEdgeColor',[1 0.2 0.1],...
                    'MarkerFaceColor',[1 0.2 0.1] );

set(gca,'Linewidth',0.8,'FontSize',9,'FontName','Times New Roman','FontWeight','light');
xlabel('$ {{\hat{u}}_{1,k}} $','Interpreter','latex');
ylabel('$ {{\hat{u}}_{2,k}} $','Interpreter','latex');


legend1 = legend(p1_axis,'show');
set(legend1,...
    'Box','on',...
    'Interpreter','latex',...
    'Position',[0.725808684501039 0.304166666666667 0.211612266086015 0.195833333333333]);
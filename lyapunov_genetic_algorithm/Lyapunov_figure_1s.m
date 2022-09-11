
clc
clear
x_axis=0:0.005:2;
y_axis=0:0.005:2;

m=size(x_axis,2);
n=size(y_axis,2);

u1=zeros(m*n,1);
u2=zeros(m*n,1);

min_u1=1000;
u2_max_set=1;

x1_1=zeros(m*n,1);
x2_1=zeros(m*n,1);


for i=1:m
    for j=1:n
        u1( (i-1)*n+j )=x_axis(i);
        u2( (i-1)*n+j )=y_axis(j);
    end
end

x=[1,2,-1,-1];

is_valid=true;
max_x1=0;
max_u1=0;
max_u2=0;
h=0.6;
score=1;


for i=1:m*n
    P=[x(1), x(4)*h; 
       x(3)*h, x(2)*h^2];
    a=x(1);
    b=x(2);
    c=x(3);
    d=x(4);
    DV=[a-a*(u1(i)-1)^2-(c+d)*(u1(i)-1)*(u2(i)-1)-b*(u2(i)-1)^2, h*(d-(a+d)*(u1(i)-1)-(c+b)*(u2(i)-1));
        h*(c-(a+c)*(u1(i)-1)-(d+b)*(u2(i)-1)), h^2*(-a-c-d)];

    if(P(1,1)>0 && 4*P(1,1)*P(2,2)-(P(1,2)+P(2,1))^2>0 && DV(1,1)>0 && 4*DV(1,1)*DV(2,2)-(DV(1,2)+DV(2,1))^2>0) 
        x1_1(i)=u1(i); x2_1(i)=u2(i);
    else
        x1_1(i)=0; x2_1(i)=0;
    end       
end
set(gcf,'position',[600,40,468,350],'PaperPositionMode','auto');
set(gcf,'color','w');
p1_axis = gca; 
scatter(x1_1,x2_1,0.1,...
                    'LineWidth',0.01,...  
                    'DisplayName','$ \mathcal K $',...
                    'MarkerEdgeColor',[0.0745098039215686 0.623529411764706 1],...
                    'MarkerFaceColor',[0.0745098039215686 0.623529411764706 1] ); 
hold on

                            
xlabel('$ {{\hat{u}}_{1,k}} $','Interpreter','latex');
ylabel('$ {{\hat{u}}_{2,k}} $','Interpreter','latex');

% clc
% clear
x_axis=0:0.01:2;
y_axis=0:0.01:2;

m=size(x_axis,2);
n=size(y_axis,2);

u1=zeros(m*n,1);
u2=zeros(m*n,1);

min_u1=1000;
u2_max_set=0.93;

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

% [1.49504534885141,9.14416891635604,3.02304921199904,0.905756902578500,0.956203619789844,7.64486875278753,3.49525009839326,0.454250329095063]
% x=[15.3410577512253,107.288300802618,1.72707387554316,47.4082292222562,67.3361105395089,115.426519424393,33.4516104440043,95.2614172393100,38.3018675063321,140.835140727798,86.5434498578030,2.26520342561447,55.2154552605688,34.8006382645027,77.9342079927754,93.1002205391334,1.49504534885141,9.14416891635604,3.02304921199904,0.905756902578500,0.956203619789844,7.64486875278753,3.49525009839326,0.454250329095063]
% x=[6.35504349333889,9.76888394967081,3.50881167941766,9.84408084422364,1.11772868963886,8.25184993353619,-1.16200388188252,4.19041902789315,-6.13032391242406,-2.18086228112858,3.93035495005178,-1.57573071714279,0.486000660772267,1.46977369720405,0.273649240802911,0.471644831133136,3.86360366100942,-8.82607470016464,-6.96452546535209,2.63919954054024]
% x=[4.06449866233603,6.83336453936770,3.03495280232523,4.43124911948346,1.54438216295130,7.34451314284119,-2.55156630663652,6.41259521558742,0.313130915947193,4.56647353905378,1.28383100951862,-0.581188258916014,3.03831778689711,6.34823427394752,2.56282828201837,4.54823140079128,0.791547015018065,6.78897886451943,3.79815104354238,-1.94244678728123]

% x=[4.04722487519295,6.48690614717158,2.82778714455755,4.27742777287156,1.65572471724162,7.28085391067915,-2.39620711550045,5.95270578179120,0.611854198308644,4.95306557014141,1.28766384872166,-0.247930097073971,3.02236762903377,5.60603244993623,2.55597646695641,4.42832174239781,0.517810032836157,6.70887898698777,3.33577753438104,-1.82738875749167]

% x=[4.07810610350883,6.50620772515071,2.91506142248865,4.42877110133528,1.62402909558525,7.39902795117964,-2.54372324089101,6.41806138914203,0.317007845882595,4.79817676488107,1.28888899842732,-0.580402137482966,3.01878275488986,5.57502981203391,2.56214419312493,4.44790179577532,0.798126903068990,6.79316392465243,3.79261384396638,-1.91932864037791]

x=[3.00480581781246,3.84725468733531,2.10123359430734,3.28333593248643,1.13867485787243,7.70255152430854,-2.66832335663452,5.02129996131631,2.15436229690837,6.76045742085188,1.06563493628433,2.86381208696337,3.69094046753804,6.50821790017272,5.16979561823945,3.07171222441002,0.735089510794274,8.06548305911655,4.18832405400446,-2.27305135840271]

is_valid=true;
max_x1=0;
max_u1=0;
max_u2=0;
h=1000;
  
for i=1:m*n
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
   
    P1S=(P1+P1')/2; P2S=(P2+P2')/2; P3S=(P3+P3')/2; P4S=(P4+P4')/2; P5S=(P5+P5')/2;
    P1S_eig=real(eig(P1S)); P2S_eig=real(eig(P2S)); P3S_eig=real(eig(P3S)); P4S_eig=real(eig(P4S)); P5S_eig=real(eig(P5S));
    
    M1=[u1(i)-1,h; (u2(i)-1)/h,1];
    
    DV1=-(M1'*P1*M1-P1);
    DV2=-(M1'*P2*M1-P2);
    DV3=-(M1'*P3*M1-P3);
    DV4=-(M1'*P4*M1-P4);
    DV5=-(M1'*P5*M1-P5);
    
    DV1S=(DV1+DV1')/2;  DV2S=(DV2+DV2')/2;  DV3S=(DV3+DV3')/2;  DV4S=(DV4+DV4')/2; DV5S=(DV5+DV5')/2;
    DV1S_eig=real(eig(DV1S)); DV2S_eig=real(eig(DV2S)); DV3S_eig=real(eig(DV3S)); DV4S_eig=real(eig(DV4S)); DV5S_eig=real(eig(DV5S));
       
    if((DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0)||...
       (DV2S_eig(1)>0 && DV2S_eig(2)>0 && P2S_eig(1)>0 && P2S_eig(2)>0)||...
       (DV3S_eig(1)>0 && DV3S_eig(2)>0 && P3S_eig(1)>0 && P3S_eig(2)>0)||...
       (DV4S_eig(1)>0 && DV4S_eig(2)>0 && P4S_eig(1)>0 && P4S_eig(2)>0)||...
       (DV5S_eig(1)>0 && DV5S_eig(2)>0 && P5S_eig(1)>0 && P5S_eig(2)>0)) &&...
       ~((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>=u1(i)/2 && u2(i)<=u1(i)))
        x1_1(i)=u1(i); x2_1(i)=u2(i);
    else
        x1_1(i)=0; x2_1(i)=0;
    end       
    
    if (((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>=u1(i)/2 && u2(i)<=u1(i)))&&...
         ((DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0)||...
           (DV2S_eig(1)>0 && DV2S_eig(2)>0 && P2S_eig(1)>0 && P2S_eig(2)>0)||...
           (DV3S_eig(1)>0 && DV3S_eig(2)>0 && P3S_eig(1)>0 && P3S_eig(2)>0)||...
           (DV4S_eig(1)>0 && DV4S_eig(2)>0 && P4S_eig(1)>0 && P4S_eig(2)>0)||...
           (DV5S_eig(1)>0 && DV5S_eig(2)>0 && P5S_eig(1)>0 && P5S_eig(2)>0)) && (u1(i)~=0 && u2(i)~=0))
       x1_2(i)=u1(i); x2_2(i)=u2(i);
    else
       x1_2(i)=0; x2_2(i)=0;
    end

    if (((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=u2_max_set) && (u2(i)>= u1(i)/2 && u2(i)<=u1(i)))&&...
         ~((DV1S_eig(1)>0 && DV1S_eig(2)>0 && P1S_eig(1)>0 && P1S_eig(2)>0)||...
           (DV2S_eig(1)>0 && DV2S_eig(2)>0 && P2S_eig(1)>0 && P2S_eig(2)>0)||...
           (DV3S_eig(1)>0 && DV3S_eig(2)>0 && P3S_eig(1)>0 && P3S_eig(2)>0)||...
           (DV4S_eig(1)>0 && DV4S_eig(2)>0 && P4S_eig(1)>0 && P4S_eig(2)>0)||...
           (DV5S_eig(1)>0 && DV5S_eig(2)>0 && P5S_eig(1)>0 && P5S_eig(2)>0)) && (u1(i)~=0 && u2(i)~=0))
        x1_3(i)=u1(i); x2_3(i)=u2(i);
        if (u1(i)<min_u1)
            min_u1=u1(i);
        end 
    else
        x1_3(i)=0; x2_3(i)=0;
    end
    
end


% set(gcf,'position',[600,40,468,350],'PaperPositionMode','auto');
set(gcf,'position',[600,40,321,240],'PaperPositionMode','auto');
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

% line([0,1.85],[0.95,0.95],'color','k','linestyle','--','Marker','v');
% hold on
% line([1.85,1.85],[0,0.95],'color','k','linestyle','--','Marker','v'); 
% hold on
set(gca,'Linewidth',0.8,'FontSize',9,'FontName','Times New Roman','FontWeight','light');
xlabel('$ {{\hat{u}}_{1,k}} $','Interpreter','latex');
ylabel('$ {{\hat{u}}_{2,k}} $','Interpreter','latex');


% zone figure
set(groot,'defaultAxesLineStyleOrder','remove','defaultAxesColorOrder','remove');
subp1=axes('Position',[0.529595015576324 0.252380952380953 0.379942487419125 0.280952380952381]);
axes(subp1);            
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
set(subp1,'xlim',[1.6 1.9]);
set(subp1,'Linewidth',0.8,'FontSize',8,'FontName','Times New Roman','FontWeight','light');
line([1.5,1.84],[0.95,0.95],'color','k','linestyle','--','Marker','v');
hold on
line([1.84,1.84],[0.95,0.7],'color','k','linestyle','--','Marker','v'); 
grid on;

annotation(figure(1),'textbox',...
    [0.836367106288986 0.260552451893233 0.000255814708945534 0.000403476101800193],...
    'String',{'1.84'},...
    'FontSize',8,...
    'FontName','Times New Roman',...
    'FitBoxToText','off');

annotation(figure(1),'textbox',...
    [0.430961700883591 0.532774674115455 0.000255814708945534 0.000403476101800249],...
    'String','0.95',...
    'FontSize',8,...
    'FontName','Times New Roman',...
    'FitBoxToText','off');

legend1 = legend(p1_axis,'show');
set(legend1,...
    'Box','on',...
    'Interpreter','latex',...
    'Position',[0.165061020949637 0.6625 0.211612266086015 0.195833333333333]);
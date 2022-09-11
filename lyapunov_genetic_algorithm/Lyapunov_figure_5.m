
% clc
% clear
x_axis=0:0.005:2;
y_axis=0:0.005:2;

m=size(x_axis,2);
n=size(y_axis,2);

u1=zeros(m*n,1);
u2=zeros(m*n,1);

min_u1=1000;

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

% x=[5.29004602370707,6.27878970494364,2.19014031470241,6.30500358473331,1.38471122824842,5.67707871094981,3.48199883867618,0.0826695143320430]
% x=[5.22068086821557,8.93180707314556,6.90044326956146,0.878035075084104,6.83871326103101,2.16797963230644,4.84588435956439,6.15293106865946,5.49897093835566,9.34553727414404,7.12235780261832,5.11178610906011,2.23594936990331,9.06588055755291,5.76164061069632,0.339536897761582]
% x=[6.06728783204881,7.99301981018162,5.07472148266123,6.62377241068337,-5.61668034891236,8.74182735920617,9.30889533894879,8.78426312741914,5.15836466493554,-0.687109061704891,-5.49476519195393,2.04773033413987,8.08845170858902,-4.45273499224843,7.74911274424965,2.81109648443643]

% x=[6.35504349333889,9.76888394967081,3.50881167941766,9.84408084422364,1.11772868963886,8.25184993353619,-1.16200388188252,4.19041902789315,-6.13032391242406,-2.18086228112858,3.93035495005178,-1.57573071714279,0.486000660772267,1.46977369720405,0.273649240802911,0.471644831133136,3.86360366100942,-8.82607470016464,-6.96452546535209,2.63919954054024]
x=[4.06449866233603,6.83336453936770,3.03495280232523,4.43124911948346,1.54438216295130,7.34451314284119,-2.55156630663652,6.41259521558742,0.313130915947193,4.56647353905378,1.28383100951862,-0.581188258916014,3.03831778689711,6.34823427394752,2.56282828201837,4.54823140079128,0.791547015018065,6.78897886451943,3.79815104354238,-1.94244678728123]
% x=[4.07810610350883,6.50620772515071,2.91506142248865,4.42877110133528,1.62402909558525,7.39902795117964,-2.54372324089101,6.41806138914203,0.317007845882595,4.79817676488107,1.28888899842732,-0.580402137482966,3.01878275488986,5.57502981203391,2.56214419312493,4.44790179577532,0.798126903068990,6.79316392465243,3.79261384396638,-1.91932864037791]
% x=[4.00679637676886,6.34633971015226,2.90384907878017,4.18229394961852,1.72623480724902,7.28360403887703,-2.27850309246751,5.42830708815822,0.359528506478357,4.79844865187521,1.58470215843926,-0.774005343821423,3.18581969103243,5.47117595317499,2.67727381907916,4.38981188909756,0.866757472837708,6.75808681603496,3.65245296808825,-1.87059096222635]


is_valid=true;
max_x1=0;
max_u1=0;
max_u2=0;
h=0.6;

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
       (DV5S_eig(1)>0 && DV5S_eig(2)>0 && P5S_eig(1)>0 && P5S_eig(2)>0))
        x1_1(i)=u1(i); x2_1(i)=u2(i);
    else
        x1_1(i)=0; x2_1(i)=0;
    end       
    
    if ((u1(i)>=0 && u1(i)<=2 && u2(i)>=0 && u2(i)<=0.96) && (u2(i)>u1(i)/2-0.01 && u2(i)<=u1(i)))||(u1(i)==0 && u2(i)==0) 
       x1_2(i)=u1(i); x2_2(i)=u2(i);
    else
       x1_2(i)=0; x2_2(i)=0;
    end


    if (((u1(i)>=0 && u1(i)<2 && u2(i)>=0 && u2(i)<=0.96) && (u2(i)>u1(i)/2-0.01 && u2(i)<=u1(i)))&&...
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


set(gcf,'position',[600,40,468,350],'PaperPositionMode','auto');
set(gcf,'color','w');
p1_axis = gca; 
scatter(x1_1,x2_1,0.1,...
                    'LineWidth',0.01,...  
                    'DisplayName','$ \mathcal K $',...
                    'MarkerEdgeColor',[0.0745098039215686 0.623529411764706 1],...
                    'MarkerFaceColor',[0.0745098039215686 0.623529411764706 1] ); 
hold on
scatter(x1_2,x2_2,0.1,...
                    'LineWidth',0.01,...  
                    'DisplayName','$ \mathcal K $',...
                    'MarkerEdgeColor',[0.568627450980392 0.258823529411765 0.858823529411765],...
                    'MarkerFaceColor',[0.568627450980392 0.258823529411765 0.858823529411765] );
hold on
scatter(x1_3,x2_3,0.1,...
                    'LineWidth',0.01,...  
                    'DisplayName','$ \mathcal K $',...
                    'MarkerEdgeColor',[1 0.2 0.1],...
                    'MarkerFaceColor',[1 0.2 0.1] );

                            
xlabel('$ {{\hat{u}}_{1,k}} $','Interpreter','latex');
ylabel('$ {{\hat{u}}_{2,k}} $','Interpreter','latex');
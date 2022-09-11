set(gcf,'position',[600,100,303,530],'PaperPositionMode','auto');
set(gcf,'color','w');

lw=1.0; % axis width
LW=1.0; % line width
FS=9;   % 

sf_length=0.84;
sf_width=0.246;

sf_left=0.12;

sf_bottom1=0.68;
sf_bottom2=0.37;
sf_bottom3=0.07;

c1=[0,113,189]/255;
c2=[217,82,24]/255;
% c3=[2,62,20]/255;


% the first figure
subplot(311);
set(gca,'Position',[sf_left sf_bottom1 sf_length sf_width]);
p1=plot( t, x1_k_ext(:,1), t, x1_k_semi(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit Euler','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
ylabel('${{x}_{1}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;
% \[{{x}_{k}}\]
% $\tilde{f_{1}}$
% magnify figure
set(groot,'defaultAxesLineStyleOrder','remove','defaultAxesColorOrder','remove');
i1=axes('Position',[0.541795665634676 0.806569343065693 0.284829721362228 0.0930656934306555]);
axes(i1);
p11=plot( t,  x1_k_ext(:,1), t, x1_k_semi(:,1) ); 
set(p11(1),'LineWidth',LW, 'Color',c1);
set(p11(2),'LineWidth',LW, 'Color',c2);
set(i1,'xlim',[3 5]);
g = get(p11,'Parent');
set(g{1},'Linewidth',0.8,'FontSize',8,'FontName','Times New Roman','FontWeight','normal');
grid on;

% the second figure
subplot(312);
set(gca,'Position',[sf_left sf_bottom2 sf_length sf_width]);
p2=plot( t, x2_k_ext(:,1), t, x2_k_semi(:,1),'linewidth',1.2 ); p2_axis=gca; 
set(p2(1),'LineWidth',LW,'Color',c1);
set(p2(2),'LineWidth',LW, 'Color',c2);
g = get(p2,'Parent');
ax = gca;
% ax.YAxis.Exponent =-2;
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
ylabel('${{x}_{2,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

% magnify figure
% set(groot,'defaultAxesLineStyleOrder','remove','defaultAxesColorOrder','remove');
% i2=axes('Position',[0.397980273657217 0.161111111111111 0.325675640321278 0.16022222222222]);
% axes(i2);
% p21=plot(t, u_k_ext(:,1), t, u_k_semi(:,1) ); 
% set(p21(1),'LineWidth',LW,'Color',c1);
% set(p21(2),'LineWidth',LW, 'Color',c2);
% set(i2,'xlim',[5 8]);
% g = get(p21,'Parent');
% set(g{1},'Linewidth',0.8,'FontSize',8,'FontName','Times New Roman','FontWeight','normal');
% grid on;

subplot(313);
set(gca,'Position',[sf_left sf_bottom3 sf_length sf_width]);
p1=plot( t, u_k_ext(:,1), t, u_k_semi(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit Euler','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
xlabel('time(s)');
ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


legend1 = legend(p1_axis,'show');
set(legend1,...
    'Position',[0.0884724866099781 0.939425831220633 0.840860215053763 0.0555555555555556],...
    'Orientation','horizontal',...
    'Box','off',...
    'FontSize',9,...
    'FontWeight','normal',...
    'NumColumns',2);

% export setting: width 8.2cm
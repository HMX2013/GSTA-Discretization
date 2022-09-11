set(gcf,'position',[600,100,322,550],'PaperPositionMode','auto');
set(gcf,'color','w');

lw=1.0; % axis width
LW=1.0; % line width
FS=9;   % 

sf_length=0.39;
sf_width=0.24;

sf_left1=0.11;
sf_left2=0.58;

sf_bottom1=0.69;
sf_bottom2=0.37;
sf_bottom3=0.07;

c1=[0,113,189]/255;
c2=[217,82,24]/255;
% c3=[2,62,20]/255;


% the first figure
subplot(321);
set(gca,'Position',[sf_left1 sf_bottom1 sf_length sf_width]);
p1=plot( t, x1_k_ext(:,1), t, x1_k_ext_high(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit scheme','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit scheme','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
ylabel('${{x}_{1,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

% the second figure
subplot(322);
set(gca,'Position',[sf_left2 sf_bottom1 sf_length sf_width]);
p2=plot( t, x1_k_semi(:,1), t, x1_k_semi_high(:,1),'linewidth',1.2 ); p2_axis=gca; 
set(p2(1),'LineWidth',LW,'Color',c1);
set(p2(2),'LineWidth',LW, 'Color',c2);
g = get(p2,'Parent');
ax = gca;
ax.YAxis.Exponent =-2;
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
% ylabel('${{x}_{2,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

subplot(323);
set(gca,'Position',[sf_left1 sf_bottom2 sf_length sf_width]);
p1=plot( t, x2_k_ext(:,1), t, x2_k_ext_high(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit scheme','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit scheme','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
ylabel('${{x}_{2,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

subplot(324);
set(gca,'Position',[sf_left2 sf_bottom2 sf_length sf_width]);
p1=plot( t, x2_k_semi(:,1), t, x2_k_semi_high(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit scheme','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit scheme','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
% xlabel('time(s)');
% ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

subplot(325);
set(gca,'Position',[sf_left1 sf_bottom3 sf_length sf_width]);
p1=plot( t, u_k_ext(:,1), t, u_k_ext_high(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit scheme','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit scheme','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
xlabel('time(s)');
ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

subplot(326);
set(gca,'Position',[sf_left2 sf_bottom3 sf_length sf_width]);
p1=plot( t, u_k_semi(:,1), t, u_k_semi_high(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit scheme','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit scheme','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
xlabel('time(s)');
% ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
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
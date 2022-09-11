set(gcf,'position',[600,100,303,240],'PaperPositionMode','auto');
set(gcf,'color','w');

lw=1.0; % axis width
LW=1.0; % line width
FS=9;   % 

c1=[0,113,189]/255;
c2=[217,82,24]/255;
c3=[2,62,20]/255;

% the first figure
set(gca,'Position',[0.0859030837004405 0.15 0.897567990679727 0.802777777777778]);
p1=plot( t, x1_k_semi(:,1), t, x2_k_semi(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','${{x}_{1}}$','LineWidth',LW, 'Color',c2);
set(p1(2),'DisplayName','${{x}_{2}}$','LineWidth',LW, 'Color',c3);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
set(p1_axis,'xlim',[0 7]);
xlabel('time(s)');
% ylabel('$||x|{{|}_{2}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;
% ylabel(texlabel('x_{1}'));

legend1 = legend(p1_axis,'show');
set(legend1,...
    'Position',[0.680733290005414 0.347707152249604 0.227973568281938 0.179861111111111],...
    'Orientation','horizontal',...
    'Box','on',...
    'interpreter','latex',...
    'FontSize',9,...
    'LineWidth', 0.7,...
    'FontAngle','italic',...
    'FontName','Euclid',...
    'FontWeight','light',...
    'NumColumns',1);

% export setting: width 8.2cm
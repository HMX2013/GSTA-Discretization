set(gcf,'position',[600,100,303,240],'PaperPositionMode','auto');
set(gcf,'color','w');

lw=1.0; % axis width
LW=1.0; % line width
FS=9;   % 

c1=[0,113,189]/255;
c2=[217,82,24]/255;

% the first figure
set(gca,'Position',[0.178217821782178 0.15 0.805253252597987 0.802]);
p1=semilogy( t, x_norm_explicit(:,1), t, x_norm_semi(:,1) ); p1_axis=gca; 
set(p1(1),'DisplayName','explicit Euler','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','semi-implicit','LineWidth',LW, 'Color',c2);
g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','normal');
set(p1_axis,'xlim',[0 7]);
xlabel('time(s)');
ylabel('$||x|{{|}_{2}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


legend1 = legend(p1_axis,'show');
set(legend1,...
    'Position',[0.583799288351745 0.643536942331746 0.362603305785124 0.13],...
    'Orientation','horizontal',...
    'Box','on',...
    'FontSize',9,...
    'FontWeight','light',...
    'NumColumns',1);

% export setting: width 8.2cm
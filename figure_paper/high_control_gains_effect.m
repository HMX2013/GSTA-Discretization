
set(gcf,'position',[600,100,588,400],'PaperPositionMode','auto');
set(gcf,'color','w');

lw=0.8; FS=8; LW=1; sfw=0.24;
% c1=[220,20,60]/255;
% c2=[0,255,0]/255;
% c3=[0,0,255]/255;

c1=[0,113,189]/255;
c2=[217,82,24]/255;
% c3=[2,62,20]/255;
% c3=[0,139,139]/255;
c3=[34,139,34]/255;
	
figure(1)
subplot(321);
set(gca,'Position',[0.09,  0.70,  0.39, sfw]);
p1=plot( t, x1_k_ext1(:,1), t, x1_k_ext2(:,1),t, x1_k_ext3(:,1) ); p1_axis=gca;
set(p1(1),'DisplayName','{\Delta = 4}','LineWidth',LW, 'Color',c1);
set(p1(2),'DisplayName','{\Delta = 8}','LineWidth',LW, 'Color',c2);
set(p1(3),'DisplayName','{\Delta = 12}','LineWidth',LW, 'Color',c3);


g = get(p1,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p1_axis,'xlim',[0 7]);
ylabel('${{x}_{1}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


subplot(322);
set(gca,'Position',[0.56,  0.70,  0.39,  sfw]);
p2=plot( t, x1_k_semi1(:,1), t, x1_k_semi2(:,1),t, x1_k_semi3(:,1),'linewidth',1.2 ); p2_axis=gca; 
set(p2(1),'DisplayName','{\Delta = 4}','LineWidth',LW, 'Color',c1);
set(p2(2),'DisplayName','{\Delta = 8}','LineWidth',LW, 'Color',c2);
set(p2(3),'DisplayName','{\Delta = 12}','LineWidth',LW, 'Color',c3);
g = get(p2,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p2_axis,'xlim',[0 7]);
ylabel('${{x}_{1}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


subplot(323);
set(gca,'Position',[0.09,  0.39,  0.39,  sfw]);
p3=plot(t, x2_k_ext1(:,1), t, x2_k_ext2(:,1),t, x2_k_ext3(:,1),'linewidth',1.2 ); p3_axis=gca; 
set(p3(1),'LineWidth',LW, 'Color',c1);
set(p3(2),'LineWidth',LW, 'Color',c2);
set(p3(3),'LineWidth',LW, 'Color',c3);
g = get(p3,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p3_axis,'xlim',[0 7]);
ylabel('${{x}_{2,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


subplot(324);
set(gca,'Position',[0.56,  0.39,  0.39,  sfw]);
p4=plot(t, x2_k_semi1(:,1), t, x2_k_semi2(:,1),t,x2_k_semi3(:,1),'linewidth',1.2 ); p4_axis=gca; 
set(p4(1),'LineWidth',LW, 'Color',c1);
set(p4(2),'LineWidth',LW, 'Color',c2);
set(p4(3),'LineWidth',LW, 'Color',c3);
g = get(p4,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p4_axis,'xlim',[0 7]);
ylabel('${{x}_{2,k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;


subplot(325);
set(gca,'Position',[0.09,  0.07,  0.39,  sfw]);
p5=plot(t, u_k_ext1(:,1), t, u_k_ext2(:,1),t, u_k_ext3(:,1),'linewidth',1.2 ); p5_axis=gca; 
set(p5(1),'LineWidth',LW, 'Color',c1);
set(p5(2),'LineWidth',LW, 'Color',c2);
set(p5(3),'LineWidth',LW, 'Color',c3);
g = get(p5,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p5_axis,'xlim',[0 7]);
xlabel('time(s)','FontName','Times New Roman','FontSize',9,'FontWeight','light');
ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
grid on;

subplot(326);
set(gca,'Position',[0.56, 0.07,  0.39,  sfw]);
p6=plot(t, u_k_semi1(:,1), t, u_k_semi2(:,1),t, u_k_semi3(:,1),'linewidth',1.2); p6_axis=gca; 
set(p6(1),'LineWidth',LW, 'Color',c1);
set(p6(2),'LineWidth',LW, 'Color',c2);
set(p6(3),'LineWidth',LW, 'Color',c3);
g = get(p6,'Parent');
set(g{1},'Linewidth',lw,'FontSize',FS,'FontName','Times New Roman','FontWeight','bold');
set(p6_axis,'xlim',[0 7]);
xlabel('time(s)','FontName','Times New Roman','FontSize',9,'FontWeight','light');
ylabel('${{u}_{k}}$','interpreter','latex','FontName','Times New Roman','FontSize',10);
% legend(texlabel('psi_d'), texlabel('psi[Proposed]'), texlabel('psi[AGSTA]'));grid on;
grid on;

annotation(figure(1),'textbox',...
    [0.196733701814058 0.991227153596797 0.000750000000000112 0.000462100834542123],...
    'String',{'explicit-Euler'},...
    'FontName','Times New Roman',...
    'FitBoxToText','off');

annotation(figure(1),'textbox',...
    [0.690534155328795 0.993727153596797 0.000749999999999806 0.000462100834542123],...
    'String',{'semi-implicit'},...
    'FontName','Times New Roman',...
    'FitBoxToText','off');

legend1 = legend(p1_axis,'show');
set(legend1,...
    'Position',[0.324967321102912 0.832437813791447 0.145294117647059 0.0955882352941176],...
    'Orientation','horizontal',...
    'Linewidth',0.6,...
    'FontWeight','light',...
    'Box','on',...
    'NumColumns',1);

legend1 = legend(p2_axis,'show');
set(legend1,...
    'Position',[0.802341875863085 0.825901866079029 0.131176470588234 0.0955882352941176],...
    'Orientation','horizontal',...
    'Box','on',...
    'Linewidth',0.6,...
    'FontWeight','light',...
    'NumColumns',1);
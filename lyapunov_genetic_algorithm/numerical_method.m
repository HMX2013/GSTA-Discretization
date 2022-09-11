clc;
clear;
num=1;
% decrese the step size to increase the image resolution and increse the
% running time meanwhile.
step_size_xy=0.05;
step_size_gains=0.5;

for x=0:step_size_xy:2.1
    for y=0:step_size_xy:1.1
        sign=1;
        for a=0:step_size_gains:10
            for b=-10:step_size_gains:10
                for c=-10:step_size_gains:10
                    for d=-10:step_size_gains:10                         
                        if(a<=0||4*a*b-(c+d)^2<=0)
                            continue;
                        end
                        Q11=a-a*(x-1)^2-(c+d)*(x-1)*(y-1)-b*(y-1)^2;
                        Q12=d-(a+d)*(x-1)-(c+b)*(y-1);
                        Q21=c-(a+c)*(x-1)-(d+b)*(y-1);
                        Q22=-a-c-d;
                        % verify the matrix P and Q is positive
                        if(a>0 && 4*a*b-(c+d)^2>0 && Q11>0 && (4*Q11*Q22-(Q12+Q21)^2)>0)
                            for i=1:num-1
                                if x1(i)==x && y1(i)==y
                                    sign=0;
                                    break;
                                end
                            end
                            if sign
                                x1(num)=x;
                                y1(num)=y;
                                num=num+1;
                            end
                            sign=1;
                        end
                    end
                end
            end
        end
    end
    x_disp = ['x is:',num2str(x)];
    disp(x_disp)
end
fprintf("finish1\n");

% plot
set(gcf,'position',[600,40,321,240],'PaperPositionMode','auto');
set(gcf,'color','w');

figure(1)
set(gca,'Position',[0.118503118503119 0.144444444444444 0.862785862785862 0.838888888888889]);
p1_axis = gca;
scatter(x1,y1,0.1,...
                    'LineWidth',0.01,...
                    'DisplayName','$ \mathcal K_M $',...
                    'MarkerEdgeColor',[1 0.2 0.1],...
                    'MarkerFaceColor',[1 0.2 0.1] );
set(gca,'Linewidth',0.8,'FontSize',9,'FontName','Times New Roman','FontWeight','light');
xlim([0 2])
ylim([0 1.5])
xlabel('$ {{\hat{u}}_{1,k}} $','Interpreter','latex');
ylabel('$ {{\hat{u}}_{2,k}} $','Interpreter','latex');
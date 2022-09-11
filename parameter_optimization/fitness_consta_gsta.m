function y = fitness_consta_gsta(x)
persistent runnng_time
if isempty(runnng_time)
   runnng_time=0;
end
numSims  = numel(x(:,1));
simIn(1:numSims) = Simulink.SimulationInput('semi_GSTA_const');
for i = 1:numSims
simIn(i)= simIn(i).setBlockParameter('semi_GSTA_const/k1', 'Value',num2str(x(i,1)),...
                                     'semi_GSTA_const/k2', 'Value', num2str(x(i,2)),...
                                     'semi_GSTA_const/mu1', 'Value', num2str(x(i,3)),...
                                     'semi_GSTA_const/mu2', 'Value', num2str(x(i,4)));   
end
out = parsim(simIn,'ShowSimulationManager','on',...
                   'ShowProgress','off');
y=zeros(numSims,3);    

 for j = 1:numSims
    if out(1,j).pm_constraint==1 && out(1,j).uk_max<=30
        y(j,1)=out(1,j).INTU;
        y(j,2)=out(1,j).RMSE;
        y(j,3)=out(1,j).uk_max;
    else
        y(j,1)=1000000;
        y(j,2)=1000000;
        y(j,3)=1000000;
    end   
 end

runnng_time=runnng_time+1
 
save dat_x x

end


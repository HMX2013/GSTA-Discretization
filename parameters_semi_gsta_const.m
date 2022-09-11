
% initial parameters for GSTA
D=4;
px=[1.5*sqrt(D)   2*1.1*D  1  1.5];

x0=1; v0=-1;

sample_time=0.05;
sample_plot=0.01;

h=sample_time;
k1=px(1);
k2=px(2);
mu1=px(3);
mu2=px(4);

% verify the parameters choice satisfy GAS conditions.
c1=(2+h*k1*mu2)/(1+h*k1*mu2+h^2*k2*mu2^2)-1.78
c2=(1+h*k1*mu2)/(1+h*k1*mu2+h^2*k2*mu2^2)-0.97


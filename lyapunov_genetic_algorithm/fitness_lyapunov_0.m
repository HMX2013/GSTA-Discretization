function y = fitness_lyapunov_0(xx)

persistent runnng_time
if isempty(runnng_time)
   runnng_time=0;
end

h=0.6;
% xx=[0.537667139546100	1.83388501459509	-2.25884686100365	0.862173320368121];
% 0.537667139546100	1.83388501459509	-2.25884686100365	0.862173320368121
xx=[0.537667139546100	1	-1	0.862173320368121];
a=xx(1); b=xx(2); c=xx(3); d=xx(4); 
x=1.9; y=0.9;

DV=[a-a*(x-1)^2-(c+d)*(x-1)*(y-1)-b*(y-1)^2, h*(d-(a+d)*(x-1)-(c+b)*(y-1));
h*(c-(a+c)*(x-1)-(d+b)*(y-1)), h^2*(-a-c-d)];

if(a>0 && 4*a*b-(c+d)^2>0 && DV(1,1)>0 && 4*DV(1,1)*DV(2,2)-(DV(1,2)+DV(2,1))^2>0)
    score=1;
else
    score=10000;
end


y=score;

runnng_time=runnng_time+1

save data_x x

end


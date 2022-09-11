
num   = numel(f_o(:,1));
for i=1:num
    if abs(f_o(i,2)-0.5181)<0.0001
        best=i;
    end
end
vpa(f_o(best,:),7) 
xx=double(vpa(x_o(best,:),6))
%z=[ 0.9250073, 0.0004636241]
%fa=0.5901 0.6844 0.7377 0.8434 1.223





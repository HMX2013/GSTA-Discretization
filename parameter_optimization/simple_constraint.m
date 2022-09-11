function [c, ceq] = simple_constraint(x)
%SIMPLE_CONSTRAINT Nonlinear inequality constraints.
iter=numel(x(:,1));
%   Copyright 2005-2007 The MathWorks, Inc.
h=0.05;
% for i=1:iter
%     c(i) = 2-4*h^2*x(i,2)*x(i,4)^2-h*x(i,1)*x(i,4);
%     ceq(i)=-1;
% end
c=zeros(iter,1);
ceq=zeros(iter,1);

for i = 1:iter
    c(i,:) = [2-4*h^2*x(i,2)*x(i,4)^2-h*x(i,1)*x(i,4)];
    ceq(i,:)=-1;
end

% 2-4*h^2*k2*mu2^2-h*k1*mu2<=0
% No nonlinear equality constraints:

end


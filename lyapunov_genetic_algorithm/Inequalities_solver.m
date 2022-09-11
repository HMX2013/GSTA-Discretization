% deprecated

syms a b c d x y
cond1 = a >= -10;
cond2 = a <= 10;
cond3 = b >= -10;
cond4 = b <= 10;
cond5 = c >= -10;
cond6 = c <= 10;
cond7 = d >= -10;
cond8 = d <= 10;
cond9 = a > 0;
cond10 = 4*a*b-(c+d)^2>0;
cond11 = a-a*(x-1)^2-(c+d)*(x-1)*(y-1)-b*(y-1)^2>0;
cond12 = 4*(a-a*(x-1)^2-(c+d)*(x-1)*(y-1)-b*(y-1)^2)*(-a-c-d)...
            -(d-(a+d)*(x-1)-(c+b)*(y-1) + c-(a+c)*(x-1)-(d+b)*(y-1))^2>0;

conds = [cond1 cond2 cond3 cond4 cond5 cond6 cond7 cond8 cond9 cond10 cond11 cond12];

sol = solve(conds, [x,y], 'ReturnConditions', true);

sol.x
sol.y
sol.parameters
sol.conditions




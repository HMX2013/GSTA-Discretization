clc 
FitnessFunction = @fitness_lyapunov_4; % Function handle to the fitness function
nvars = 16;    % Number of variables
lb = [      
      -10 %a1
      -10 %b1
      -10 %c1
      -10 %d1
      -10 %a2
      -10 %b2
      -10 %c2
      -10 %d2
      -10 %a3
      -10 %b3
      -10 %c3
      -10 %d3
      -10 %a4
      -10 %b4
      -10 %c4
      -10 %d4
];   % Lower bound

ub = [
      10  %a1
      10  %b1
      10  %c1
      10  %d1
      10  %a2
      10  %b2
      10  %c2
      10  %d2
      10  %a3
      10  %b3
      10  %c3
      10  %d3
      10  %a4
      10  %b4
      10  %c4
      10  %d4
];   % Upper bound
A = []; % No linear inequality constraints
b = []; % No linear inequality constraints
Aeq = []; % No linear equality constraints
beq = []; % No linear equality constraints
% ConstraintFunction = @simple_constraint;
options = optimoptions(@gamultiobj,...  
         'PlotFcn',{@gaplotpareto,@gaplotscorediversity},...
         'DistanceMeasureFcn',{@distancecrowding,'genotype'},...%function space (phenotype,default) or design space (genotype). 
         'ParetoFraction',0.35,...                                                           %The Pareto fraction has a default value of 0.35
         'UseParallel',true,...
         'InitialPopulationMatrix',x0,...
         'FunctionTolerance',1e-4,...&default1e-3
         'CrossoverFraction',0.8,...
         'MaxGenerations',35,...
         'PopulationSize',800); 
rng default           % For reproducibility rng, 'twister');
[x_o,f_o,exitFlag,Output] = gamultiobj(FitnessFunction, nvars ,A, b, Aeq, beq, lb, ub, options);
load train; sound(y,Fs)

%  'InitialPopulationMatrix',x0,...

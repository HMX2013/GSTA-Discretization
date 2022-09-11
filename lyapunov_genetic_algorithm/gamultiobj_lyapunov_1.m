clc 
FitnessFunction = @fitness_lyapunov_1; % Function handle to the fitness function
nvars = 4;    % Number of variables
lb = [      
      -10  %a1
      -10  %b1
      -10  %c1
      -10  %d1
];   % Lower bound

ub = [
      10  %a1
      10  %b1
      10  %c1
      10  %d1
];   % Lower bound
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
         'FunctionTolerance',1e-3,...&default1e-3
         'CrossoverFraction',0.8,...
         'MaxGenerations',20,...
         'PopulationSize',800); 
rng default           % For reproducibility rng, 'twister');
[x_os,f_o,exitFlag,Output] = gamultiobj(FitnessFunction, nvars ,A, b, Aeq, beq, lb, ub, options);
load train; sound(y,Fs)

%  'InitialPopulationMatrix',x0,...
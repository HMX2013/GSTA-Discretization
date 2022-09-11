clc 
FitnessFunction = @fitness_lyapunov; % Function handle to the fitness function
nvars = 24;    % Number of variables
lb = [      
      0.1 %a1
      0.1 %b1
      0.1 %c1
      0.1 %d1
      0.1 %a2
      0.1 %b2
      0.1 %c2
      0.1 %d2
      0.1 %a3
      0.1 %b3
      0.1 %c3
      0.1 %d3
      0.1 %a4
      0.1 %b4
      0.1 %c4
      0.1 %d4
      0.1 %a5
      0.1 %b5
      0.1 %c5
      0.1 %d5
      0.1 %a6
      0.1 %b6
      0.1 %c6
      0.1 %d6
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
      10  %a5
      10  %b5
      10  %c5
      10  %d5
      10  %a6
      10  %b6
      10  %c6
      10  %d6
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
         'InitialPopulationMatrix',x0,...
         'FunctionTolerance',1e-3,...&default1e-3
         'CrossoverFraction',0.8,...
         'MaxGenerations',20,...
         'PopulationSize',2000); 
rng default           % For reproducibility rng, 'twister');
[x_o,f_o,exitFlag,Output] = gamultiobj(FitnessFunction, nvars ,A, b, Aeq, beq, lb, ub, options);
load train; sound(y,Fs)

%  'InitialPopulationMatrix',x0,...

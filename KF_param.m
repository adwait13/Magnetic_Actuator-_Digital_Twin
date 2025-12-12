f=[198 188 51 67 98 138 273 450];
c=[0.09 0.034 0.03 0.08 0.03 0.08 0.05 0.05];
k=[2.9E+6 2.6E+6 -2.0E+6 -400000 -9.0E+6 -800000 4.0E+6 -950000];

%% Extract parameters
wc = f(1);        % subscript c
wo = f(2);        % subscript o
wq = f(3:8);      % subscripts i=1:6

zc = c(1);
zo = c(2);
zqi = c(3:8);

kyFc = k(1);
kyFo = k(2);
kyIi = k(3:8);

%% Method 1
A1 = [-2*zc*wc, -wc^2;
       1,        0];
B1 = [wc^2/kyFc; 0];
C1 = [0 1];

%% Method 2

% Base subsystem A2_0
A2_0 = [-2*zo*wo, -wo^2;
         1,        0];
BF_0 = [wo^2/kyFo; 0];
BI_0 = [0; 0];
C2_0 = [0 1];

% Subsystems for i = 1,...,6
for i = 1:6
    A2_i{i} = [-2*zqi(i)*wq(i), -wq(i)^2;
                 1,               0];
    BF_i{i} = [0; 0];
    BI_i{i} = [wq(i)^2/kyIi(i); 0];
    C2_i{i} = [0 1];
end

%% Assemble Method 2 system matrices
% Block-diagonal A2
A2 = blkdiag(A2_0, A2_i{1}, A2_i{2}, A2_i{3}, A2_i{4}, A2_i{5}, A2_i{6});

% Construct BF, BI, C2
BF = [BF_0; BF_i{1}; BF_i{2}; BF_i{3}; BF_i{4}; BF_i{5}; BF_i{6}];
BI = [BI_0; BI_i{1}; BI_i{2}; BI_i{3}; BI_i{4}; BI_i{5}; BI_i{6}];
C2 = [C2_0 C2_i{1} C2_i{2} C2_i{3} C2_i{4} C2_i{5} C2_i{6}] ;

% Combine
B2 = [BF BI];

%% Display results
disp('A1 = '); disp(A1);
disp('B1 = '); disp(B1);
disp('C1 = '); disp(C1);

disp('A2 = '); disp(A2);
disp('B2 = '); disp(B2);
disp('C2 = '); disp(C2);

%% %% Define matrices K1 and K2

% Equation (18)
K1 = [9.59e5 3.43e5 5.77e10]';

% Equation (19)
K2 = [ 1.09e6     3.64e5    -5.29e-15   -4.91e-15 -5.57e-15  -9.63e-16  -8.43e-16   -2.71e-17 -2.40e-17   2.60e-15   4.71e-16    5.35e-16 -8.28e-16  -3.11e-15   6.32e10 ]';

%% Display results
disp('K1 = ');
disp(K1);
disp('K2 = ');
disp(K2);

%% Assuming A1, B1, C1, A2, BF, and C2 are already defined as in previous scripts

% --- Method 1 ---
Ae1 = [A1, B1;
       zeros(1, size(A1,2)), 0];

Ce1 = [C1, 0];

% --- Method 2 ---
Ae2 = [A2, BF;
       zeros(1, size(A2,2)), 0];

Ce2 = [C2, 0];

%% Display results
disp('Ae1 = ');
disp(Ae1);
disp('Ce1 = ');
disp(Ce1);

disp('Ae2 = ');
disp(Ae2);
disp('Ce2 = ');
disp(Ce2);
%% 
CF1 =[0 0 1];
CF2 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 1];




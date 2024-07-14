%% ____________________
%% INITIALIZATION

clear
clc

% Lift coefficient in first plot of Anderson
C_L = [-0.95 -0.7 -0.5 -0.3 -0.082 0.126 0.3421 0.5616 0.8101 1.0349 1.2159 1.385 1.5036];
% Angle of attack in plot (x axis)
alpha = [-10 -8 -6 -4 -2 0 2 4 6 8 10 12 14];

% Drag coefficient in second plot of Anderson for reference
%C_D = [0.0105 0.0085 0.0077 0.0075 0.0073 0.0068 0.006 0.0061 0.0067 0.0077 0.0105 0.0127 0.0158];

%% ____________________
%% CALCULATIONS

E = 0.95;
AR = 10;
C_D0 = 0.008675;

C_D = C_D0 + (C_L.^2)/(pi*E*AR);

%% ____________________
%% C_L/C_D vs AoA

% Display table
%disp(Table)

% Plot of C_L/C_D vs alpha
figure(1)
plot(alpha, C_L./C_D, 'r')

% Plot labels
title('C_L / C_D Ratio vs Angle of Attack')
xlabel('Angle of Attack (deg)')
ylabel('C_L/C_D (unitless)')
grid on

set(gca,'Color', [.8 .8 .8])
legend('NACA 23012')
hold off

%% ____________________
%% C_D vs C_L

figure(2)
plot(C_L(:,1:10), C_D(:,1:10), 'r')

title('Drag Polar')
xlabel('Lift Coefficient C_L')
ylabel('Drag Coefficient C_D')
grid on

xlim([-1.5 1.5])
set(gca,'Color', [.8 .8 .8])

legend('NACA 23012')

%% ____________________
%% C_L vs AoA

C_L = [-0.95 -0.7 -0.5 -0.3 -0.082 0.126 0.3421 0.5616 0.8101 1.0349 1.2159 1.385 1.5036 1.5494 1.4358];
alpha = [-10 -8 -6 -4 -2 0 2 4 6 8 10 12 14 16 18];

% Plot of C_L vs alpha
figure(3)
plot(alpha, C_L, 'r')

% Plot labels
title('C_L vs Angle of Attack')
xlabel('Angle of Attack (deg)')
ylabel('C_L (unitless)')
grid on

set(gca,'Color', [.8 .8 .8])
legend('NACA 23012')
hold off
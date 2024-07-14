% AAE 251 Fall 2022
% Homework 5
% Lift and Drag - Airfoil
% Authors: Paulo Ramirez, ramir378

% Description: MATLAB code to sketch the airfoil (upper and lower lines)
% with the chord line as the x-axis and the camber line in the same plot. 

% Output: Plots the airfoil of an aircraft according to the NACA number.
% The plot contains the contour of the airfoil and its camber line.

%% ____________________
%% INITIALIZATION

clear
clc

% NACA standard five digit number
NACA = 23012; % 23012

% Chord length (the unit is not relevant)
c = 1;

% Decomposition of the NACA number
lift = (c/10) * floor(NACA / (10^4)) * (3/2);
p = (c/100) * (1/2) * (floor(NACA / (10^2)) - floor(NACA / (10^4))*100);
t = mod(NACA, 100);

% Vectors for the domain of the functions
x = linspace(0, c, 100);
y_c = linspace(0, c, 100);

%% ____________________
%% CALCULATIONS

% Table of parameters
%       mean   p     m     k1
table = [210 0.05 0.0580 361.400;
         220 0.10 0.1260 51.640; 
         230 0.15 0.2025 15.957; 
         240 0.20 0.2900 6.643; 
         250 0.25 0.3910 3.230];

% Parameter determination from table
[a, b] = find(table == p);
m = table(a, b+1);
k_one = table(a, b+2);

% Discontinuous calculation of the camber line
for n = 1:length(y_c)
    if (x(n) <= p)
        y_c(n) = (k_one/6) * (x(n)^3 - 3*m*x(n)^2 + (3-m)*m^2*x(n));
    else
        y_c(n) = (k_one * m^3 / 6) * (1-x(n));
    end
end

% Calculation of the thickness at any length x
y_t = ((t/100)/0.2) * (0.2969*sqrt(x) - 0.1260*x - 0.3516*x.^2 + 0.2843*x.^3 - 0.1015*x.^4);

% Slope of the camber line
dyc_dx = diff(y_c);
theta = [atan(dyc_dx) 0];

% Upper edge of the airfoil
x_U = x - y_t .* sin(theta);
y_U = y_c + y_t .* cos(theta);

% Lower edge of the airfoil
x_L = x + y_t .* sin(theta);
y_L = y_c - y_t .* cos(theta);

%% ____________________
%% OUTPUTS

plot(x_U, y_U, 'k', 'LineWidth', 2) % Plot of upper edge
hold on
plot(x_L, y_L, 'k', 'LineWidth', 2) % Plot of lower edge
plot(x, y_c, 'r', 'LineWidth', 1) % Plot the camber line

% Plot the chord (straigth line)
plot(linspace(0, c, 5), zeros(1, 5), 'b-', 'LineStyle', '--', 'LineWidth', 0.1)

% Plot labels
title('NACA 23012 Airfoil')
xlabel('x (length)')
ylabel('y (length)')
grid on
xlim([-0.1 1.1])
axis equal

legend('Airfoil Surface', '', 'Camber Line', 'Chord')

%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% I have not used source code obtained from any other unauthorized
% source, either modified or unmodified.  Neither have I provided
% access to my code to another. The project I am submitting
% is my own original work.
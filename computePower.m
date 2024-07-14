clc
clear

%% ____________________
%% GLOBAL PARAMETERS

% Size of the altitude vector
SIZE = 10000;

g = 9.81; % m/s^2
altitude = linspace(0, 14000, SIZE); % m
h = 2434.4; % m (Selected altitude)

%% ____________________
%% GEOMETRIC PARAMETERS

b = 28.34; % m
S = 79.9; % m^2

%% ____________________
%% AIRCRAFT PARAMETERS
C_D0 = 0.008675;

% From K (dummy variables)
% Aspect ratio
AR = b^2 / S; 
E =  0.95;
K = 1/ (pi*E*AR);

% Weight data
W0 = 21268.94*g; % N

% Power data
P_max = 4 * 949 * 1000; % N m/s (watt)
prop_eff = 0.8;
m_ad = 0.6;

%% ____________________
%% POWER AND ALTITUDE

% Mass
m = W0 / g; % kg

% Air Density
P = zeros(0, SIZE);
T = P;
rho = P;

% Calculate standard air density
for n = 1:SIZE  
    [~, ~, rho(n)] = airDensity2(altitude(n));
end

% Power Required
[~ , P_req, V_inf] = thrust_power_required(m, S, E, AR, K, rho, C_D0, g);

% Power Available
[P_aval] = thrust_power_available(rho, P_max, m_ad);
P_aval = prop_eff*P_aval;

%% ____________________
%% OUTPUT POWER VS ALTITUDE

figure(1)
plot(P_req/1000, altitude/1000)
hold on;
plot(P_aval/1000, altitude/1000)

title('Power vs Altitude')
set(gca,'Color', [.8 .8 .8])
ylabel('Altitude (km)')
xlabel('Power (kW)')
grid on;

legend('Power Required', 'Power Available')
hold off;

%% ____________________
%% CEILING DENSITY

rho0 = 1.225;

part1 = 4 * (rho0^m_ad) / (3*prop_eff*P_max);
part2 = (2/S) * (m*g)^3 * sqrt(3 * K^3 * C_D0);

rho_cei = (part1 * sqrt(part2))^(2/(2*m_ad+1))





clc
clear

%% ____________________
%% INITIALIZATION

g = 9.81; % m/s^2
C_D0 = 0.008675;
h = 8000*0.3048; % m

v_inf = linspace(30, 300, 1000); % m/s

b = 93*0.3048; % ft
S = 860*(0.3048^2); % ft^2

% Weight data
m = 46890*0.453592; % kg

% Power data
P_max = 4 * 949 * 1000; % N m/s (watt)
prop_eff = 0.8;
E = 0.95; % Oswald
m_ad = 1;

%% ____________________
%% POWER AVILABLE

[~, ~, rho_0] = airDensity2(0);
[~, ~, rho] = airDensity2(h);

% Calculate Available Thrust or Power
P_aval = P_max * ((rho/rho_0).^m_ad);

P_aval = prop_eff*P_aval;

% Aspect ratio
AR = b^2 / S;

K = 1 / (pi*E*AR);

%% ____________________
%% POWER REQUIRED

% Calculate Lift and drag coefficients
[C_L, C_D] = lift_drag(v_inf, m, S, E, AR, rho, C_D0, g);

% Calculate lift to drag ratio
L_D = C_L./C_D;

% Calculate Thrust According to example 6.1
T_req = m*g ./ (L_D);

% Calculate power from thrust
P_req = v_inf .* T_req;

for k = 1:length(P_req)
    if (abs(P_req(k) - P_aval) < 5000)
        v_max = v_inf(k)
    end
end

%% ____________________
%% OUTPUT

plot(v_inf, P_req/1000)
hold on
plot(v_inf, P_aval*ones(1, length(P_req))/1000)
plot(v_max, P_aval/1000, 'r*')

set(gca,'Color', [.8 .8 .8])
title('Aircraft Required Power vs Velocity')
xlabel('Velocity, V_{inf} [m/s]')
ylabel('Power, P [kW]')
grid on
legend('Power Required', 'Power Available', 'Max Velocity = 187 m/s')




clc
clear

b = 28.34; % m
S = 79.9; % m^2
v = 107; % m/s
h = 2438.4; % m
C_D0 = 0.008675;
g = 9.81; % m/s^2

m_0 = 21268.946; % kg 
m_e = 12356.7; % kg 11428.26, 101120
m_pay = 5770; % kg 4462.5
m_crew = 115; % kg

m_final = m_e + m_pay + m_crew;
m_prop = m_0 - m_final;

AR = b^2 / S; 
E =  0.95;
K = 1/ (pi*E*AR);

c = 2.056 * 10^-6; % kg/W/s
prop_eff = 0.8;

[P, T, rho] = airDensity2(h);

C_L = sqrt(C_D0/K);
C_D = C_D0 + K*(C_L)^2;

R = (prop_eff/c) * (C_L/C_D) * log(m_0 / m_final) / 1000 % km

maxAeroEff = ((3*C_D0*pi*E*AR)^(3/4)) / (4*C_D0);

END = (prop_eff/c) * maxAeroEff * (2*rho*S)^(1/2) * ((m_final*g)^(-0.5) - (m_0*g)^(-0.5)) / 3600 % hours



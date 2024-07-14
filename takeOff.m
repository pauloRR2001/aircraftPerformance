clc
clear

b = 28.34; % m
S = 79.9; % m^2
C_D0 = 0.008675;
g = 9.81; % m/s^2
A_f = 20; % m^2 
C_L0 = 0.126;
E = 0.95;
%mu = 0.012;
mu = 0.02;

AR = (b^2)/S;
K = 1/(pi*E*AR);

C_L = C_L0;
C_D = C_D0 + K*(C_L)^2;

rho = 1.225; % kg/m^3
m = 21268.946; % kg
v_stall = 52.12; % m/s

v_tkof = 1.3*v_stall;

L = 0.5*rho*S*C_L*(v_tkof^2);

T = 17.687*1000; % N
R = mu*(m*g - L);

x = (m / (rho*A_f*C_D)) * log(abs( (T-R) / (T-R-0.5*rho*(v_tkof^2)*A_f*C_D) ))



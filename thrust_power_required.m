function [T_req, P_req, V_inf] = thrust_power_required(m, S, E, AR, K, rho, C_D0, g)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input Arguments
%
% v // velocity (scalar or vector)
% m // mass
% S // area
% E // Oswald's efficiency factor
% AR // aspect ratio
% rho // air density
% C_D0 // zero-lift drag coefficient
% g // gravity 

% Output Arguments
%
% the function outputs the required thrust and power for given conditions.
% It will output in the form [T, P] All values must be in the same system
% of units

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate Power
P_req = (4/3) * sqrt( (2./(rho*S)) * (m*g)^3 * sqrt(3 * K^3 * C_D0) );

% Calculate thrust 
T_req = 2*m*g*sqrt(K*C_D0);

% Calculate Velocity
V_inf = P_req./T_req;

end
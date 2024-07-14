function [C_L, C_D] = lift_drag(v, m, S, E, AR, rho, C_D0, g)

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
% the function outputs the lift and drag coefficients from the given
% parameters (the parameters must be in the same system of units). The
% outputs are unitless.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate Lift coefficients
C_L = 2*m*g ./ (rho.*(v.^2)*S);

% Calculate drag coefficients
C_D = C_D0 + (1/(pi*E*AR)) * C_L.^2;

% Lift to drag ratio
L_D = C_L./C_D;

end
function [X_aval] = thrust_power_available(rho, X_max, m_ad)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Input Arguments
%
% X_max // Either maximum power or thrust (it will work for both)
% rho // air density
% m_ad // air density exponent

% Output Arguments
%
% the function outputs the available power or thrust. The function can be
% used for either (one at a time). and the propeller efficiency factor is
% not integrated (must be multiplied outside of the function)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate Available Thrust or Power
X_aval = X_max .* ((rho./rho(1)).^m_ad);

end
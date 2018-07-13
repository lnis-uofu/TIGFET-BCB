%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Introduces fundamental constants
%   Title:      fundcon.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2010
%   (C) Dmitri E. Nikonov 2010
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fundamental constants
eelec = 1.602176565e-19;                % absolute value of charge of the electron, C
hbar = 1.054571726e-34;                 % Planck constant, J*s
melec = 9.10938291e-31;                 % mass of electron, kg
eps0 = 8.854187817e-12;                 % Coulomb constant, C^2/(m*J)
Kcou = 1/4/pi/eps0;                     % inverse Coulomb constant, m*J/C^2
clig = 2.99792458e8;                    % speed of light, m/s
kbol = 1.3806488e-23;                   % Boltzmann constant, J/K
kB = kbol;                              % Boltzmann constant, J/K
if(isempty(who('Tamb')))
    Tamb = 300;                         % room temperature, K
end
kbT = kbol*Tamb;                        % thermal energy, J
muB = eelec*hbar/2/melec;               % Bohr's magneton, A*m^2
mu0 = 1/clig/clig/eps0;                 % magnetic constant, kg*m/Cl^2
if(isempty(who('gelec')))
    gelec = 2.0023;                     % g-factor for electron
end
gamelec = - gelec*eelec/2/melec;        % gyromagnetic ratio for electron, Cl/kg
rclass = Kcou*eelec*eelec/melec/clig/clig;          % classical radius, m
abohr = hbar*hbar/melec/Kcou/eelec/eelec;           % Bohr's atom radius, m
function bey = GpnJDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = GpnJDevPerf(bey,cop)
% Obtain performance of simple circuits with graphene pn-junction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      GpnJDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vg = bey.volt/2;                            % gate voltage on each side (p and n) producing electrostatic doping
gam = (cop.eelec/2/pi/cop.hbar/cop.vF)^2/cop.eps0;      % constant for graphene, 1/J/m
ep = cop.epsSiO2;                                       % dielectric constant
mnogam = gam*cop.eelec*Vg*cop.EOTdiel;                  % factor
EFermi = (sqrt(ep^2+2*ep*mnogam) - ep)/gam/cop.EOTdiel; % Fermi energy
kF = EFermi/cop.vF/cop.hbar;                % Fermi momentum in graphene
Rcontot = cop.Rcont/bey.wTran;              % total contact resistance, Ohm
Mmodes = 2*kF*bey.wTran/pi;                 % number of modes in the contact
Rcollim = cop.Rquant/Mmodes;                % resistance of collimator, Ohm
Rdev = Rcontot + Rcollim;                   % total device resistance, Ohm
% only the gates in the middle and on the sides are switched
widgate = 4*cop.F;
lengate = 3*cop.F;
Cdev = cop.Cgaar*(cop.parasitC+bey.Cadj)*widgate*lengate;           % total electrode capacitance, F
bey.Ionle = bey.volt/Rdev/bey.wTran;        % on current per length, A/m
bey.Iofle = bey.Ionle/1e3;                  % off current, A
bey.Iofle = cop.Jg*cop.Lch + bey.Iofle;
bey.tint = Cdev*Rdev;                       % intrinsic device delay, s 
bey.Eint = Cdev*bey.volt^2;                 % device energy, J
bey.Idev = bey.volt./Rdev;                  % device current, A
end

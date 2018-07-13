function bey = NMLDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = NMLDevPerf(bey,cop)
% Obtain performance of nanomagnetic logic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      NMLDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
nNMdev = bey.length/2/cop.F;                % number of nanomagnets across a majority gate
tNM = 1e-10;                                % empirical nanomagnet switching time, s
% clocking by a fieldfrom a coil or by a multiferroic
bey.tint = nNMdev*tNM;                      % intrinsic device delay, s
% switchign time is limited by flipping nanomagnets, ignoring the setup time
% of the clocking
switch cop.spindriv
    case 'current'
wwire = 2*cop.pitch;                        % wire width, m
wpitch = 2*wwire;                           % wire pitch, m
AR = 3;                                     % wire aspect ratio = tickness/width
Ion = cop.Bneed*wpitch/mu0/cop.mmag;        % current to create magnetic field, A
bey.Idev = Ion;
Res = cop.rho*bey.aint*2/wpitch/wwire^2/AR;% resistance of the coil, Ohm
volt0 = bey.Idev*Res;
volt = max(volt0,bey.volt);
bey.Eint = Ion*volt*(bey.tint+bey.tic);     % device energy, J
bey.Sint = Sint;                            % leakage power, W
    case 'voltage'
% area clocked by magnetoelectric is the total number of nanomagnets 
% in a half a cross = nNMdev
% times area 2*F*F of each (with margins)
areame = nNMdev*2*cop.F^2;
bey.wMagn = sqrt(areame);                   % fake size to make the calculation general
magnetoElectric
bey.Idev = Ion;
bey.Eint = Ecomb;                           % maj gate  energy, J
bey.Sint = Sint;                            % leakage power, W
end
% interconnect has the same number of nanomagnets as a majority gate
bey.tic = bey.tint;                         % interconnect delay, s
bey.Eic = bey.Eint;                         % interconnect energy, J
bey.Sic = bey.Sint;                         % leakage power, W
% an interconnect requires clocking of nanomagnetis, just as a gate does
end

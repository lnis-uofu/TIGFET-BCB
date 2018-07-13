function bey = SWDDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = SWDSimCirc(bey,cop)
% Obtain performance of devices with spin waves
% Assumption - an RLC circuit drives the magnetoelectric cell, 
% intrinsic switching time ~10 periods, Q~10, 
% therefore dissipated energy ~= maximum energy stored in the capacitor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      SWDDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
cop.liccu = cop.licsp;                      % unit is the spin interconnect unit
freq = 3e10;                                % frequency of excitation, 1/s
lambda = 1e-7;                              % wavelength of spin waves, m
csw = freq*lambda;                          % speed of spin waves, m/s
switch cop.spindriv
    case 'current'
bey.tint = 10/freq;                         % intrinsic device delay, s
wwire = 4*cop.F;                            % wire width, m
area = wwire*wwire;                         % wire's cross-sectional area, m^2
dist = 4*cop.F;                             
Ion = cop.Bneed*2*pi*dist/mu0/cop.mmag;     % current to create magnetic field, A
bey.Idev = Ion;
Res = cop.rho*bey.length/area;              % resistance of the wire, Ohm
Imped = max(Res,50);                        % transmission line at least 50 Ohm
bey.Eint = Ion^2*Imped*bey.tint;            % device energy, J
bey.Sint = Sint;                            % leakage power, W
    case 'voltage'
magnetoElectric
bey.Idev = Ion;
bey.tint = tcomb;                           % intrinsic device delay, s
bey.Eint = Ecomb;                           % device energy, J
bey.Sint = Sint;                            % leakage power, W
end
bey.tic = bey.tint + cop.liccu/csw;         % interconnect delay, s, driving devices and spin wave propagation
bey.Eic = bey.Eint;                         % interconnect energy, J
bey.Sic = bey.Sint;                         % leakage power, W
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spin Hall switching parameters for perpendicular magnetization
%   Title:      CSLspinHall.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aspect = 1;
area = aspect*bey.wMagn*bey.wMagn;
vol = area*cop.thFM;
% spin Hall effect parameters for perpendicular magnetization
Delta = cop.Ku*vol/kbT;                     % stability factor
Ns = cop.Mspe*vol/muB;                      % number of spins
% critical SPIN current density for perpendicular anisotropy,  A/m^2
Jcs = 2*eelec*cop.alpha*cop.Ku*cop.thFM/hbar;
%Icsle = Jc*bey.wMagn;                      % critical current per length, A/m
Ics = Jcs*area;                             % critical current, A
factcur = 3;                                % switching current is 3x critical current
Is = factcur*Ics;                           % current per input, A
theta = sqrt(0.5./Delta);                   % thermal angle
timfact = 3*log(pi./2./theta);                % time factor
% spin torque switchign time, s
tstt = timfact*eelec*cop.Mspe*vol/cop.gLande/muB/(Is-Ics);
Ion = Is/cop.SHEC*cop.thSH/bey.wMagn;       % charge current, A
bey.Ionle = Ion/bey.wMagn;                  % on current, A/m
RSH = cop.rhoSH*3/cop.thSH;                 % resistance of the spin Hall wire, Ohm
Rcurr = RSH;                                % start calculating resistance in the current path
rescaleTorqueVolt
Ile1 = cop.Jg*cop.Lch+cop.Ileak;
Ile = Ile1*bey.volt/cop.vTran;
Sint = Ile*bey.wTran*bey.volt;
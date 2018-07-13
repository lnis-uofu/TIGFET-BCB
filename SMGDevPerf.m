function bey = SMGDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = SMGDevPerf(bey,cop)
% Obtain performance of devices spin torque majority gates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      SMGDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
cop.liccu = cop.licsp;                      % unit is the spin interconnect unit
cdw = 500;                                  % domain wall speed, m/s
switch cop.spindriv
    case 'current'
perpMag
bey.Idev = Ion;
bey.tint = tstt;                            % intrinsic device delay, s
% switching time is the magnetization switch mostly
bey.Eint = bey.Idev*bey.volt*bey.tint;      % device energy, J
bey.Sint = Sint;                            % leakage power, W
    case 'voltage'
magnetoElectric
bey.Idev = Ion;
bey.tint = tcomb;                           % intrinsic device delay, s
bey.Eint = Ecomb;                           % device energy, J
bey.Sint = Sint;                            % leakage power, W
end
% interconnects require magnetic switching
bey.tic = bey.tint + cop.liccu/cdw;         % interconnect delay, s
bey.Eic = bey.Eint;                         % interconnect energy, J
bey.Sic = bey.Sint;                         % leakage power, W
end

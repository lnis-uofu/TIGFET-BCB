function bey = ASLDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = ASLDevPerf(bey,cop)
% Obtain performance of devices with spin transfer torque domain
% walls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      ASLDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
switch cop.name
    case 'ASL'
perpMag
% net of the two spin polarized currents is driving the nanomagnet
Ionreal = 3*Ion;                            % real current through each terminal is more
bey.Idev = Ionreal;
bey.tint = tstt;                            % intrinsic device delay, s
bey.Eint = bey.Idev*bey.volt*tstt;          % device energy, J
bey.Sint = Sint;                            % leakage power, W
% spin current interconnects
tspdif = cop.licsp*cop.licsp/cop.Dcu;
bey.tic = bey.tint + tspdif;                         % interconnect delay, s
bey.Eic = bey.Eint;                         % no additional interconnect energy, J
    case 'CSL'
CSLspinHall
% schjeme using TMR to produce driving current for the next stage
Ionreal = 3*Ion;                            % real current through each terminal is more
% spin torque current is a difference of the two in resistance ratio
bey.Idev = Ionreal;
bey.tint = 2*tstt;                          % intrinsic device delay, s
% longer, because needs to rotate the dipole-coupled magnet
bey.Eint = bey.Idev*bey.volt*tstt;          % device energy, J
bey.Sint = Sint;                            % leakage power, W
% electrical interconnects
bey.tic = cop.factic*cop.Cic*bey.volt/bey.Idev;         % interconnect delay, s
bey.Eic = cop.facEcap*cop.Cic*bey.volt^2;               % interconnect energy, J
end
bey.Sic = bey.Sint;                         % leakage power, W
end

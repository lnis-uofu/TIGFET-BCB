function bey = STTDWPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = STTDWPerf(bey,cop)
% Obtain performance of devices with spin transfer torque domain
% walls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      STTDWPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
bey.Ionle = cop.Jdw*cop.thFM;               % current per length, A/m
bey.Idev = bey.Ionle*bey.wMagn;             % current per input, A
vstt = muB*cop.sppol*cop.Jdw/eelec/cop.Mspe*abs(gelec)/2;
                                            % speed corresponding to spin torque
cdw = 3*vstt;                               % speed of domain walls, m/s, plot from C. Ross
bey.tint = cop.F/cdw;                       % intrinsic device delay, s
bey.Eint = bey.Idev*bey.volt*bey.tint;      % device energy, J
Ile1 = cop.Jg*cop.Lch+cop.Ileak;
Ile = Ile1*bey.volt/cop.vTran;
Sint = Ile*bey.wTran*bey.volt;
bey.Sint = Sint;                            % leakage power, W
% electrical interconnects
bey.tic = cop.factic*cop.Cic*bey.volt/bey.Idev;         % interconnect delay, s
bey.Eic = cop.facEcap*cop.Cic*bey.volt^2;               % interconnect energy, J
end

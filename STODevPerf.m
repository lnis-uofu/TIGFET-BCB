function bey = STODevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = STODevPerf(bey,cop)
% Obtain performance of devices with spin transfer torque oscillators
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      STODevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
freq = 3e10;                                % oscillator frequency, 1/s
lambda = 1e-7;                              % wavelength of spin waves, m
csw = freq*lambda;                          % speed of spin waves, m/s
perpMag
bey.Idev = Ion;
bey.tint = 10/freq;                         % intrinsic device delay, s
% how long it takes for oscillators to synchonize
% spin wave interconnects
bey.Eint = bey.Idev*bey.volt*bey.tint;      % device energy, J
bey.Sint = Sint;                            % leakage power, W
bey.tic = bey.tint + 2*bey.length/csw;      % interconnect delay, s, driving devices and spin wave propagation
bey.Eic = bey.Eint;                         % interconnect energy, J
bey.Sic = bey.Sint;                         % leakage power, W
end

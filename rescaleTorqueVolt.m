%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rescale the voltage and a majority gate area due to a wide driving transistor
%   Title:      rescaleTorqueVolt.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rjunc = cop.RAspinvalve/area;
bey.wTran = cop.Rtranlin/cop.Rwiring;
bey.invlen = max(bey.invlen,ceil(bey.wTran/cop.pitch));
Rcurr = Rcurr + Rjunc + 2*cop.Rwiring;
voltprom = Ion*Rcurr;
bey.volt = max(bey.volt,voltprom);
bey = MajGateArea(bey,cop);
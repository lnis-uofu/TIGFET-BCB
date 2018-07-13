function bey = FerroelDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = FerroelDevPerf(bey,cop)
% Obtain intrinsic device characteristics for ferroelectric non-volatile transistors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      FerroelDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% adjustment to voltage due to drop of voltage in ferroelectric
S1 =  bey.volt*cop.Cgaar;
S2 = cop.Pfe;
delV = (S1+S2)/cop.Cfear;
bey.Cadj = bey.Cadj/(1+delV/bey.volt);
%bey.volt = bey.volt+delV;
capadj = cop.Ctole + cop.Cgale*(bey.Cadj-1);   % adjusted capacitance
% includes the oxide and the semiconductor capacitances
% for full device width
Cdev = capadj*bey.wTran;                    % capacitance of the device, F
bey.Idev = bey.Ionle*bey.wTran;             % current in the device, A
bey.tint = capadj*bey.volt/bey.Ionle;       % intrinsic delay, s
bey.tint = bey.tint + cop.tFEint;           % add ferroelectric material resoponse time
% irreversible energy loss in the hysteresis
Eirr = 4*cop.Pfe*cop.Ecfe*cop.thfe*cop.F*bey.wTran;
Ecap = Cdev*bey.volt^2;                     % capacitor charging part
bey.Eint = Ecap + Eirr;                     % intrinsic switching energy, J
end

function Cw = CapWire(wwi,hwi,sep,hdiel,eps)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function Cw = CapWire(wwi,hwi,sep,hdiel,eps)
% capacitance per unit length of a wire given geometry
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      CapWire.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
rat1 = sep/(sep+2*hdiel);
rat2 = hwi/hdiel;
rat3 = hwi/sep;
Cgr = wwi/hdiel + 1.086*( 1 + 0.685*exp(-hwi/sep/1.343) - ...
     0.9964*exp(-sep/hdiel/1.421) )* ...
     rat1^0.0476*rat2^0.337;
Cl2l = rat3*(1-1.897*exp(-hdiel/sep/0.31+hwi/sep/2.474) + ...
    1.302*exp(-hdiel/sep/0.082) - 0.1292*exp(-hwi/sep/1.326)) + ...
    1.722*(1-0.6548*exp(-wwi/hdiel/0.3477))*exp(-sep/0.651/hdiel);
Cw = 2*eps*eps0*(Cgr+Cl2l);
end

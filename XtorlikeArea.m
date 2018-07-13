function bey = XtorlikeArea(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = XtorlikeArea(bey,cop)
% Obtain area for transistor-like devices and gates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      XtorlikeArea.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bey.aic = cop.lic*2*cop.F;          
switch cop.name

%%% TIGFET extension start
	case {'TIGFET'} %   TIGFET case
bey.length = cop.pitch+5*cop.F; % length of transistor
bey.width =  bey.wTran;     % width of transistor
aTIG =       (2*bey.length+5*cop.F)*(2*bey.width+25*cop.F); % Area of a Tile
bey.ainv1 =  aTIG*1/2;      % Area of inverter, FO 1
ainv2 =      2*aTIG*1/2;    % Area of inverter, FO 2
bey.ainv4 =  4*aTIG*1/2;    % Area of inverter, FO 4
bey.anan  =  aTIG;          % Area of NAND, NI 2
bey.anan3 =  1.5*aTIG;      % Area of NAND, NI 3
bey.anan4 =  2*aTIG;        % Area of NAND, NI 4
%%% TIGFET extension end

    case {'STT/DW'}
bey.length = 2*cop.pitch+2*cop.F;
bey.width = bey.wTran+cop.F;
bey.aint = bey.length*bey.width;
bey.ainv1 = bey.aint*cop.gatearea;
ainv2 = 2*bey.ainv1;
bey.ainv4 = 4*bey.ainv1;
bey.anan =  2*bey.aint*cop.gatearea;
bey.anan3 =  3*bey.aint*cop.gatearea;
bey.anan4 =  4*bey.aint*cop.gatearea;
    otherwise
bey.length = cop.pitch;         % not applicable to BisFET?
bey.width = bey.wTran;
bey.aint = bey.length*bey.width;
bey.ainv1 = bey.invlen*cop.pitch*bey.invwid*cop.pitch;
ainv2 = (bey.invlen+1)*cop.pitch*bey.invwid*cop.pitch;
bey.ainv4 = (bey.invlen+3)*cop.pitch*bey.invwid*cop.pitch;
bey.anan = bey.nandlen*cop.pitch*bey.nandwid*cop.pitch;
bey.anan3 = (bey.nandlen+1)*cop.pitch*(bey.nandwid+1)*cop.pitch;
bey.anan4 = (bey.nandlen+2)*cop.pitch*(bey.nandwid+2)*cop.pitch;
end
switch cop.tunnel
    case 'n'
        bey.aram = 2*bey.ainv1;
    case 'y'
        bey.aram = 3*bey.ainv1;
end
switch cop.name

%%% TIGFET extension start
    case {'TIGFET'} % TIGFET case
bey.axor =  aTIG + 2*bey.ainv1;         % Area of XOR,  NI 2
bey.axor3 = aTIG + 3*bey.ainv1;         % Area of XOR,  NI 3
bey.amaj3 = aTIG + 2*bey.ainv1;         % Area of MAJ,  NI 3
bey.amux = 4*aTIG*cop.gatearea*.87;  % Area of pass-logic MUX, (cop.gatearea = M_g)
bey.adem = (4*bey.anan3+4*bey.ainv1+2*ainv2)*cop.gatearea*.87;   % Area of demux (same as CMOS HP)
bey.ase = 3*aTIG*cop.gatearea*.87;     % Area of state element, (TSPC flip flop)
%%% TIGFET extension end

 otherwise
bey.axor = 4*bey.anan*cop.gatearea;
bey.amux = (bey.anan4+4*bey.anan3+2*ainv2)*cop.gatearea;
bey.adem = (4*bey.anan3+4*bey.ainv1+2*ainv2)*cop.gatearea;
bey.ase = (4*bey.anan+3*bey.ainv1)*cop.gatearea;
 end
switch cop.name
%%% TIGFET extension start
    case {'TIGFET'} % TIGFET case
        bey.a1 = (3.5*aTIG)*cop.bitarea*.87; % Area of 1-bit adder. cop.bitarea = M_g (same value)
%%% TIGFET extension end
    case {'STT/DW'}
        bey.a1 = (9*bey.anan+9*bey.ainv1)*cop.bitarea;
    otherwise
        bey.a1 = (2*bey.axor+3*bey.anan+3*bey.ainv1)*cop.bitarea;
end
end

function bey = XtorlikeDevPerf(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = XtorlikeDevPerf(bey,cop)
% Obtain intrinsic device characteristics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      XtorlikeDevPerf.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch cop.name
    
%%% TIGFET extension start
    case {'TIGFET'} % TIGFET case
capadjA = cop.Ctole + cop.Cgale*(bey.CadjA-1);  % adjusted capacitance per width.
capadjB = cop.Ctole + cop.Cgale*(bey.CadjB-1);  % adjusted capacitance per width.
capadjC = cop.Ctole + cop.Cgale*(bey.CadjC-1);  % adjusted capacitance per width.
capadjD = cop.Ctole + cop.Cgale*(bey.CadjD-1);  % adjusted capacitance per width.
CdevA = capadjA*bey.wTran;              % capacitance of the device, F.
CdevB = capadjB*bey.wTran;              % capacitance of the device, F.
CdevC = capadjC*bey.wTran;              % capacitance of the device, F. 
CdevD = capadjD*bey.wTran;              % capacitance of the device, F.
bey.Idev = bey.Ionle*bey.wTran;         % current in the device, A
bey.tintA = capadjA*bey.volt/bey.Ionle; % intrinsic delay, s. 
bey.tintB = capadjB*bey.volt/bey.Ionle; % intrinsic delay, s. 
bey.tintC = capadjC*bey.volt/bey.Ionle; % intrinsic delay, s.
bey.tintD = capadjD*bey.volt/bey.Ionle; % intrinsic delay, s.
bey.EintA = CdevA*bey.volt^2;           % intrinsic switching energy, J.
bey.EintB = CdevB*bey.volt^2;           % intrinsic switching energy, J.
bey.EintC = CdevC*bey.volt^2;           % intrinsic switching energy, J. 
bey.EintD = CdevD*bey.volt^2;           % intrinsic switching energy, J.
bey.tint = capadjA*bey.volt/bey.Ionle;  % intrinsic delay, s.
bey.Eint = CdevA*bey.volt^2;            % intrinsic switching energy, J. 

%%% TIGFET extension end

	otherwise
capadj = cop.Ctole + cop.Cgale*(bey.Cadj-1);    % adjusted capacitance per width
Cdev = capadj*bey.wTran;                        % capacitance of the device, F
bey.Idev = bey.Ionle*bey.wTran;                 % current in the device, A
bey.tint = capadj*bey.volt/bey.Ionle;           % intrinsic delay, s
bey.Eint = Cdev*bey.volt^2;                     % intrinsic switching energy, J

end
end

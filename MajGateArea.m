function bey = MajGateArea(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = MajGateArea(bey,cop)
% Obtain area for majority gates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      MajGateArea.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bey.length = 3*cop.pitch;  % cross majority gate
bey.width = 3*cop.pitch;                % cross majority gate
bey.aint = bey.length*bey.width*cop.majsize;    % intrinsic device area, m^2
bey.aic = cop.licsp*2*cop.F;            % interconnect area, m^2
% no need to cop.gatearea factor, because majority gates stack without gaps
bey.ainv1 = bey.aint/2;                 % FO1 inverter is half a cross
ainv2 = bey.aint;
bey.ainv4 = 2*bey.aint;                 % FO4 inverter is 2 crosses
bey.anan = bey.aint;                    % NAND is a cross too 
bey.anan3 = 2*bey.aint;
bey.anan4 = 3*bey.aint;
bey.axor = (3*bey.aint+2*bey.ainv1)*cop.gatearea;
bey.amux = 3*(3*bey.aint+bey.ainv1)*cop.gatearea;
bey.adem = (8*bey.aint+2*ainv2)*cop.gatearea;
bey.ase = bey.ainv1;
bey.aram = bey.ainv1;
bey.a1 = (bey.mgates*bey.anan + (bey.mgates-1)*bey.ainv1)*cop.bitarea;    % bit adder is 3 or fewer majority gates
end

function bey = NVmemory(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = NVmemory(bey,cop)
% correct for the compact NV memory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      NVmemory.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon
cop.liccu = cop.licsp;
lengthfactors
bey.length = cop.pitch;
bey.width = bey.wTran;
bey.aram = bey.length*bey.width;    % dense memory array
perpMag
% net of the two spin polarized currents is driving the nanomagnet
Ionreal = 3*Ion;                            % real current through each terminal is more
bey.Idev = Ionreal;
bey.tram = tstt + bey.tic*cop.factic*fac_ram;
% not quite the correct estimate of switching magnetization in a spinFET
bey.Eram = bey.Idev*cop.vspinST*tstt + bey.Eic*cop.facEcap*fac_ram;
bey.Sram = Sint + bey.Sic*fac_ram;
end

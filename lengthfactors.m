%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sequence to obtain interconnect length factors from gate areas 
%   Title:      lengthfactor.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% length of interconnects, different from bey.lic
linv1 = sqrt(bey.ainv1); 
linv4 = sqrt(bey.ainv4);
lnan = sqrt(bey.anan);
lxor = sqrt(bey.axor);
lnan3 = sqrt(bey.anan3);
lnan4 = sqrt(bey.anan4);
lram = sqrt(bey.aram);
lmux = sqrt(bey.amux);
ldem = sqrt(bey.adem);
lse = sqrt(bey.ase);
l1 = sqrt(bey.a1);
% factors to correct for lengths
fac_inv1 = max(1,linv1/cop.liccu);
fac_inv4 = max(1,linv4/cop.liccu);
fac_nan = max(1,lnan/cop.liccu);
fac_xor = max(1,lxor/cop.liccu);
fac_nan3 = max(1,lnan3/cop.liccu);
fac_nan4 = max(1,lnan4/cop.liccu);
fac_ram = max(1,lram/cop.liccu);
fac_mux = max(1,lmux/cop.liccu);
fac_dem = max(1,ldem/cop.liccu);
fac_se = max(1,lse/cop.liccu);
fac_1 = max(1,l1/cop.liccu);
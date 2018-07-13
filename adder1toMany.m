function bey = adder1toMany(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = adder1toMany(bey,cop)
% Obtain the area, delay, and switching energy for a multi-bit adder
% from the values for a 1-bit adder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      adder1toMany.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nadd = cop.adderorder;   % = 32
cop.liccu = cop.lic;     % unit is the electrical interconnect unit
lengthfactors            % factors of interconnect length

%%% TIGFET extension start
switch cop.name    
case {'TIGFET'} % determine the area (aadd), delay (tadd), energy (Eadd), and standby power (Sadd) for the 32-bit adder.
    bey.aadd = cop.adderarea*.87*nadd*(cop.adderarea*.87*(3*bey.anan + 2*bey.ainv1)) + (1+round(nadd/5))*bey.ainv1*cop.adderarea*.87;
   % bey.a1 = (3.5*aTIG)*cop.bitarea*.87;
    bey.tadd = bey.t1 + (nadd-1)*(bey.tic*cop.factic*fac_1 + bey.tintA*cop.factnan) + round(nadd/5)*bey.tinv1;
    bey.Eadd = nadd*(bey.E1 + ((bey.Exor-2*bey.Einv1)/4) - (bey.Einv1/2) + bey.Eic*cop.facEcap*fac_1) + ((1+round(nadd/5))/2)*bey.Einv1;
    bey.Sadd = nadd*(bey.S1 + bey.Snan - bey.Sinv1) + (1+round(nadd/5))*bey.Sinv1;
%%% TIGFET extension end

otherwise
    bey.aadd = nadd*cop.adderarea*bey.a1;
    bey.tadd = nadd*bey.t1;
    bey.Eadd = nadd*bey.E1;
        switch cop.name
        case {'BisFET','ITFET'}
            bey.Eadd = bey.Eadd*bey.tadd/bey.t1;
        end
    bey.Sadd = nadd*bey.S1;
end


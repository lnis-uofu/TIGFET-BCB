function bey = MajGateSimCirc(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = MajGateSimCirc(bey,cop)
% Obtain performance of simple circuits for majority gates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      MajGateSimCirc.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cop.liccu = cop.licsp;                  % unit is the spin interconnect unit
lengthfactors                               % factors of interconnect length
% simple circuits
bey.tinv1 = bey.tint + bey.tic*fac_inv1;    % inverter requires 1 device
bey.Einv1 = bey.Eint + bey.Eic*fac_inv1;
bey.Sinv1 = bey.Sint + bey.Sic*fac_inv1;
bey.tinv4 = 2*bey.tint + bey.tic*fac_inv4;% FO4 requires 2 majority gates
bey.tnan = bey.tint + bey.tic*fac_nan;
bey.tnan3 = 2*bey.tint + bey.tic*fac_nan3;
bey.tnan4 = 3*bey.tint + bey.tic*fac_nan4;
switch cop.name
    case 'NML'
bey.Einv4 = 2*bey.Eint + 2*bey.Eic*fac_inv4; 
bey.Sinv4 = 2*bey.Sint + 2*bey.Sic*fac_inv4;
bey.Enan = bey.Eint + bey.Eic*fac_nan;        % not multiplied by number of inputs, clocking per gate
bey.Snan = bey.Sint + bey.Sic*fac_nan;
bey.Enan3 = 2*bey.Eint + bey.Eic*fac_nan3;
bey.Snan3 = 2*bey.Sint + bey.Sic*fac_nan3;
bey.Enan4 = 3*bey.Eint + bey.Eic*fac_nan4;
bey.Snan4 = 3*bey.Sint + bey.Sic*fac_nan4;
    otherwise
bey.Einv4 = 5*bey.Eint + 4*bey.Eic*fac_inv4;
bey.Sinv4 = 5*bey.Sint + 4*bey.Sic*fac_inv4;
bey.Enan = 4*bey.Eint + bey.Eic*fac_nan;
bey.Snan = 4*bey.Sint + bey.Sic*fac_nan;              %
bey.Enan3 = 7*bey.Eint + bey.Eic*fac_nan3;
bey.Snan3 = 7*bey.Sint + bey.Sic*fac_nan3;
bey.Enan4 = 10*bey.Eint + bey.Eic*fac_nan4;
bey.Snan4 = 10*bey.Sint + bey.Sic*fac_nan4; 
end
tinv2 = bey.tnan;
Einv2 = bey.Enan;
Sinv2 = bey.Snan;
bey.tse = bey.tinv1;
bey.Ese = bey.Einv1;
bey.Sse = bey.Sinv1;
bey.tram = bey.tinv1;
bey.Eram = bey.Einv1;
bey.Sram = bey.Sinv1;
bey.txor = 2*bey.tnan+bey.tinv1 + bey.tic*fac_xor;
bey.Exor = 3*bey.Enan+2*bey.Einv1 + bey.Eic*fac_xor;
bey.Sxor = 3*bey.Snan+2*bey.Sinv1 + bey.Sic*fac_xor;
bey.tmux = 2*(2*bey.tnan+tinv2) + bey.tic*fac_mux;
bey.Emux = 3*(3*bey.Enan+Einv2) + bey.Eic*fac_mux;
bey.Smux = 3*(3*bey.Snan+Sinv2) + bey.Sic*fac_mux;
bey.tdem = 2*bey.tnan+bey.tinv1  + bey.tic*fac_dem;
bey.Edem = (8*bey.Enan+2*Einv2) + 4*bey.Eic*fac_dem;
bey.Sdem = (8*bey.Snan+2*Sinv2) + 4*bey.Sic*fac_dem;
bey.t1 = bey.majcrit*bey.tnan + (bey.majcrit-1)*bey.tinv1 + bey.tic*fac_1;    % 2 majority gates in critical path
bey.E1 = bey.mgates*bey.Enan + (bey.mgates-1)*bey.Einv1 + 2*bey.Eic*fac_1;     % 3 majority gates overall, 2 outputs(Sum and carry out)
bey.S1 = bey.mgates*bey.Snan + (bey.mgates-1)*bey.Sinv1 + 2*bey.Sic*fac_1;     % 3 majority gates overall, 2 outputs(Sum and carry out)
end


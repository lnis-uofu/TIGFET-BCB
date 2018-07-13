function bey = XtorlikeSimCirc(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = XtorlikeSimCirc(bey,cop)
% Obtain performance of simple circuits with MOSFET-like device
% time and energy with the downstream (or upstream ?!) interconnect till the next gate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      XtorlikeSimCirc.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012 
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cop.liccu = cop.lic;                        % unit is the electrical interconnect unit
lengthfactors                               % factors of interconnect length
bey.tic = cop.factic*cop.Cic*bey.volt/bey.Idev;         % interconnect delay, s
bey.Eic = cop.facEcap*cop.Cic*bey.volt^2;               % interconnect energy, J

switch cop.name
    case 'BisFET'                           % more complex interconnects
        bey.tic = 2.*bey.tic;
        bey.Eic = 2.*bey.Eic;
end

switch cop.name    
  
%%% TIGFET extension start
        case {'TIGFET'}
Ioff = bey.Iofle*bey.wTran;     % OFF-current
bey.Sint = bey.volt*Ioff;       % intrinsic standby power

% Delay, energy, and switching power of inverters (tinv, Einv, Sinv):
FO = 1;                         % fan out
bey.tinv1 = (FO+1)*cop.factinv*bey.tintB + bey.tic*cop.factic*fac_inv1;  % (CMOS HP equation)
bey.Einv1 = FO*(cop.facEinv*bey.EintB + bey.Eic*cop.facEcap*fac_inv1);   % (CMOS HP equation)
bey.Sinv1 = FO*(bey.Sint);
FO = 4;                         % fan out
bey.tinv4 = (FO+1)*cop.factinv*bey.tintB + bey.tic*cop.factic*fac_inv4;  % (CMOS HP equation)
bey.Einv4 = FO*(cop.facEinv*bey.EintB + bey.Eic*cop.facEcap*fac_inv4);   % (CMOS HP equation)
bey.Sinv4 = FO*(bey.Sint);
% Delay, energy, and switching power of NAND (tnan, Enan, Snan):
NI = 2;                         % two inputs
bey.tnan =  NI*cop.factnan*bey.tintC + bey.tic*cop.factic*fac_nan;       % (CMOS HP equation)
bey.Enan =  NI*cop.facEnan*bey.EintC + bey.Eic*cop.facEcap*fac_nan;      % (CMOS HP equation)
NI = 3;                         % three inputs
bey.tnan3 = NI*cop.factnan*bey.tintC + bey.tic*cop.factic*fac_nan3;      % (CMOS HP equation)
bey.Enan3 = NI*cop.facEnan*bey.EintC + bey.Eic*cop.facEcap*fac_nan3;     % (CMOS HP equation)
NI = 4;                         % four inputs
bey.tnan4 = NI*cop.factnan*bey.tintC + bey.tic*cop.factic*fac_nan4;      % (CMOS HP equation)
bey.Enan4 = NI*cop.facEnan*bey.EintC + bey.Eic*cop.facEcap*fac_nan4;     % (CMOS HP equation)
bey.Snan =  1.625*bey.Sint;                                             % (CMOS HP equation)
bey.Snan3 = 0.897*bey.Sint;                          % (CMOS HP equation)
bey.Snan4 = 0.6*bey.Sint;                            % (CMOS HP equation)

%%% The following expressions use the 2-input NAND adjusted parameters for the 
%%% tile component while the interconnect factors depend on the gate under
%%% consideration.

% Delay, energy, and switching power of two-input XOR (txor, Exor, Sxor): 
bey.txor =  2*cop.factnan*bey.tintD + 1*bey.tinv1 + bey.tic*cop.factic*fac_xor;       
bey.Exor =  2*cop.facEnan*bey.EintD + 2*bey.Einv1 + bey.Eic*cop.facEcap*fac_xor;      
bey.Sxor =  bey.Snan + 2*bey.Sinv1;                                                     

% Delay, energy, and switching power of multiplexer (tmux, Emux, Smux):
bey.tmux = 2*cop.factnan*bey.tintC + 2*bey.tinv1 + bey.tic*cop.factic*fac_mux;            
bey.Emux = 4*cop.facEnan*bey.EintC + 3*bey.Einv1 + bey.Eic*cop.facEcap*fac_mux;          
bey.Smux = 2*bey.Snan + 4*bey.Sinv1;                                      

% Delay, energy, and switching power of TSPC flip-flop (tse, Ese, Sse):                            
bey.tse = 4*bey.tinv1 + 2*cop.factnan*bey.tintD + bey.tic*cop.factic*fac_se;          
bey.Ese = 4*bey.Einv1 + 2*cop.factnan*bey.EintD + 2*bey.Eic*cop.facEcap*fac_se;       
bey.Sse = 4*bey.Sinv1 + bey.Snan;                                   
    
% Delay, energy, and switching power of de-multiplexer (tdem, Edem, Sdem):     
bey.tdem = bey.tnan3 + bey.tinv1 + bey.tic*cop.factic*fac_dem;                          
bey.Edem = 4*bey.Enan3 + 2*bey.Einv1 + 4*bey.Eic*cop.facEcap*fac_dem;                   
bey.Sdem = 4*bey.Snan3 + 2*bey.Sinv1;                               

% Delay, energy, and switching power of SRAM (tram, Eram, Sram):               
bey.tram = 2*bey.tinv1 + bey.tic*cop.factic*fac_ram;                                   
bey.Eram = 3*bey.Einv1 + bey.Eic*cop.facEcap*fac_ram;                                   
bey.Sram = 2*bey.Sinv1;                                               

% Delay, energy, and switching power of 1-bit adder (t1, E1, S1):
bey.t1 = bey.txor + bey.tic*cop.factic*fac_1;                                          
bey.E1 = (3/2)*bey.Einv1 + (7/16)*(bey.Exor-2*bey.Einv1) + 2*bey.Eic*cop.facEcap*fac_1;  
bey.S1 = 2*bey.Snan + 3*bey.Sinv1;                                    

%%% TIGFET extension end

    otherwise
% simple circuits
Ioff = bey.Iofle*bey.wTran;
bey.Sint = bey.volt*Ioff;
FO = 1;
bey.tinv1 = (FO+1)*cop.factinv*bey.tint + bey.tic*cop.factic*fac_inv1;
bey.Einv1 = FO*(cop.facEinv*bey.Eint + bey.Eic*cop.facEcap*fac_inv1);
bey.Sinv1 = FO*(bey.Sint + bey.Sic*fac_inv1);
FO = 2;
tinv2 = (FO+1)*cop.factinv*bey.tint + bey.tic*cop.factic*fac_inv1;                   
Einv2 = FO*(cop.facEinv*bey.Eint + bey.Eic*cop.facEcap*fac_inv1);
Sinv2 = FO*(bey.Sint + bey.Sic*fac_inv1);
FO = 4;
bey.tinv4 = (FO+1)*cop.factinv*bey.tint + bey.tic*cop.factic*fac_inv4;
bey.Einv4 = FO*(cop.facEinv*bey.Eint + bey.Eic*cop.facEcap*fac_inv4);
bey.Sinv4 = FO*(bey.Sint + FO*bey.Sic*fac_inv1);
% estimates for NOR the same as NAND
NI = 2;
bey.tnan = NI*cop.factnan*bey.tint + bey.tic*cop.factic*fac_nan;
bey.Enan = NI*cop.facEnan*bey.Eint + bey.Eic*cop.facEcap*fac_nan;
NI = 3;
bey.tnan3 = NI*cop.factnan*bey.tint + bey.tic*cop.factic*fac_nan3;
bey.Enan3 = NI*cop.facEnan*bey.Eint + bey.Eic*cop.facEcap*fac_nan3;
NI = 4;
bey.tnan4 = NI*cop.factnan*bey.tint + bey.tic*cop.factic*fac_nan4;
bey.Enan4 = NI*cop.facEnan*bey.Eint + bey.Eic*cop.facEcap*fac_nan4;

switch cop.name
    case {'HomJTFET','HetJTFET','gnrTFET','ThinTFET','GaNTFET','TMDTFET'}  
bey.Snan = 1.535*bey.Sint + bey.Sic*fac_nan;            % analyzed input combinations
bey.Snan3 = 0.837*bey.Sint + bey.Sic*fac_nan3;
bey.Snan4 = 5/8*bey.Sint + bey.Sic*fac_nan4;
    otherwise
bey.Snan = 1.625*bey.Sint + bey.Sic*fac_nan;            % analyzed input combinations
bey.Snan3 = 0.897*bey.Sint + bey.Sic*fac_nan3;
bey.Snan4 = 0.6*bey.Sint + bey.Sic*fac_nan4;
end
bey.txor = 3*bey.tnan + bey.tic*cop.factic*fac_xor;
bey.Exor = 4*bey.Enan + bey.Eic*cop.facEcap*fac_xor;
bey.Sxor = 4*bey.Snan + bey.Sic*fac_xor;
bey.tmux = bey.tnan4 + bey.tnan3 + tinv2 + bey.tic*cop.factic*fac_mux;
bey.Emux = bey.Enan4 + 4*bey.Enan3 + 2*Einv2 + bey.Eic*cop.facEcap*fac_mux;
bey.Smux = bey.Snan4 + 4*bey.Snan3 + 2*Sinv2 + bey.Sic*fac_mux;
bey.tdem = bey.tnan3 + tinv2 + bey.tic*cop.factic*fac_dem;
bey.Edem = 4*bey.Enan3 + 2*Einv2 + 4*bey.Eic*cop.facEcap*fac_dem;
bey.Sdem = 4*bey.Snan3 + 2*Sinv2 + 4*bey.Sic*fac_dem;
bey.tse = 2*bey.tinv1 + 3*bey.tnan + bey.tic*cop.factic*fac_se;     % flip-flop
bey.Ese = 3*bey.Einv1 + 4*bey.Enan + 2*bey.Eic*cop.facEcap*fac_se;
bey.Sse = 3*bey.Sinv1 + 4*bey.Snan + 2*bey.Sic*fac_se;
switch cop.tunnel
    case 'n'
        bey.tram = 2*bey.tinv1 + bey.tic*cop.factic*fac_ram;
        bey.Eram = 3*bey.Einv1 + bey.Eic*cop.facEcap*fac_ram;
        bey.Sram = 2*bey.Sinv1 + bey.Sic*fac_ram;
    case 'y'
        bey.tram = 2*bey.tinv1 + bey.tic*cop.factic*fac_ram;
        bey.Eram = 4*bey.Einv1 + bey.Eic*cop.facEcap*fac_ram;
        bey.Sram = 3*bey.Sinv1 + bey.Sic*fac_ram;
end
switch cop.name
    case 'STT/DW'
bey.t1 = 9*bey.tnan;
bey.E1 = 9*bey.Enan + 9*bey.Einv1 + 2*bey.Eic*cop.facEcap*fac_1;
bey.S1 = 9*bey.Snan + 9*bey.Sinv1 + + 2*bey.Sic*fac_1;
    case 'CMOS HP'
bey.t1 = 1.5*bey.txor+2.5*bey.tnan + bey.tic*cop.factic*fac_1;
bey.E1 = 7/8*bey.Exor+351/512*bey.Enan + 2*bey.Eic*cop.facEcap*fac_1;
bey.S1 = (2*bey.Sxor+3*bey.Snan) + 2*bey.Sic*fac_1;

    otherwise     
bey.t1 = 1.5*bey.txor+2.5*bey.tnan + bey.tic*cop.factic*fac_1;
bey.E1 = 7/8*bey.Exor+351/512*bey.Enan + 2*bey.Eic*cop.facEcap*fac_1;
bey.S1 = (2*bey.Sxor+3*bey.Snan) + 2*bey.Sic*fac_1;
end
end

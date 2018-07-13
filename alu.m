function bey = alu(bey,cop)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function bey = alu(bey,cop)
% Obtain the area, delay, and switching energy of 
% an arithmetic logic unit
% cycle operation is 2 clock cycles
% one cycle is first clock rising, second clock rising,
% first clock falling, second clock falling
% the clock time and switching energy are limited by adder = the slowest operation
% t_ao=t_demux+t_xor+t_32+t_mux+t_nan+t_inv
% E_ao=32*(2*E_demux+E_xor+E_mux+E_nan+Einv)+E_32
% t_alu=2*t_clock
% T_clock/2>t_ao
% E_alu=32*(E_se+E_sram+E_se)+E_ao
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      alu.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Same set of expressions are used for TIGFET technology.

nadd = cop.adderorder;
bey.aao = bey.aadd + cop.bitarea*nadd*(bey.axor+2*bey.anan+bey.amux);
lao = sqrt(bey.aao);
fac_ao = max(1,lao/cop.lic);
bey.tao = bey.tse + bey.txor + bey.tadd + bey.tmux + bey.tic*cop.factic*fac_ao;
bey.Eao = bey.Eadd + nadd*(2*bey.Ese+bey.Exor+bey.Emux+bey.Eic*cop.facEcap*fac_ao);
bey.Sao = bey.Sadd + nadd*(2*bey.Sse+bey.Sxor+bey.Smux+bey.Sic*fac_ao);
bey.aalu = cop.adderarea*(bey.aao+cop.bitarea*nadd*(3*bey.ase+3*bey.aram));
lalu = sqrt(bey.aalu);
fac_alu = max(1,lalu/cop.lic);
bey.talu = 2*(bey.tao + bey.tse + bey.tic*cop.factic*fac_alu);
bey.Ealu = bey.Eao + nadd*(bey.Ese+bey.Eram+bey.Eic*cop.facEcap*fac_alu);
switch cop.name
    case {'BisFET','ITFET'}
        bey.Eao = bey.Eao*bey.tao/bey.t1;
        bey.Ealu = bey.Ealu*bey.talu/bey.t1;
end  
bey.Salu = bey.Sao + nadd*(bey.Sse+bey.Sram+bey.Sic*fac_alu);
end


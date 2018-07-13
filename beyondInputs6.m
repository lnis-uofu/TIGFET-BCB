%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inputs for individual Beyond-CMOS devices
%   Title:      beyondInputs6.m
%   Author:     Dmitri E Nikonov
%   Date:       01/01/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Cgaun = cop.Cgale*1e9;              % gate capacitance in fF/um units
cop.tunnel = 'n';                   % non -tunneling FETs

%%% TIGFET extension start
% 'TIGFET  ';
k=find(strcmp(deblank('TIGFET  '),caey));
if(~isempty(k))
bey(k).volt = 0.9;                      % nominal voltage of 0.9 V
cop.vTran = bey(k).volt;                % (CMOS HP model)
bey(k).wTran = cop.elecwidth*cop.F;     % device width, m
bey(k).Ionle = (12.6e-6)/(pi*(8e-9));   % current density of device, A/m: J_on = I_ON / 2 pi r
cop.Ionle = bey(k).Ionle;               % on-current
bey(k).Iofle = (0.135e-12)/(pi*(8e-9)); % off-current, A/m: I_off = J_OFF / 2 pi r
bey(k).Iofle = cop.Jg*3*cop.Lch + bey(k).Iofle;     % Add gate leakage to off-current density. Assume 3 from triple gate geometry
Ron = bey(k).volt/bey(k).Ionle;         % (CMOS HP model)
Rchan = Ron/3;                          % (CMOS HP model)
cop.Rtranlin = Rchan;                   % (CMOS HP model)
bey(k).CadjA = 0.019;                   % Capacitance adjustment factor (a)
bey(k).CadjB = 1.166;                   % Capacitance adjustment factor (b)
bey(k).CadjC = 2.477;                   % Capacitance adjustment factor (c) 
bey(k).CadjD = 3.523;                   % Capacitance adjustment factor (d)
end
%%% TIGFET extension end

% 'CMOS HP '; ...
% from ITRS 2013 edition; 2016 column
k=find(strcmp(deblank('CMOS HP '),caey));
if(~isempty(k))
bey(k).volt = 0.73;
cop.vTran = bey(k).volt;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 1703;                % on current, A/m: Adjusted from TIGFET model comparison
cop.Ionle = bey(k).Ionle;           % save the on-current
bey(k).Iofle = cop.Ileak;           % off-current, A/m
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
% ITRS already has Rsd included !!
Rchan = Ron/3;                      % resistance of the channel, small Vds
cop.Rtranlin = Rchan;
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'CMOS LV '; ... Raseong low voltage
k=find(strcmp(deblank('CMOS LV '),caey));
if(~isempty(k))
bey(k).volt = 0.3;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m  
bey(k).Ionle = 53;                  % on current, A/m
bey(k).Iofle = 1.5e-3;              % off current, A/m
bey(k).Cadj = 0.14;                 % much smaller channel capacitance
% Raseong has Rsd included !!
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'vdWFET  '; ...
% FAME '14
k=find(strcmp(deblank('vdWFET  '),caey));
if(~isempty(k))
bey(k).volt = 0.5;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m  
bey(k).Ionle = 2300;                   % on current, A/m
bey(k).Iofle = 0.1;                % off current, A/m
bey(k).Cadj = 1;                  % Dmitri's estimate
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

cop.tunnel = 'y';                   % tunneling FETs

% 'HomJTFET'; ... @Lch=20nm,EOT=0.5nm
% Seabaugh NRI'11 workshop
k=find(strcmp(deblank('HomJTFET'),caey));
if(~isempty(k))
bey(k).volt = 0.2;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 25;                  % on current, A/m
bey(k).Iofle = 6.2e-2;              % off current, A/m
bey(k).Cadj = 0.5;                  % capacitance lower in tunneling transistors
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'HetJTFET  '; ... @Lch=20nm,EOT=0.5nm
% Seabaugh NRI'12 workshop
k=find(strcmp(deblank('HetJTFET  '),caey));
if(~isempty(k))
bey(k).volt = 0.4;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 500;                 % on current, A/m
bey(k).Iofle = 4e-3;                % off current, A/m
bey(k).Cadj = 0.5;                  % capacitance lower in tunneling transistors
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'gnrTFET '; ... @Lch=15nm, EOT=0.6nm
% Seabaugh NRI'12 workshop
k=find(strcmp(deblank('gnrTFET '),caey));
if(~isempty(k))
bey(k).volt = 0.25;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 130;                 % on current, A/m (!) Ribbons = 1/2 of total width
bey(k).Iofle = 2.5e-3;              % off current, A/m
bey(k).Cadj = 0.5;                  % capacitance lower in tunneling transistors
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'ITFET   ';
% SWAN '14
k=find(strcmp(deblank('ITFET   '),caey));
if(~isempty(k))
bey(k).volt = 0.075;
bey(k).wTran = 4*cop.F;             % device width, m 
bey(k).Ionle = bey(k).volt/cop.Rtunn/5;  % on current, A/m, factor 5 = Vdd/Vcritical
bey(k).Iofle = 1e-1*bey(k).Ionle;   % off current, A/m
bey(k).Cadj = 1;                   % very high interlayer capacitance
bey(k).invlen = 4;                  % length of inverter in metal-1 pitches
bey(k).nandlen = 6;                 % length of NAND in metal-1 pitches
bey(k).invwid = 4;                  % length of inverter in metal-1 pitches
bey(k).nandwid = 5;                 % length of NAND in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'ThinTFET'; ...
% LEAST '14
k=find(strcmp(deblank('ThinTFET'),caey));
if(~isempty(k))
bey(k).volt = 0.2;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 43;                  % on current, A/m
bey(k).Iofle = 1e-3;                % off current, A/m
bey(k).Cadj = 0.19/Cgaun;           % capacitance lower in tunneling transistors
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'GaNTFET '; ...
% LEAST '14
k=find(strcmp(deblank('GaNTFET '),caey));
if(~isempty(k))
bey(k).volt = 0.2;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 47;                  % on current, A/m
bey(k).Iofle = 1e-3;                % off current, A/m
bey(k).Cadj = 0.34/Cgaun;           % capacitance lower in tunneling transistors
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'TMDTFET '; ...
% LEAST '14, WSe2
k=find(strcmp(deblank('TMDTFET '),caey));
if(~isempty(k))
bey(k).volt = 0.25;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 40;                  % on current, A/m
bey(k).Iofle = 1e-3;                % off current, A/m
bey(k).Cadj = 0.68/Cgaun;           % capacitance
bey(k).nandlen = 4;                 % length of inverter in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

cop.tunnel = 'n';                   % non -tunneling FETs

% 'GpnJ    '; ... 
% CMOS-like, three junction devices, two-ribbon, rounded corners
k=find(strcmp(deblank('GpnJ    '),caey));
if(~isempty(k))
bey(k).volt = 0.4;
bey(k).wTran = 4*cop.F;             % device width, m
bey(k).invlen = 2;                  % length of inverter in metal-1 pitches
bey(k).nandlen = 4;                 % length of NAND in metal-1 pitches
bey(k).invwid = 5;                  % length of inverter in metal-1 pitches
bey(k).nandwid = 7;                 % length of NAND in metal-1 pitches
end

% 'FEFET   '; ...
% estimate derived from CMOS HP
k=find(strcmp(deblank('FEFET   '),caey));
if(~isempty(k))
bey(k).volt = bey(3).volt;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = bey(3).Ionle;        % on current, A/m
bey(k).Iofle = bey(3).Iofle;        % off current, A/m
bey(k).Cadj = 1;                    % initial capacitance adjustment
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'NCFET   '; ...
% LEAST '14
k=find(strcmp(deblank('NCFET   '),caey));
if(~isempty(k))
bey(k).volt = 0.3;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 641;                  % on current, A/m
bey(k).Iofle = 1e-3;                % off current, A/m
bey(k).Cadj = 1.75/Cgaun;           % same charge as CMOS at smaller voltage, i.e. higher capacitance
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle; % leakage plus off current
end

% 'PiezoFET'; ...
% LEAST '14
k=find(strcmp(deblank('PiezoFET'),caey));
if(~isempty(k))
bey(k).volt = 0.3;                  
bey(k).wTran = cop.elecwidth*cop.F; % device width, m 
bey(k).Ionle = 421;                % on current, A/m
bey(k).Iofle = 1.7e-2;                   % off current, A/m
%otn = cop.Cpiezo/cop.Cgaar*cop.F/cop.Lch;
bey(k).Cadj = 0.25;                  % capacitance of piezoelectric
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'BisFET  '; ...    
% SWAN '14
k=find(strcmp(deblank('BisFET  '),caey));
if(~isempty(k))
bey(k).volt = 0.025;
bey(k).wTran = 2*cop.F;             % device width, m 
bey(k).Ionle = bey(k).volt/cop.Rtunn/5;  % on current, A/m, factor 5 = Vdd/Vcritical
bey(k).Iofle = 1e-1*bey(k).Ionle;   % off current, A/m
bey(k).Cadj = 2;                    % very high interlayer capacitance
bey(k).invlen = 4;                  % length of inverter in metal-1 pitches
bey(k).nandlen = 6;                 % length of NAND in metal-1 pitches
bey(k).invwid = 4;                  % length of inverter in metal-1 pitches
bey(k).nandwid = 4.5;               % length of NAND in metal-1 pitches
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'ExFET   '; ...    
% FAME '14 FIX IT
k=find(strcmp(deblank('ExFET   '),caey));
if(~isempty(k))
bey(k).volt = 0.4;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m
bey(k).Ionle = 1000;                % on current, A/m
bey(k).Iofle = 0.3;                 % off current, A/m
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'MITFET  '; ...
% FAME 
k=find(strcmp(deblank('MITFET  '),caey));
if(~isempty(k))
bey(k).volt = 0.5;
bey(k).wTran = cop.elecwidth*cop.F; % device width, m
bey(k).Ionle = 3000;                % on current, A/m
bey(k).Iofle = 0.3;                 % worse off current, A/m, due to the deplection mode
bey(k).Cadj = 2.56/Cgaun;           % very high capacitance of the ferroelectric
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'SpinFET '; ...
% estimate derived from CMOS HP
k=find(strcmp(deblank('SpinFET '),caey));
if(~isempty(k))
bey(k).volt = 0.7;
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
bey(k).Ionle = 700;                 % on current, A/m
bey(k).Iofle = 0.3/10;              % off current, A/m, suppressed due to magnetoresistance
bey(k).Cadj = 2;                    % cap adjustment for an MTJ
Ron = bey(k).volt/bey(k).Ionle;     % on-resistance for the transistor, large Vds
bey(k).Ionle = bey(k).Ionle/(1+cop.Rcont/Ron);
bey(k).Iofle = cop.Jg*cop.Lch + bey(k).Iofle;
end

% 'ASL     '; ...    
k=find(strcmp(deblank('ASL     '),caey));
if(~isempty(k))
bey(k).mgates = 2;                              % 2 crosses in the functionally enhanced adder
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

% 'CSL    '; ...
k=find(strcmp(deblank('CSL     '),caey));
if(~isempty(k))
bey(k).volt = 0.1;
bey(k).mgates = 2;                              % 2 crosses in the functionally enhanced adder
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

% 'STT/DW  '; ...     % Ross, aka MTJ logic switch
k=find(strcmp(deblank('STT/DW  '),caey));
if(~isempty(k))
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

% 'SMG     '; ...     % Nikonov
% cross-version
k=find(strcmp(deblank('SMG     '),caey));
if(~isempty(k))
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

% 'STOlogic'; ...     % Krivorotov, aka Spin Torque Majority Logic
k=find(strcmp(deblank('STOlogic'),caey));
if(~isempty(k))
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

% 'SWD     '; ...    
k=find(strcmp(deblank('SWD     '),caey));
if(~isempty(k))
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
bey(k).mgates = 2;                              % effectively 2 crosses in the adder
bey(k).majcrit = 1;                             % 1 crosses in the critical pass of an adder
end

% 'NML     '
k=find(strcmp(deblank('NML     '),caey));
if(~isempty(k))
bey(k).wTran = cop.elecwidth*cop.F;             % width of the transistor, m
bey(k).wMagn = cop.spinwidth*cop.F;             % width of the magnet, m
end

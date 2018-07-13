%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beyond-CMOS devices
% benchmarking of area, speed, and energy
% Intel approach 2011
% Dmitri Nikonov and Ian Young
% all in SI units, m, s, J
%   Title:      NRIrev6.m
%   Author:     Dmitri E Nikonov
%   Date:       01/01/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cop.ver = '2014';
% nomenclature
aey = [
    'CMOS HP '; ...
    'CMOS LV '; ...
    'vdWFET  '; ...
    'HomJTFET'; ...
    'HetJTFET'; ...
    'gnrTFET '; ...
    'ITFET   '; ...
    'ThinTFET'; ...
    'GaNTFET '; ...
    'TMDTFET '; ...
    'GpnJ    '; ...
    'FEFET   '; ...
    'NCFET   '; ...
    'PiezoFET'; ...
    'BisFET  '; ...
    'ExFET   '; ...
    'MITFET  '; ...
    'SpinFET '; ...     % Sugahara-Tanaka
    'ASL     '; ...     % Datta spin current
    'CSL     '; ...     % Datta spin Hall
    'STT/DW  '; ...     % Ross, aka MTJ logic switch; also CMU mLogic
    'SMG     '; ...     % Nikonov
    'STOlogic'; ...     % Krivorotov, aka Spin Torque Majority Logic
    'SWD     '; ...     % Khitun
    'NML     '; ...     % Porod and Niemier
    'TIGFET  ';         % Three-Independent-Gate FETs (TIGFETs)
    ]; 
% MEMG - not clear
% MESO - later
caey = cellstr(aey);    %cell array of names
saey = cell2struct(caey,'name',2);  % cell array to structure
ndev = size(aey,1);
if(~isfield(cop,'spindriv'))
% current or voltage driven magnetization switching
%cop.spindriv = 'current';
cop.spindriv = 'voltage';
% mechanism for current switching for SMG, STTtriad, STO, and ADL
%cop.sptortype = 'STTinp';
cop.sptortype = 'STToop';
%cop.sptortype = 'precess'
%cop.sptortype = 'SHE'
% Note: NML and SWD have specific current switching: Oersted field, not
% spin torque. STT/DW is siwtched by domain wall motion with current along
% the ferromagnetic wire. CSL is switched by spin Hall effect.
% mechanism for voltage switching
cop.mageltype = 'magnetostrictive';
%cop.mageltype = 'multiferroic';
%cop.mageltype = 'magnetoelectric';
%cop.mageltype = 'surfanisotropy';
end
% Voltage initialized depending on current or voltage driven magnetization
% switching
cop.vspinST = 0.01;                     % spin torque voltage
cop.vspinME = 0.1;                      % magnetoelectric voltage
switch cop.spindriv
    case 'current'
        vspin = cop.vspinST;
    case 'voltage'
        vspin = cop.vspinME;
end
bey(1:ndev,1) = struct(...
    'aint',0,'tint',0,'Eint',0,'aic',0,'tic',0,'Eic',0,...              % intrinsic device / short interconnect
    'ainv4',0,'tinv4',0,'Einv4',0,'anan',0,'tnan',0,'Enan',0,...        % FO4 inverter / NAND2
    'a1',0,'t1',0,'E1',0,'aadd',0,'tadd',0,'Eadd',0,...                 % 1-bit adder / 32-bit adder
    'ainv1',0,'tinv1',0,'Einv1',0,'axor',0,'txor',0,'Exor',0,...        % FO1 inverter / XOR
    'anan3',0,'tnan3',0,'Enan3',0,'anan4',0,'tnan4',0,'Enan4',0,...     % NAND3 / NAND4
    'amux',0,'tmux',0,'Emux',0,'adem',0,'tdem',0,'Edem',0,...           % MUX / DEMUX 1:4
    'ase',0,'tse',0,'Ese',0,'aram',0,'tram',0,'Eram',0,...              % state elelment / RAM
    'aao',0,'tao',0,'Eao',0,'aalu',0,'talu',0,'Ealu',0,...              % arithmetic operation / arithmetic logic unit
    'Sint',0,'Sic',0,'Sinv4',0,'Snan',0,'S1',0,'Sadd',0,...             % Standby powers for all devices
    'Sinv1',0,'Sxor',0,'Snan3',0,'Snan4',0,'Smux',0,'Sdem',0,...        % 60
    'Sse',0,'Sram',0,'Sao',0,'Salu',0,...
    'volt',vspin,'width',0,'length',0,'Ionle',0,'Iofle',0,'Cadj',1,...
    'wTran',0,'mgates',3,'Qeff',0,'Idev' ,0,'Reff',0,'Ceff',0,...
    'invlen',2,'invwid',5,'nandlen',3,'nandwid',6,'majcrit',2,'wMagn',0,...
    'axor3',0,'txor3',0,'Exor3',0,'amaj3',0,'tmaj3',0,'Emaj3',0,... % Three-input XOR and MAJ gates added for TIGFETs
    'CadjA',0,'CadjB',0,'CadjC',0,'CadjD',0,'tintA',0,'tintB',0,... % Extra variables to help with TIGFET complexity
    'tintC',0,'tintD',0,'EintA',0,'EintB',0,'EintC',0,'EintD',0);   % Extra variables to help with TIGFET complexity
for k=1:ndev
    switch saey(k).name     % these can only be spin torque      
        case {'STT/DW','STOlogic','ASL'}
            bey(k).volt = cop.vspinST;
    end
end
materialParameters  % No changes for TIGFET
beyondInputs6       % No changes for TIGFET
for k=1:ndev
    cop.name = saey(k).name;
    n = cop.name;
    switch saey(k).name
        % TIGFET technology added here.
        case {'TIGFET','CMOS HP','CMOS LV','vdWFET','HomJTFET','HetJTFET','gnrTFET',...
                'ITFET','ThinTFET','GaNTFET','TMDTFET','BisFET','ExFET'}
            bey(k) = XtorlikeArea(bey(k),cop);              % TIGFET path
            bey(k) = XtorlikeDevPerf(bey(k),cop);           % TIGFET path
            bey(k) = XtorlikeSimCirc(bey(k),cop);           % TIGFET path
        case {'SpinFET'}
            bey(k) = XtorlikeArea(bey(k),cop);
            bey(k) = XtorlikeDevPerf(bey(k),cop);
            bey(k) = XtorlikeSimCirc(bey(k),cop);
            bey(k) = NVmemory(bey(k),cop);
        case {'NCFET','PiezoFET'}
            bey(k) = XtorlikeArea(bey(k),cop);
            bey(k) = XtorlikeDevPerf(bey(k),cop);
            bey(k).tint = bey(k).tint + cop.tPZint;           % add ferroelectric material resoponse time
            bey(k) = XtorlikeSimCirc(bey(k),cop);
        case {'MITFET','FEFET'} % non-volatile transistors
            bey(k) = XtorlikeArea(bey(k),cop);
            bey(k) = FerroelDevPerf(bey(k),cop);
            bey(k) = XtorlikeSimCirc(bey(k),cop);
        case 'GpnJ'         % Naeemi
            bey(k) = XtorlikeArea(bey(k),cop);
            bey(k) = GpnJDevPerf(bey(k),cop);  
            bey(k) = XtorlikeSimCirc(bey(k),cop);
        % spintronics
        case 'STT/DW'       % Ross, aka MTJ logic switch; also CMU mLogic
            bey(k) = XtorlikeArea(bey(k),cop);
            bey(k) = STTDWPerf(bey(k),cop);
            bey(k) = XtorlikeSimCirc(bey(k),cop);
        case 'SMG'         % Nikonov
            bey(k) = MajGateArea(bey(k),cop);
            bey(k) = SMGDevPerf(bey(k),cop);
            bey(k) = MajGateSimCirc(bey(k),cop);
        case 'STOlogic'     % Krivorotov, aka Spin Torque Majority Logic
            cop.majsize = 2;                    % adjustment to majority gate size
            bey(k) = MajGateArea(bey(k),cop);
            bey(k) = STODevPerf(bey(k),cop);
            bey(k) = MajGateSimCirc(bey(k),cop);
            cop.majsize = 1;                    % adjustment to majority gate size
        case {'ASL','CSL'}         % Datta
            bey(k) = MajGateArea(bey(k),cop);
            bey(k) = ASLDevPerf(bey(k),cop);
            bey(k) = MajGateSimCirc(bey(k),cop);
        case 'SWD'          % Khitun
            bey(k) = MajGateArea(bey(k),cop);
            bey(k) = SWDDevPerf(bey(k),cop);
            bey(k) = MajGateSimCirc(bey(k),cop);
        case 'NML'          % Porod and Niemier
            bey(k) = MajGateArea(bey(k),cop);
            bey(k) = NMLDevPerf(bey(k),cop);
            bey(k) = MajGateSimCirc(bey(k),cop);
    end
    bey(k) = adder1toMany(bey(k),cop);      % TIGFET path
    bey(k) = alu(bey(k),cop);               % TIGFET path
    bey(k).Qeff = bey(k).Eint./bey(k).volt;
    bey(k).Reff = bey(k).volt./bey(k).Idev;
    bey(k).Ceff = bey(k).Qeff./bey(k).volt;
end
cey = struct2cell(bey);     %cell array of numbers
mey = cell2mat(cey);        %simple array of numbers
dn = aey;

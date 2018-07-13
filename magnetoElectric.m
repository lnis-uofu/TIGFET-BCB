%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title:      magnetoElectric.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bey.Ionle = cop.Ionle;
wdriv = 4*cop.F;                            % width of the driving transistor, m
Ion = wdriv*cop.Ionle;                      % current from the driving transistor, A
Cdriv = cop.Ctole*wdriv;                    % capacitance of the driving transistor, F
areame = bey.wMagn^2;                       % area of the magnetoelectric, m^2
Bcp = 0.1;                                  % numerical experiment value from OOMMF
switch cop.mageltype
    case 'multiferroic'
        % multiferroic switching BiFeO3 and CoFe
        % assumes that Bcp is achieved in exchange bias
Ereq = cop.Elecmf*Bcp/cop.Bmf;              % required electric field, V/m
bey.volt = Ereq*cop.thmf;                   % switching voltage, V      
sigmch = Ereq*eps0*cop.epsmf;               % charge denisty, C/m^2
Qtot = (cop.Pmf+sigmch)*areame;             % total charge, C
tmag = pi./abs(gamelec)/Bcp;                % magnetic switching time, s
    case 'magnetostrictive'
        % magnetostrictive switching PMN-PT and CoFe
Ereq = cop.Elecms*Bcp/cop.Bms;              % required electric field, V/m
bey.volt = Ereq*cop.thms;                   % switching voltage, V 
sigmch = Ereq*eps0*cop.epsms;               % charge denisty, C/m^2
Qtot = (cop.Pms+sigmch)*areame;             % total charge, C
tmag = pi./abs(gamelec)/Bcp;                % magnetic switching time, s
    case 'magnetoelectric'
        % magnetoelectric switching Cr2O3 and CoFe
Ereq = cop.Elecme*Bcp/cop.Bme;              % required electric field, V/m
bey.volt = Ereq*cop.thme;                   % switching voltage, V
sigmch = Ereq*eps0*cop.epsme;               % charge denisty, C/m^2
Qtot = sigmch*areame;                       % charge on the capacitor, C
tmag = pi./abs(gamelec)/Bcp;                % magnetic switching time, s
    case 'surfanisotropy'
        % surface anisotropy switching MgO and CoFe
Ereq = cop.Elecsu*Bcp/cop.Bsu;              % required electric field, V/m
bey.volt = Ereq*cop.thsu;                   % switching voltage, V
sigmch = Ereq*eps0*cop.epssu;               % charge denisty, C/m^2
Qtot = sigmch*areame;                       % charge on the capacitor, C
tmag = pi./abs(gamelec)/Bcp;                % magnetic switching time, s
end
Qtot = Qtot + Cdriv*bey.volt;               % add the contribution of the driving transistor
% includes energy to charge a capacitor and to switch the driving
% transistor. it is dissipated as Ohmic loss
tme = Qtot/Ion;                             % switching time for the magnetoelectric, s
Ecomb = Qtot*bey.volt/2;                    % switching energy for the magnetoelectric, J
tcomb = max(cop.tFEint,tmag);                % added intrinsic ferroelectric time
Ile1 = cop.Jg*cop.Lch;
Ile = Ile1*bey.volt/cop.vTran;
Sint = Ile*bey.wTran*bey.volt;

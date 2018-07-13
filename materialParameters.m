%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Material parameters for beyond-CMOS devices
% all in SI units, m, s, J
%   Title:      materialParameters.m
%   Author:     Dmitri E Nikonov
%   Date:       03/22/2014
%   (C) Dmitri E. Nikonov 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fundcon

cop.hbar = hbar;
cop.eelec = eelec;
cop.eps0 = eps0;
cop.epsSiO2 = 3.9;                  % Si dioxide dielectric constant
cop.Rquant = 2*pi*hbar/eelec/eelec; % quantum resistance, Ohm
cop.vF = 8e5;                       % particle velocity in graphene, m/s
cop.rho = 1.9e-8;                   % copper resitivity, Ohm*m
cop.F = 15e-9;                      % metal half-pitch, m  %Technology node
cop.Lch = 12.8e-9;                  % channel length 
cop.EOTdiel = 0.68e-9;              % real equivalent oxide thickness
cop.EOT = 1.08e-9;                   % electrical equivalent oxide thickness, m
cop.gatearea = 1.5;                 % area overhead for the gate factor
cop.bitarea = 1.5;                  % areaoverhead for the bit
cop.adderarea = 1.5;                % extra area between bits
cop.elecwidth = 4;                  % factor of transistor width
cop.spinwidth = 1;                  % factor of spintronic device width
cop.pitch = 4*cop.F;                % pitch of metal 1
cop.lic = 5*cop.pitch;              % typical length of an electrical interconnect
cop.licsp = 5*cop.pitch;            % typical length of a spin spin interconnect
cop.parasitC = 1.5;                 % cap w. parasitics re. cap of the gate

cop.Cgaar = eps0*cop.epsSiO2/cop.EOT;   % gate capacitance, F/m^2
cop.Cgale = cop.Cgaar*cop.Lch;          % gate capacitance, F/m
cop.Ctole = cop.Cgale*(cop.parasitC+1); % parasitics adjusted gate capacitance, F/m
cop.Rcont = 1.6e-4;                 % contact resistance, either source or drain, Ohm*m, NOT included in the I-V
cop.Rtunn = 1e-3;                   % tunneling resistance (between two layers of graphene), Ohm*m
cop.epsILD = 2;                     % interlayer dielectric constant
cop.Cicle = CapWire(2*cop.F,4*cop.F,2*cop.F,4*cop.F,cop.epsILD);
                                    % interconnect capacitance per unit length, F/m
cop.Cic = cop.lic*cop.Cicle;        % interconnect capacitance per logic gate, F
cop.Jg = 1e5;                       % ga2
cop.Ileak = 0.1;                    % S to D leakage current in CMOS HP, A/m
cop.adderorder = 32;                % how many bits in an adder
% empirical factors for delay and energy in transistor-like circuits
cop.factic = 0.7;                   % from S. Rakhedja paper, =0.7 interconnect cap
cop.facEcap = 0.5;                  % normal capacitor 1/2
cop.factinv = 0.9;                  % from spice
cop.facEinv = 1.4;                  % from spice
cop.factnan = 2.0;                  % from spice
cop.facEnan = 2.0;                  % from spice
% piezoelectrric FET parameters
cop.epspiezo = 9;                   % dielectric constant of AlN
cop.thpiezo = 1e-9;                 % thickness of AlN
cop.Cpiezo = eps0*cop.epspiezo/cop.thpiezo;     % capacitance of pite leakage current density, A/m^ezo
% ferroelectric FET parameters (corr to PZT)
cop.Pfe = 0.1;                      % polarization of a ferroelectric, C/m^2
cop.Ecfe = 7e6;                     % coercive field in a ferroelectric, V/m
cop.thfe = 5e-9;                    % tickness of a ferroelectric, m
cop.epsfe = 250;                    % dielectric constant of a ferroelectric
cop.Cfear = eps0*cop.epsfe/cop.thfe;% ferroelectric linear capacitance, F/m^2
cop.tPZint = 1e-11;                 % incomplete polarization intrinsic switching time, and piezoelectric
cop.tFEint = 3e-11;                 % ferroelectric intrinsic full polarization switching time
% magnetic parameters
cop.majsize = 1;                    % adjustment to majority gate size, trivial =1
cop.Msat = 1e6;                     % saturation magnetization, A/m
cop.Mspe = 3e5;                     % saturation magnetization perpendicular, A/m
cop.sppol = 0.7;                    % spin polarization for injected current
cop.alpha = 0.01;                   % Gilbert damping
cop.thFM = 2e-9;                    % thickness of a ferromagnet, m
cop.RAfm = 5e-12;                   % magnetic tunnel junction resistancew*area, Ohm*m^2
cop.TMR = 2;                        % magnetoresistance factor
cop.Bk = 4.0;                       % anisotropy magnetic field, T=kg/C/s
cop.Ku = cop.Mspe*cop.Bk/2;         % net perpendicular anisotropy, J/m^3
cop.gLande = 2;                     % Lande factor for electrons
cop.Bneed = 0.01;                   % empirical magnetic field, T. needd to clock NML
cop.mmag = 4;                       % magnetic permeability
cop.Jdw = 1.4e11;                   % domain wall critical current density, A/m^2
cop.Rwiring = 300;                  % resistance of the power and ground networks for spintronics, Ohm
cop.RAspinvalve = 3e-14;            % resistance*area of a spin valve, Ohm*m^2
cop.Dcu = 5.2e-3;                   % diffusion coefficient in a copper wire, m^2/s
% spin Hall effect
cop.SHEC = 0.3;                     % spin Hall effect coefficient for tungsten=W
cop.thSH = 2e-9;                    % thickness of the spin Hall metal, m
cop.rhoSH = 5.3e-8;                 % tungsten resistivity, Ohm*m
% multiferroic switching BiFeO3 and CoFe
cop.Elecmf = 1.3e7;                 % critical field in multiferroic, V/m
cop.epsmf = 54;                     % dielectric constant in multiferroic
cop.Pmf = 0.55;                     % multiferroic saturation polarization, C/m^2
cop.Bmf = 0.03;                     % multiferroic exchange field, T, assumed fulfilled
cop.thmf = 1e-8;                    % thickness of multiferroic, m
% magnetostrictive switching PMN-PT and CoFe
cop.Elecms = 2e5;                   % critical field in piezoelectric, V/m
cop.epsms = 1000;                   % dielectric constant in piezoelectric
cop.Pms = 0.3;                      % piezoelectric saturation polarization, C/m^2
cop.Bms = 0.01;                     % magnetostrictive effective field, T
cop.thms = 3e-8;                    % thickness of piezoelectric, m
% magnetoelectric switching Cr2O3 and CoFe
cop.Elecme = 2.6e6;                 % magnetoelectric critical field, V/m
cop.epsme = 13;                     % dielectric constant in the magnetoelectric
cop.Bme = 0.009;                    % magnetoelectric effective field, T, 
% normalized to ferromagnet thickness of 2nm, surface effect
cop.thme = 1e-8;                    % thickness of magnetoelectric, m
% surface anisotropy switching MgO and CoFe
cop.Elecsu = 2.6e8;                 % piezoelectric critical field, V/m
cop.epssu = 9.5;                    % dielectric constant in piezoelectric
cop.Bsu = 0.04;                     % magnetostrictive effective field, T
cop.thsu = 1.5e-9;                  % thickness of MgO layer, m
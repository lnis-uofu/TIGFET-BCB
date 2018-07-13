%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spin torque parameters for inplane magnetization
%   Title:      precesST.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
aspect = 3;
area = aspect*bey.wTran*bey.wTran;
vol = area*cop.thFM;
[Nxx,Nyy,Nzz] = demagnetiz(aspect*bey.wTran,bey.wTran,cop.thFM,'cuboid');
deltaN = Nyy-Nxx;                    % difference of demagnetization factors                                  
Kmag = mu0*cop.Msat^2/2;             % magnetic energy, J/m^3
Delta = deltaN*Kmag*vol/kbT;         % stability factor
% current
bey.Ionle = cop.Ionle;
wdriv = 12*cop.F;                            % width of the driving transistor, m WIDE!!
Ion = wdriv*cop.Ionle;                      % current from the driving transistor, A
% precessional switching time
mz = sqrt(deltaN/Nzz);
Bdem = cop.mu0*cop.Msat*mz*Nzz;
tmag =  pi./abs(gamelec)/Bdem;
Qsw = mz*2*cop.Msat*eelec*vol/gelec/muB/cop.sppol;
tpulse = Qsw/Ion;
Ile1 = cop.Jg*cop.Lch+cop.Ileak;
Ile = Ile1*bey.volt/cop.vTran;
Sint = Ile*bey.wTran*bey.volt;

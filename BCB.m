%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   comparison beyond CMOS devices with multiple circuits
%   Title:      BCB.m
%   Author:     Dmitri E Nikonov
%   Date:       09/16/16
%   (C) Dmitri E. Nikonov 2012
%   
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all 
% choice of a version for benchmarking
NRIrev6
% plotting and outputs (y = yes, n = no)
cop.outInv = 'y';     
cop.outNand = 'y';    
cop.outAdd = 'y';
cop.outXor = 'y';
cop.outMux = 'y';
cop.outRam = 'y';
cop.outSe = 'y'; 
cop.outAlu = 'y';
cop.ploPow = 'y';
cop.ploCurr = 'y';
cop.wriArea = 'y';
cop.ploUniv = 'y';
cop.plotAE = 'y';
% rescaling plots for energy-delay
mnove = 1;
mnoni = 1;
mnopr = 1;
mnole = 1;
if(strcmp(cop.outInv,'y'))
titna = 'INVFO4';
aplot = mey(7,:)*1e12;
tplot = mey(8,:)*1e12;
Eplot = mey(9,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e4*mnopr 1e-4*mnoni 1e2*mnove];
nfi = 110;
plotNRI
end
if(strcmp(cop.outNand,'y'))
titna = 'NAND2';
aplot = mey(10,:)*1e12;
tplot = mey(11,:)*1e12;
Eplot = mey(12,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e4*mnopr 1e-5*mnoni 1e1*mnove];
nfi = 120;
plotNRI
end
if(strcmp(cop.outAdd,'y'))
titna = '32bit adder';
aplot = mey(16,:)*1e12;
tplot = mey(17,:)*1e12;
Eplot = mey(18,:)*1e15;
Splot = mey(54,:);
marcol = 'b';
diap = [1e1*mnole 1e6*mnopr 1e-1*mnoni 1e3*mnove];
nfi = 130;
plotNRI
    if(strcmp(cop.ploPow,'y'))
    diathru = [1e1 1e4 1e-1 3e1];
    throughPower
    end
end
if(strcmp(cop.outXor,'y'))
titna = 'XOR';
aplot = mey(22,:)*1e12;
tplot = mey(23,:)*1e12;
Eplot = mey(24,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e4*mnopr 1e-4*mnoni 1e2*mnove];
nfi = 140;
plotNRI
end
if(strcmp(cop.outMux,'y'))
titna = 'MUX';
aplot = mey(31,:)*1e12;
tplot = mey(32,:)*1e12;
Eplot = mey(33,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e5*mnopr 1e-3*mnoni 1e2*mnove];
nfi = 150;
plotNRI
end
if(strcmp(cop.outRam,'y'))
titna = 'Register Bit';
aplot = mey(40,:)*1e12;
tplot = mey(41,:)*1e12;
Eplot = mey(42,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e4*mnopr 1e-3*mnoni 1e1*mnove];
nfi = 160;
plotNRI
end
if(strcmp(cop.outSe,'y'))
titna = 'State Element';
aplot = mey(37,:)*1e12;
tplot = mey(38,:)*1e12;
Eplot = mey(39,:)*1e15;
marcol = 'b';
diap = [1e0*mnole 1e5*mnopr 1e-3*mnoni 1e1*mnove];
nfi = 170;
plotNRI
end
if(strcmp(cop.outAlu,'y'))
titna = '32bit ALU';
aplot = mey(46,:)*1e12;
tplot = mey(47,:)*1e12;
Eplot = mey(48,:)*1e15;
Splot = mey(64,:);
marcol = 'b';
diap = [1e2*mnole 1e6*mnopr 1e0*mnoni 1e4*mnove];
nfi = 180;
plotNRI
    if(strcmp(cop.ploPow,'y'))
    diathru = [1e0 1e3 1e-2 3e1];
    throughPower
    end

end
% additional processing
if(strcmp(cop.ploCurr,'y'))
    TransCurrents
end
if(strcmp(cop.wriArea,'y'))
    areaNRI
end
if(strcmp(cop.ploUniv,'y'))
   universalDevice
end

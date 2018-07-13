%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% comparisons of Intel and NRI benchmarks
%   Title:      NRI_Y2Ycomp.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
% choice of a version for benchmarking
NRIrev6
% plotting and outputs
cop.outInv = 'y';
cop.outNand = 'y';
cop.outAdd = 'y';
cop.outXor = 'n';
cop.outMux = 'n';
cop.outRam = 'n';
cop.outSe = 'n';
cop.outAlu = 'y';
cop.ploPow = 'n';
cop.ploCurr = 'n';
cop.wriArea = 'n';
cop.ploUniv = 'n';
% rescaling plots for energy-delay
mnove = 1;
mnoni = 1;
mnopr = 1;
mnole = 1;
if(strcmp(cop.outAdd,'y'))
titna = '32bit adder';
aplot = mey(16,:)*1e12;
tplot = mey(17,:)*1e12;
Eplot = mey(18,:)*1e15;
Splot = mey(54,:);
marcol = 'b';
diap = [1e2*mnole 1e6*mnopr 1e-1*mnoni 1e3*mnove];
nfi = 3;
plotNRI
end
load('bcb20.mat')
aplot = mey(16,:)*1e12;
tplot = mey(17,:)*1e12;
Eplot = mey(18,:)*1e15;
marcol = 'y';
plotNRI
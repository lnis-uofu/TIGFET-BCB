%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% formatting and file output of areas for circuits 
%   Title:      areaNRI.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
arey = [mey(1,:); mey(7,:); mey(10,:); mey(13,:); mey(16,:); ...
    mey(19,:); mey(22,:); mey(25,:); mey(28,:); mey(31,:); mey(34,:); mey(37,:); ...
    mey(40,:); mey(43,:); mey(46,:) ];
arF = round(arey.'/cop.F/cop.F);
dlmwrite('arF.txt',arF,'\t');
% intrinsic device / (short interconnect
% FO4 inverter / NAND2 = NOR2
% 1-bit adder / ((32-bit adder
% FO1 inverter / XOR
% NAND3 / NAND4
% MUX / DEMUX 1:4
% state elelment / RAM
% ((arithmetic operation /((arithmetic logic unit

VI = [mey(65,:); mey(68,:); mey(69,:).*1000; mey(70,:)];
VIF = VI';
dlmwrite('VIF.txt',VIF,'\t');

% for the adder
atE = [mey(16,:)*1e12; mey(17,:)*1e12; mey(18,:)*1e15];
atEf = atE';
dlmwrite('atE.txt',atEf,'\t');

% for the ALU
atE = [mey(46,:)*1e12; mey(47,:)*1e12; mey(48,:)*1e15];
atEf = atE';
dlmwrite('alu.txt',atEf,'\t');

intE = [mey(2,:)*1e12; mey(3,:)*1e18; mey(5,:)*1e12; mey(6,:)*1e18];
intEf = intE';
dlmwrite('intE.txt',intEf,'\t');
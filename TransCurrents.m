%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot throughput-power for a set of devices
%   Title:      TransCurrents.m
%   Author:     Dmitri E Nikonov
%   Date:       05/09/2014
%   (C) Dmitri E. Nikonov 2014
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
malkegl = 10;
malkegdot = 12;
curon = mey(68,:);
curoff = mey(69,:);
Vdd = mey(65,:);
curoncuroff = curon./curoff;

figure(1011)
loglog(curoff,curon,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(curoff(1),curon(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(2),curon(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(3),curon(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(4),curon(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(5),curon(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(6),curon(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(7),curon(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(8),curon(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(9),curon(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(10),curon(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(11),curon(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(12),curon(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(13),curon(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(14),curon(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(15),curon(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(16),curon(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(17),curon(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(18),curon(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(19),curon(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(20),curon(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(21),curon(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(22),curon(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(23),curon(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(24),curon(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(25),curon(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(curoff(26),curon(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Off Current, A/m')
ylabel('On Current, A/m')
captfact = exp(0.3*(2*rand(size(curon))-1));
text(curoff.*1.3,curon.*captfact,dn,'FontSize',malkegl)

figure(1012)
semilogy(Vdd,curoncuroff,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(Vdd(1),curoncuroff(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(2),curoncuroff(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(3),curoncuroff(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(4),curoncuroff(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(5),curoncuroff(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(6),curoncuroff(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(7),curoncuroff(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(8),curoncuroff(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(9),curoncuroff(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(10),curoncuroff(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(11),curoncuroff(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(12),curoncuroff(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(13),curoncuroff(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(14),curoncuroff(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(15),curoncuroff(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(16),curoncuroff(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(17),curoncuroff(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(18),curoncuroff(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(19),curoncuroff(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(20),curoncuroff(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(21),curoncuroff(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(22),curoncuroff(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(23),curoncuroff(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(24),curoncuroff(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(25),curoncuroff(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Vdd(26),curoncuroff(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Voltage, V')
ylabel('On/Off Current, A/m')
captfact = exp(0.3*(2*rand(size(curon))-1));
text(Vdd.*1.07,curoncuroff.*captfact,dn,'FontSize',malkegl)

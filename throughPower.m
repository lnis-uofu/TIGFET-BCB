%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot throughput-power for aset of devices
%   Title:      throughPower.m
%   Author:     Dmitri E Nikonov
%   Date:       11/07/2011
%   (C) Dmitri E. Nikonov 2011
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
malkegl = 10;
malkegdot = 12;
powLimit = 10;
thruput = 1e8./aplot./tplot;
power = thruput.*Eplot/1e3 + 1e-4.*Splot./aplot;
kp = find(power>powLimit);
thruput(kp)= thruput(kp)*powLimit./power(kp);
power(kp) = powLimit;

figure(nfi+9)
loglog(thruput,power,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(thruput(1),power(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(2),power(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(3),power(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(4),power(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(5),power(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(6),power(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(7),power(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(8),power(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(9),power(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(10),power(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(11),power(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(12),power(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(13),power(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(14),power(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(15),power(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(16),power(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(17),power(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(18),power(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(19),power(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(20),power(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(21),power(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(22),power(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(23),power(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(24),power(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(25),power(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(thruput(26),power(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Throughput, TIOPS/cm^2')
ylabel('Power Density, W/cm^2')
captfact = exp(0.3*(2*rand(size(power))-1));
text(thruput.*1.15,power.*captfact,dn,'FontSize',malkegl)
axis(diathru)
title(titna)

powAct = Eplot./tplot.*1e-3;            % active power, W
figure(nfi+8)
loglog(Splot,powAct,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(Splot(1),powAct(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(2),powAct(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(3),powAct(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(4),powAct(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(5),powAct(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(6),powAct(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(7),powAct(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(8),powAct(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(9),powAct(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(10),powAct(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(11),powAct(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(12),powAct(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(13),powAct(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(14),powAct(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(15),powAct(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(16),powAct(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(17),powAct(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(18),powAct(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(19),powAct(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(20),powAct(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(21),powAct(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(22),powAct(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(23),powAct(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(24),powAct(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(25),powAct(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(26),powAct(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Standby Power, W')
ylabel('Active Power, W')
captfact = exp(0.3*(2*rand(size(powAct))-1));
text(Splot.*1.3,powAct,dn,'FontSize',malkegl)
title(titna)

figure(nfi+10)
loglog(Splot,Eplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(Splot(1),Eplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(2),Eplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(3),Eplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(4),Eplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(5),Eplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(6),Eplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(7),Eplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(8),Eplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(9),Eplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(10),Eplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(11),Eplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(12),Eplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(13),Eplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(14),Eplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(15),Eplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(16),Eplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(17),Eplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(18),Eplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(19),Eplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(20),Eplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(21),Eplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(22),Eplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(23),Eplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(24),Eplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(25),Eplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(26),Eplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Standby Power, W')
ylabel('Energy, fJ')
captfact = exp(0.3*(2*rand(size(Eplot))-1));
text(Splot.*1.15,Eplot.*captfact,dn,'FontSize',malkegl)
%axis(diathru)
title(titna)

%%% TIGFET extension start
% The following plots the standby energy vs switching energy. 1e3 is added for units.
figure(nfi+100)
loglog(Splot.*tplot*1e3,Eplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
hold on
    loglog(Splot(1).*tplot(1)*1e3,Eplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(2).*tplot(2)*1e3,Eplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(3).*tplot(3)*1e3,Eplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(4).*tplot(4)*1e3,Eplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(5).*tplot(5)*1e3,Eplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(6).*tplot(6)*1e3,Eplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(7).*tplot(7)*1e3,Eplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(8).*tplot(8)*1e3,Eplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(9).*tplot(9)*1e3,Eplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(10).*tplot(10)*1e3,Eplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(11).*tplot(11)*1e3,Eplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(12).*tplot(12)*1e3,Eplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(13).*tplot(13)*1e3,Eplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(14).*tplot(14)*1e3,Eplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(15).*tplot(15)*1e3,Eplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(16).*tplot(16)*1e3,Eplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(17).*tplot(17)*1e3,Eplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(18).*tplot(18)*1e3,Eplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(19).*tplot(19)*1e3,Eplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(20).*tplot(20)*1e3,Eplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(21).*tplot(21)*1e3,Eplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(22).*tplot(22)*1e3,Eplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(23).*tplot(23)*1e3,Eplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(24).*tplot(24)*1e3,Eplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(25).*tplot(25)*1e3,Eplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Splot(26).*tplot(26)*1e3,Eplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Standby Energy, fJ')
ylabel('Switching Energy, fJ')
captfact = exp(0.3*(2*rand(size(Eplot))-1));
text(Splot.*tplot*1e3.*1.15,Eplot.*captfact,dn,'FontSize',malkegl)
title(titna)

%%% TIGFET extension end



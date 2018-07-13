%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot delay-energy and other views of devices
%   Title:      plotNRI.m
%   Author:     Dmitri E Nikonov
%   Date:       03/10/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
malkegl = 10;
malkegdot = 12;
udal = 1.5;
cop.plotAD = 'y';
cop.plotAE = 'y';
cop.plotDE = 'y';
cop.plotDP = 'y';
Pplot = Eplot./tplot*1e-3;                  % active power, W
if(strcmp(cop.plotAD,'y'))
    figure(nfi+1)
    loglog(tplot,aplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)
    hold on
    loglog(tplot(1),aplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(2),aplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(3),aplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(4),aplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(5),aplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(6),aplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(7),aplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(8),aplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(9),aplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(10),aplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(11),aplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(12),aplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(13),aplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(14),aplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(15),aplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(16),aplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(17),aplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(18),aplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(19),aplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(20),aplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(21),aplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(22),aplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(23),aplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(24),aplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(25),aplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(26),aplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold off
    set(gca,'FontSize',malkegl,'FontWeight','bold')
    ylabel('Area, \mu{m}^2')
    xlabel('Delay, ps')
    text(tplot.*udal,aplot.*udal,dn,'FontSize',malkegl)
    title(titna)
end
if(strcmp(cop.plotAE,'y'))
    figure(nfi+2)
    loglog(Eplot,aplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot)    
    hold on
    loglog(Eplot(1),aplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(2),aplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(3),aplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(4),aplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(5),aplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(6),aplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(7),aplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(8),aplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(9),aplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(10),aplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(11),aplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(12),aplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(13),aplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(14),aplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(15),aplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(16),aplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(17),aplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(18),aplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(19),aplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(20),aplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(21),aplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(22),aplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(23),aplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(24),aplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(25),aplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eplot(26),aplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold off
    set(gca,'FontSize',malkegl,'FontWeight','bold')
    ylabel('Area, \mu{m}^2')
    xlabel('Energy, fJ')
    text(Eplot.*udal,aplot.*udal,dn,'FontSize',malkegl)
    title(titna)
end
if(strcmp(cop.plotDE,'y'))
    % grid of lines
tg = [1e-1 1e7];
Eg0 = 1e7./tg;
Eg1 = 1e6./tg;
Eg2 = 1e5./tg;
Eg3 = 1e4./tg;
Eg4 = 1e3./tg;
Eg5 = 1e2./tg;
Eg6 = 1e1./tg;
Eg7 = 1e0./tg;
Eg8 = 1e-1./tg;
Eg9 = 1e-2./tg;
Eg10 = 1e8./tg;
Eg11 = 1e9./tg; 
Eg12 = 1e10./tg;
    figure(nfi+3)
    loglog(tplot,Eplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold on
    loglog(tplot(1),Eplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(2),Eplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(3),Eplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(4),Eplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(5),Eplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(6),Eplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(7),Eplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(8),Eplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(9),Eplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(10),Eplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(11),Eplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(12),Eplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(13),Eplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(14),Eplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(15),Eplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(16),Eplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(17),Eplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(18),Eplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(19),Eplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(20),Eplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(21),Eplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(22),Eplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(23),Eplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(24),Eplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(25),Eplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(26),Eplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold off
    set(gca,'FontSize',malkegl,'FontWeight','bold')
    xlabel('Delay, ps')
    ylabel('Energy, fJ')
    text(tplot.*udal,Eplot,dn,'FontSize',malkegl)
    if(exist('diap','var'))
        axis(diap)
    end
    %xlim([1e2 1e6]) 
    title(titna)
    hold on
    p=loglog(tg,Eg0,tg,Eg1,tg,Eg2,tg,Eg3,tg,Eg4,tg,Eg5,tg,Eg6,tg,Eg7,tg,Eg8,tg,Eg9,tg,Eg10,tg,Eg11,tg,Eg12);
    set(p,'Color',[0.4 0.4 0.4],'LineStyle','--')
    hold off
end
if(strcmp(cop.plotDP,'y'))
   figure(nfi+4)
    loglog(tplot,Pplot,'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold on
    loglog(tplot(1),Pplot(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(2),Pplot(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(3),Pplot(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(4),Pplot(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(5),Pplot(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(6),Pplot(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(7),Pplot(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(8),Pplot(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(9),Pplot(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(10),Pplot(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(11),Pplot(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(12),Pplot(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(13),Pplot(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(14),Pplot(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(15),Pplot(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(16),Pplot(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(17),Pplot(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(18),Pplot(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(19),Pplot(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(20),Pplot(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(21),Pplot(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(22),Pplot(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(23),Pplot(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(24),Pplot(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(25),Pplot(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tplot(26),Pplot(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
    hold off
    set(gca,'FontSize',malkegl,'FontWeight','bold')
    xlabel('Delay, ps')
    ylabel('Active Power, W')
    text(tplot.*udal,Pplot,dn,'FontSize',malkegl)
    title(titna)
end
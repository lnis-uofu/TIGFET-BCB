%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot universal charge-resistance characteristics for devices
%   Title:      universalDevice.m
%   Author:     Dmitri E Nikonov
%   Date:       04/06/2012
%   (C) Dmitri E. Nikonov 2012
%
%   TIGFET Extension
%   Edited by:  J. Romero-Gonzalez, P.-E. Gaillardon, Univeristy of Utah
%   Date:       06/05/2018
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NRIrev6
malkegl = 10;
malkegdot = 12;
polimya = fieldnames(bey);
npo = length(polimya);
for k = 1:npo
    if(strcmp(polimya(k),'tint')); tint = mey(k,:)*1e12; end
    if(strcmp(polimya(k),'Eint')); Eint = mey(k,:)*1e15; end
    if(strcmp(polimya(k),'tadd')); tadd = mey(k,:)*1e12; end
    if(strcmp(polimya(k),'Eadd')); Eadd = mey(k,:)*1e15; end
    if(strcmp(polimya(k),'volt')); volt = mey(k,:);      end
    if(strcmp(polimya(k),'Qeff')); Qeff = mey(k,:)./eelec; end
    if(strcmp(polimya(k),'Idev')); Idev = mey(k,:).*1e6; end
    if(strcmp(polimya(k),'Reff')); Reff = mey(k,:);      end
    if(strcmp(polimya(k),'Ceff')); Ceff = mey(k,:).*1e18;end
end
Edint = Eint.*tint;
Edadd = Eadd.*tadd;
trat = tadd./tint;
Erat = Eadd./Eint;
Edrat = Edadd./Edint;
hfull = 2*pi*hbar;
Rquant = hfull/eelec/eelec;
QQR = Qeff.*Qeff.*Reff./Rquant;
Ednat = Edint./hfull.*1e-27;
malkegl = 10;
malkegdot = 12;
tolsh = 2;
marcol = 'b';
sdvig = 1.1;

figure(601)
loglog(tint,trat,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(tint(1),trat(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(2),trat(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(3),trat(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(4),trat(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(5),trat(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(6),trat(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(7),trat(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(8),trat(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(9),trat(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(10),trat(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(11),trat(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(12),trat(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(13),trat(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(14),trat(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(15),trat(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(16),trat(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(17),trat(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(18),trat(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(19),trat(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(20),trat(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(21),trat(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(22),trat(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(23),trat(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(24),trat(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(25),trat(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(tint(26),trat(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Device Delay, ps')
ylabel('Adder/Device Delay')
text(tint.*sdvig,trat.*sdvig,dn,'FontSize',malkegl)

figure(602)
loglog(Eint,Erat,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(Eint(1),Erat(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(2),Erat(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(3),Erat(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(4),Erat(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(5),Erat(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(6),Erat(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(7),Erat(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(8),Erat(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(9),Erat(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(10),Erat(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(11),Erat(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(12),Erat(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(13),Erat(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(14),Erat(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(15),Erat(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(16),Erat(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(17),Erat(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(18),Erat(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(19),Erat(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(20),Erat(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(21),Erat(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(22),Erat(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(23),Erat(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(24),Erat(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(25),Erat(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Eint(26),Erat(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Device Energy, fJ')
ylabel('Adder/Device Energy')
text(Eint.*sdvig,Erat.*sdvig,dn,'FontSize',malkegl)

figure(603)
loglog(Edint,Edrat,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(Edint(1),Edrat(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(2),Edrat(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(3),Edrat(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(4),Edrat(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(5),Edrat(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(6),Edrat(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(7),Edrat(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(8),Edrat(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(9),Edrat(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(10),Edrat(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(11),Edrat(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(12),Edrat(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(13),Edrat(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(14),Edrat(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(15),Edrat(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(16),Edrat(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(17),Edrat(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(18),Edrat(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(19),Edrat(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(20),Edrat(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(21),Edrat(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(22),Edrat(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(23),Edrat(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(24),Edrat(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(25),Edrat(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Edint(26),Edrat(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Devics E*d, fJ\cdot{ps}')
ylabel('Adder/Device E*d')
text(Edint.*sdvig,Edrat.*sdvig,dn,'FontSize',malkegl)

figure(604)
loglog(volt,Qeff,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(volt(1),Qeff(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(2),Qeff(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(3),Qeff(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(4),Qeff(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(5),Qeff(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(6),Qeff(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(7),Qeff(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(8),Qeff(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(9),Qeff(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(10),Qeff(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(11),Qeff(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(12),Qeff(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(13),Qeff(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(14),Qeff(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(15),Qeff(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(16),Qeff(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(17),Qeff(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(18),Qeff(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(19),Qeff(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(20),Qeff(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(21),Qeff(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(22),Qeff(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(23),Qeff(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(24),Qeff(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(25),Qeff(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(26),Qeff(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Voltage, V')
ylabel('Charge, e')
text(volt.*sdvig,Qeff.*sdvig,dn,'FontSize',malkegl)

figure(605)
loglog(volt,Idev,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(volt(1),Idev(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(2),Idev(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(3),Idev(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(4),Idev(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(5),Idev(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(6),Idev(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(7),Idev(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(8),Idev(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(9),Idev(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(10),Idev(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(11),Idev(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(12),Idev(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(13),Idev(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(14),Idev(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(15),Idev(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(16),Idev(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(17),Idev(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(18),Idev(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(19),Idev(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(20),Idev(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(21),Idev(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(22),Idev(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(23),Idev(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(24),Idev(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(25),Idev(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(volt(26),Idev(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Voltage, V')
ylabel('Current, \mu{A}')
text(volt.*sdvig,Idev.*sdvig,dn,'FontSize',malkegl)

figure(606)
loglog(Reff,Ceff,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(Reff(1),Ceff(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(2),Ceff(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(3),Ceff(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(4),Ceff(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(5),Ceff(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(6),Ceff(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(7),Ceff(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(8),Ceff(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(9),Ceff(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(10),Ceff(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(11),Ceff(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(12),Ceff(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(13),Ceff(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(14),Ceff(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(15),Ceff(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(16),Ceff(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(17),Ceff(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(18),Ceff(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(19),Ceff(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(20),Ceff(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(21),Ceff(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(22),Ceff(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(23),Ceff(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(24),Ceff(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(25),Ceff(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(26),Ceff(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Resistance, Ohm')
ylabel('Capacitance, aF')
text(Reff.*sdvig,Ceff.*sdvig,dn,'FontSize',malkegl)

figure(607)
loglog(Reff,Qeff,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(Reff(1),Qeff(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(2),Qeff(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(3),Qeff(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(4),Qeff(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(5),Qeff(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(6),Qeff(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(7),Qeff(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(8),Qeff(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(9),Qeff(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(10),Qeff(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(11),Qeff(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(12),Qeff(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(13),Qeff(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(14),Qeff(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(15),Qeff(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(16),Qeff(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(17),Qeff(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(18),Qeff(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(19),Qeff(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(20),Qeff(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(21),Qeff(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(22),Qeff(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(23),Qeff(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(24),Qeff(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(25),Qeff(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(Reff(26),Qeff(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Resistance, Ohm')
ylabel('Charge, e')
text(Reff.*sdvig,Qeff.*sdvig,dn,'FontSize',malkegl)

figure(608)
loglog(QQR,Ednat,'o','MarkerFaceColor',marcol,'MarkerEdgeColor','k','MarkerSize',10)
hold on
    loglog(QQR(1),Ednat(1),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(2),Ednat(2),'o','MarkerFaceColor','g','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(3),Ednat(3),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(4),Ednat(4),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(5),Ednat(5),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(6),Ednat(6),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(7),Ednat(7),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(8),Ednat(8),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(9),Ednat(9),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(10),Ednat(10),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(11),Ednat(11),'o','MarkerFaceColor','b','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(12),Ednat(12),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(13),Ednat(13),'o','MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(14),Ednat(14),'o','MarkerFaceColor','y','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(15),Ednat(15),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(16),Ednat(16),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(17),Ednat(17),'o','MarkerFaceColor','c','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(18),Ednat(18),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(19),Ednat(19),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(20),Ednat(20),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(21),Ednat(21),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(22),Ednat(22),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(23),Ednat(23),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(24),Ednat(24),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(25),Ednat(25),'o','MarkerFaceColor','r','MarkerEdgeColor','k','MarkerSize',malkegdot);
    loglog(QQR(26),Ednat(26),'o','MarkerFaceColor','m','MarkerEdgeColor','k','MarkerSize',malkegdot);
hold off
set(gca,'FontSize',malkegl,'FontWeight','bold')
xlabel('Q^2R, h')
ylabel('Energy*delay, h')
text(QQR.*sdvig,Ednat.*sdvig,dn,'FontSize',malkegl)

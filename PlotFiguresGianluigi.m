clc;
close all;
clear all;

% load ../MatFiles/SIM_SURE.mat
% 
% figure(1);
% plot(ErrAmc(:,1),ErrAmc(:,2),'ko','LineWidth',1.2);grid on;hold on
% axis(0.001*[0.4 0.75 0.4 0.75]);
% ax=axis;plot([ax(1) ax(2)],[ax(3) ax(4)],'k','LineWidth',1.1);
% h = findobj(gca,'Type','text');
% set(h,'Fontsize',FSl,'VerticalAlignment','top');
% set(gca,'FontSize',FSy);
% title('$K=Splines$','Fontsize',FSt,'Interpreter','Latex')
% set(h,'Interpreter','Latex')
% xlabel('$Errors \ by \ \hat f_A+Oracle$','Fontsize',FSt,'Interpreter','Latex')
% ylabel('$Errors \ by \ \hat f_A+SURE$','Fontsize',FSt,'Interpreter','Latex')
% print -depsc FigS11
% 
% 
% figure(2);
% plot(ErrBmc(:,1),ErrBmc(:,2),'ko','LineWidth',1.2);grid on;hold on
% axis([0.001  0.018 0.001 0.0180])
% ax=axis;plot([ax(1) ax(2)],[ax(3) ax(4)],'k','LineWidth',1.1);
% h = findobj(gca,'Type','text');
% set(h,'Fontsize',FSl,'VerticalAlignment','top');
% set(gca,'FontSize',FSy);
% title('$K=Splines$','Fontsize',FSt,'Interpreter','Latex')
% set(h,'Interpreter','Latex')
% xlabel('$Errors \ by \ \hat f_B+Oracle$','Fontsize',FSt,'Interpreter','Latex')
% ylabel('$Errors \ by \ \hat f_B+SURE$','Fontsize',FSt,'Interpreter','Latex')
% print -depsc FigS12
% 
% figure(3);
% plot(ErrAmcEx(:,1),ErrAmcEx(:,2),'ko','LineWidth',1.2);grid on;hold on
% axis(0.0001*[0.1000    0.2000    0.1000    0.2000])
% ax=axis;plot([ax(1) ax(2)],[ax(3) ax(4)],'k','LineWidth',1.1);
% h = findobj(gca,'Type','text');
% set(h,'Fontsize',FSl,'VerticalAlignment','top');
% set(gca,'FontSize',FSy);
% title('$K=exponential \ decay$','Fontsize',FSt,'Interpreter','Latex')
% set(h,'Interpreter','Latex')
% xlabel('$Errors \ by \ \hat f_A+Oracle$','Fontsize',FSt,'Interpreter','Latex')
% ylabel('$Errors \ by \ \hat f_A+SURE$','Fontsize',FSt,'Interpreter','Latex')
% print -depsc FigS21
% 
% figure(4);
% plot(ErrBmcEx(:,1),ErrBmcEx(:,2),'ko','LineWidth',1.2);grid on;hold on
% axis([0.0023 0.0154 0.0023 0.0154])
% ax=axis;plot([ax(1) ax(2)],[ax(3) ax(4)],'k','LineWidth',1.1);
% h = findobj(gca,'Type','text');
% set(h,'Fontsize',FSl,'VerticalAlignment','top');
% set(gca,'FontSize',FSy);
% title('$K=exponential \ decay$','Fontsize',FSt,'Interpreter','Latex')
% xlabel('$Errors \ by \ \hat f_B+Oracle$','Fontsize',FSt,'Interpreter','Latex')
% ylabel('$Errors \ by \ \hat f_B+SURE$','Fontsize',FSt,'Interpreter','Latex')
% print -depsc FigS22
% 
% 
% MatlabToTikZ.ExportLineplot(					...
% 	'../../ArticleJournal/Data/BoundsGianluigi/ScatterPlotsSURE.txt',	...
% 	[	ErrAmc(:,1),							...
% 		ErrAmc(:,2),							...
% 		ErrBmc(:,1),							...
% 		ErrBmc(:,2),							...
% 		ErrAmcEx(:,1),							...
% 		ErrAmcEx(:,2),							...
% 		ErrBmcEx(:,1),							...
% 		ErrBmcEx(:,2)	],						...
% 	[	{'ErrAmc1'},							...
% 		{'ErrAmc2'},							...
% 		{'ErrBmc1'},							...
% 		{'ErrBmc2'},							...
% 		{'ErrAmcEx1'},							...
% 		{'ErrAmcEx2'},							...
% 		{'ErrBmcEx1'},							...
% 		{'ErrBmcEx2'}	], 1, 8); % sampling period & precision
% 


clc;
clear all;
close all;
% load ../MatFiles/SIM_Bound.mat
load ../MatFiles/SIM_NewBound.mat

figure(1);
lab='$K=Splines$';
semilogx(mean(ErrA)/sum(lspline),'k','LineWidth',2);hold on
semilogx(BndA/sum(lspline),'k--','LineWidth',2);grid on
semilogx((sum(lspline)-cumsum(lspline))/sum(lspline),'k:','LineWidth',2);
axis([0 200 0 0.21]);
h = findobj(gca,'Type','text');
set(h,'Fontsize',FSl,'VerticalAlignment','top');
set(gca,'FontSize',FSy);
title(lab,'Fontsize',FSt,'Interpreter','Latex')
h=legend('$True \ Error$','$Bnd_A(E)/\sum_e \lambda_e$','$Lower \ Bound$')
set(h,'Interpreter','Latex')
set(h,'Fontsize',LegFont)
xlabel('$E$','Fontsize',FSt,'Interpreter','Latex')
print -depsc Fig11

MatlabToTikZ.ExportLineplot(										...
	'../../ArticleJournal/Data/BoundsGianluigi/BoundsKSplinesA.txt',...
	[	(1:numel(lspline))',											...
		(mean(ErrA)/sum(lspline))',									...
		(BndA/sum(lspline))',										...
		((sum(lspline)-cumsum(lspline))/sum(lspline))'	],			...
	[	{'E'},														...
		{'TrueError'},												...
		{'NormalizedBound'},										...
		{'LowerBound'}		]);

figure(2);
semilogx(mean(ErrB)/sum(lspline),'k','LineWidth',1.5);hold on
semilogx(BndB/sum(lspline),'k--','LineWidth',2);grid on
semilogx((sum(lspline)-cumsum(lspline))/sum(lspline),'k:','LineWidth',2);
axis([0 200 0 0.21]);
h = findobj(gca,'Type','text');
set(h,'Fontsize',FSl,'VerticalAlignment','top');
set(gca,'FontSize',FSy);
title(lab,'Fontsize',FSt,'Interpreter','Latex')
h=legend('$True \ Error$','$Bnd_B(E)/\sum_e \lambda_e$','$Lower \ Bound$')
set(h,'Interpreter','Latex')
set(h,'Fontsize',LegFont)
xlabel('$E$','Fontsize',FSt,'Interpreter','Latex')
print -depsc Fig12

MatlabToTikZ.ExportLineplot(										...
	'../../ArticleJournal/Data/BoundsGianluigi/BoundsKSplinesB.txt',...
	[	(1:numel(lspline))',										...
		(mean(ErrB)/sum(lspline))',									...
		(BndB/sum(lspline))',										...
		((sum(lspline)-cumsum(lspline))/sum(lspline))'	],			...
	[	{'E'},														...
		{'TrueError'},												...
		{'NormalizedBound'},										...
		{'LowerBound'}		]);
  
figure(3);
lab='$K=exponential \ decay$';
semilogx(mean(ErrAex)/sum(l),'k','LineWidth',2);hold on
semilogx(BndAex/sum(l),'k--','LineWidth',2);grid on
semilogx((sum(l)-cumsum(l))/sum(l),'k:','LineWidth',2);
axis([0 200 0 1]);
h = findobj(gca,'Type','text');
set(h,'Fontsize',FSl,'VerticalAlignment','top');
set(gca,'FontSize',FSy);
title(lab,'Fontsize',FSt,'Interpreter','Latex')
h=legend('$True \ Error$','$Bnd_A(E)/\sum_e \lambda_e$','$Lower \ Bound$')
set(h,'Interpreter','Latex')
set(h,'Fontsize',LegFont)
xlabel('$E$','Fontsize',FSt,'Interpreter','Latex')
print -depsc Fig21
 
MatlabToTikZ.ExportLineplot(										...
	'../../ArticleJournal/Data/BoundsGianluigi/BoundsKExponentialA.txt',...
	[	(1:numel(l))',												...
		(mean(ErrAex)/sum(l))',										...
		(BndAex/sum(l))',											...
		((sum(l)-cumsum(l))/sum(l))'	],							...
	[	{'E'},														...
		{'TrueError'},												...
		{'NormalizedBound'},										...
		{'LowerBound'}		]);

 
figure(4);
semilogx(mean(ErrBex)/sum(l),'k','LineWidth',1.5);hold on
semilogx(BndBex/sum(l),'k--','LineWidth',2);grid on
semilogx((sum(l)-cumsum(l))/sum(l),'k:','LineWidth',2);
axis([0 200 0 1]);
h = findobj(gca,'Type','text');
set(h,'Fontsize',FSl,'VerticalAlignment','top');
set(gca,'FontSize',FSy);
title(lab,'Fontsize',FSt,'Interpreter','Latex')
h=legend('$True \ Error$','$Bnd_B(E)/\sum_e \lambda_e$','$Lower \ Bound$')
set(h,'Interpreter','Latex')
set(h,'Fontsize',LegFont)
xlabel('$E$','Fontsize',FSt,'Interpreter','Latex')
print -depsc Fig22

MatlabToTikZ.ExportLineplot(										...
	'../../ArticleJournal/Data/BoundsGianluigi/BoundsKExponentialB.txt',...
	[	(1:numel(l))',												...
		(mean(ErrBex)/sum(l))',										...
		(BndBex/sum(l))',											...
		((sum(l)-cumsum(l))/sum(l))'	],							...
	[	{'E'},														...
		{'TrueError'},												...
		{'NormalizedBound'},										...
		{'LowerBound'}		]);


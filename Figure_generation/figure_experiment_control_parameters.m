clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Experiment_control_parameters');

figure('units','normalized','outerposition',[0 0 1 1]);
p=16;

load('SAD_RMSE_KbSNMF_fnorm.mat');
subplot(3,2,[1,3]);
[gamma,theta] = meshgrid(range1,range2);
s1=surf(gamma,theta,SADall');
set(gca,'FontSize',p);
xlabel('\gamma'); ylabel('\theta','FontSize',p); zlabel('SAD');
grid on;
colorbar;
cb = colorbar;
% set(gca,'FontSize',16);
% set(cb,'Position',[0.5 0.5 .02 0.5])% To change size
% s1.EdgeColor = 'none';
t = title('(a)', 'Units', 'normalized', 'Position', [0.59, -0.25, 0]);
hold on;
myeps=0.01;
plot3(range1(4),range2(5),SADall(4,5)+myeps,'ro');
plot3(range1(4),range2(5),SADall(4,5)+myeps,'r*');
zlim([0 1]); caxis([0 1]);

load('SAD_RMSE_KbSNMF_div.mat');
subplot(3,2,[2,4]);
[gamma,theta] = meshgrid(range1,range2);
s1=surf(gamma,theta,SADall');
set(gca,'FontSize',p);
xlabel('\gamma'); ylabel('\theta','FontSize',p); zlabel('SAD');
grid on;
colorbar;
% s1.EdgeColor = 'none';
t = title('(b)', 'Units', 'normalized', 'Position', [0.59, -0.25, 0]);
hold on;
myeps=0.01;
plot3(range1(9),range2(5),SADall(9,5)+myeps,'ro');
plot3(range1(9),range2(5),SADall(9,5)+myeps,'r*');
zlim([0 1]); caxis([0 1]);

%print('-r300','-depsc2', 'control_parameters');

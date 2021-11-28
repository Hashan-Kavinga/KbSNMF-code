clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm');

load('Variables_KbSNMF_fnorm_gamma_300_E-2_theta_40_E-2.mat');
p=12; %font size

figure('units','normalized','outerposition',[0 0 1 1]);

subplot(3,2,1); 
plot(obj_fun,'lineWidth',1); grid on;
xlabel({'iteration';'{\bf(a)}'}); ylabel({'objective function';'||{\bfX}-{\bfAMS}||_F^2 - \gammaK_{avg}({\bfA})'}); 
set(gca,'FontSize',p) ; ylim([-inf 3000]);
subplot(3,2,5); 
plot(smooth_fnorm,'lineWidth',1); grid on;
xlabel({'iteration';'{\bf(e)}'}); ylabel({'frobenius norm';'squared';'||{\bfX}-{\bfAMS}||_F^2'}); 
set(gca,'FontSize',p); ylim([-inf 3000]);
subplot(3,2,3); 
plot(avg_kurt,'lineWidth',1); grid on;
xlabel({'iteration';'{\bf(c)}'}); ylabel({'average kurtosis';'K_{avg}({\bfA})'}); 
set(gca,'FontSize',p); ylim([2 3.5]);

clear;
load('Variables_KbSNMF_div_gamma_800_E-2_theta_40_E-2.mat')
p=12; %font size

subplot(3,2,2);
plot(obj_fun,'lineWidth',1); grid on;
xlabel({'iteration';'{\bf(b)}'}); ylabel({'objective function';'D({\bfX}||{\bfAMS}) - \gammaK_{avg}({\bfA})'}); 
set(gca,'FontSize',p); ylim([-inf 3000]);
subplot(3,2,6); 
plot(smooth_div,'lineWidth',1); grid on; 
xlabel({'iteration';'{\bf(f)}'}); ylabel({'divergence';'D({\bfX}||{\bfAMS})'}); 
set(gca,'FontSize',p); ylim([-inf 3000]);
subplot(3,2,4); 
plot(avg_kurt,'lineWidth',1); grid on;
xlabel({'iteration';'{\bf(d)}'}); ylabel({'average kurtosis';'K_{avg}({\bfA})'}); 
set(gca,'FontSize',p); ylim([2 3.5]);

% print('-r300','-depsc2', 'convergence_KbSNMF');

clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Experiment_endmembers');

figure('units','normalized','outerposition',[0 0 1 1]);
p=16;

%% SAD
load('endmembers_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[1,2,6,7]); 
plot(SADall,'ro-','LineWidth',1); hold on;

load('endmembers_SAD_RMSE_KbNMF_div.mat');
plot(SADall,'gx-','LineWidth',1);

load('endmembers_SAD_RMSE_L_1_2_NMF.mat');
plot(SADall,'b+-','LineWidth',1);

load('endmembers_SAD_RMSE_SGSNMF.mat');
plot(SADall,'c*-','LineWidth',1);

load('endmembers_SAD_RMSE_Min_vol_NMF.mat');
plot(SADall,'ms-','LineWidth',1);

load('endmembers_SAD_RMSE_R_CoNMF.mat')
plot(SADall,'yd-','LineWidth',1);

load('endmembers_SAD_RMSE_GNMF.mat');
plot(SADall,'kv-','LineWidth',1);

grid on;
xticks([1:1:8]);
xticklabels(num2cell(krange));
xlabel({'no. of endmembers';'{\bf(a)}'}); ylabel('SAD','FontSize',p);
set(gca,'FontSize',p); xlim([1 8]);

%% RMSE

load('endmembers_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[4,5,9,10]); 
plot(RMSEall,'ro-','LineWidth',1); hold on;

load('endmembers_SAD_RMSE_KbNMF_div.mat');
plot(RMSEall,'gx-','LineWidth',1);

load('endmembers_SAD_RMSE_L_1_2_NMF.mat');
plot(RMSEall,'b+-','LineWidth',1);

load('endmembers_SAD_RMSE_SGSNMF.mat');
plot(RMSEall,'c*-','LineWidth',1);

load('endmembers_SAD_RMSE_Min_vol_NMF.mat');
plot(RMSEall,'ms-','LineWidth',1);

load('endmembers_SAD_RMSE_R_CoNMF.mat')
plot(RMSEall,'yd-','LineWidth',1);

load('endmembers_SAD_RMSE_GNMF.mat');
plot(RMSEall,'kv-','LineWidth',1);

grid on;
xticks([1:1:8]);
xticklabels(num2cell(krange));
xlabel({'no. of endmembers';'{\bf(b)}'}); ylabel('RMSE','FontSize',p);
set(gca,'FontSize',p); xlim([1 8]);

legend('KbSNMF-fnorm','KbSNMF-div','{\itl_{1/2}}-NMF','SGSNMF','Min-vol NMF','R-CoNMF','GNMF','Location',[.5 0.67 0 0]);

%print('-r300','-depsc2', 'endmembers');

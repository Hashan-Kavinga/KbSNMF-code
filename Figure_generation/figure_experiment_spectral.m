clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Experiment_spectral');

figure('units','normalized','outerposition',[0 0 1 1]);
p=16;

%% SAD
load('spectral_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[1,2,6,7]); 
plot(1:length(SADall),SADall,'ro-','LineWidth',1); hold on;

load('spectral_SAD_RMSE_KbNMF_div.mat');
plot(1:length(SADall),SADall,'gx-','LineWidth',1);

load('spectral_SAD_RMSE_L_1_2_NMF.mat');
plot(1:length(SADall),SADall,'b+-','LineWidth',1);

load('spectral_SAD_RMSE_SGSNMF.mat');
plot(1:length(SADall),SADall,'c*-','LineWidth',1);

load('spectral_SAD_RMSE_Min_vol_NMF.mat');
plot(1:length(SADall),SADall,'ms-','LineWidth',1);

load('spectral_SAD_RMSE_R_CoNMF.mat')
plot(1:length(SADall),SADall,'yd-','LineWidth',1);

load('spectral_SAD_RMSE_GNMF.mat');
plot(1:length(SADall),SADall,'kv-','LineWidth',1);

grid on;
xticks([1:2:15]); xlim([1 15]);

xticklabels(num2cell(spectralrange(1:2:15)));
xlabel({'no. of spectral bands';'{\bf(a)}'}); ylabel('SAD','FontSize',p);
set(gca,'FontSize',p)

%% RMSE

load('spectral_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[4,5,9,10]);
plot(1:length(RMSEall),RMSEall,'ro-','LineWidth',1); hold on;

load('spectral_SAD_RMSE_KbNMF_div.mat');
plot(1:length(RMSEall),RMSEall,'gx-','LineWidth',1);

load('spectral_SAD_RMSE_L_1_2_NMF.mat');
plot(1:length(RMSEall),RMSEall,'b+-','LineWidth',1);

load('spectral_SAD_RMSE_SGSNMF.mat');
plot(1:length(RMSEall),RMSEall,'c*-','LineWidth',1);

load('spectral_SAD_RMSE_Min_vol_NMF.mat');
plot(1:length(RMSEall),RMSEall,'ms-','LineWidth',1);

load('spectral_SAD_RMSE_R_CoNMF.mat')
plot(1:length(RMSEall),RMSEall,'yd-','LineWidth',1);

load('spectral_SAD_RMSE_GNMF.mat');
plot(1:length(RMSEall),RMSEall,'kv-','LineWidth',1);

grid on;
xticks([1:2:15]);  xlim([1 15]);
xticklabels(num2cell(spectralrange));
xlabel({'no. of spectral bands';'{\bf(b)}'}); ylabel('RMSE','FontSize',p);
set(gca,'FontSize',p);

legend('KbSNMF-fnorm','KbSNMF-div','{\itl_{1/2}}-NMF','SGSNMF','Min-vol NMF','R-CoNMF','GNMF','Location',[.5 0.67 0 0]);

%print('-r300','-depsc2', 'spectral');

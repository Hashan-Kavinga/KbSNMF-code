clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Experiment_noisy');

figure('units','normalized','outerposition',[0 0 1 1]);
p=16;

%% SAD
load('noisy_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[1,2,6,7]); 
plot(SNRrange,SADall,'ro-','LineWidth',1); hold on;

load('noisy_SAD_RMSE_KbNMF_div.mat');
plot(SNRrange,SADall,'gx-','LineWidth',1);

load('noisy_SAD_RMSE_L_1_2_NMF.mat');
plot(SNRrange,SADall,'b+-','LineWidth',1);

load('noisy_SAD_RMSE_SGSNMF.mat');
plot(SNRrange,SADall,'c*-','LineWidth',1);

load('noisy_SAD_RMSE_Min_vol_NMF.mat');
plot(SNRrange,SADall,'ms-','LineWidth',1);

load('noisy_SAD_RMSE_R_CoNMF.mat')
plot(SNRrange,SADall,'yd-','LineWidth',1);

load('noisy_SAD_RMSE_GNMF.mat');
plot(SNRrange,SADall,'kv-','LineWidth',1);

grid on;
xlabel({'SNR (dB)';'{\bf(a)}'}); ylabel('SAD','FontSize',p);
set(gca,'FontSize',p)

%% RMSE

load('noisy_SAD_RMSE_KbNMF_fnorm.mat');
subplot(3,5,[4,5,9,10]); 
plot(SNRrange,RMSEall,'ro-','LineWidth',1); hold on;

load('noisy_SAD_RMSE_KbNMF_div.mat');
plot(SNRrange,RMSEall,'gx-','LineWidth',1);

load('noisy_SAD_RMSE_L_1_2_NMF.mat');
plot(SNRrange,RMSEall,'b+-','LineWidth',1);

load('noisy_SAD_RMSE_SGSNMF.mat');
plot(SNRrange,RMSEall,'c*-','LineWidth',1);

load('noisy_SAD_RMSE_Min_vol_NMF.mat');
plot(SNRrange,RMSEall,'ms-','LineWidth',1);

load('noisy_SAD_RMSE_R_CoNMF.mat')
plot(SNRrange,RMSEall,'yd-','LineWidth',1);

load('noisy_SAD_RMSE_GNMF.mat');
plot(SNRrange,RMSEall,'kv-','LineWidth',1);

grid on;
xlabel({'SNR (dB)';'{\bf(b)}'}); ylabel('RMSE','FontSize',p);
set(gca,'FontSize',p)

legend('KbSNMF-fnorm','KbSNMF-div','{\itl_{1/2}}-NMF','SGSNMF','Min-vol NMF','R-CoNMF','GNMF','Location',[.5 0.67 0 0]);

%print('-r300','-depsc2', 'SNR');

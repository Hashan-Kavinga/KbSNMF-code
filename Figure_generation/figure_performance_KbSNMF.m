clear; close all; clc;
figure('units','normalized','outerposition',[0 0 1 1]);

%% font size
p = 8;

%% ground truth
load('dataset_simulated.mat');
[n,m] = size(X);
k = size(W,2);

W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[1]
subplot(4,6,1);
plot(W_n(:,1),'b-' ,'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

%[19]
subplot(4,6,19);
imagesc(H_r(:,:,1),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[2]
subplot(4,6,2);
plot(W_n(:,2),'b-' ,'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

%[20]
subplot(4,6,20);
imagesc(H_r(:,:,2),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[3]
subplot(4,6,3);
plot(W_n(:,3),'b-' ,'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

%[21]
subplot(4,6,21);
imagesc(H_r(:,:,3),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%% KbSNMF-fnorm
clear;
load('Variables_KbSNMF_fnorm_gamma_300_E-2_theta_40_E-2.mat');
W = A_s;
H = S_s;
[n,m] = size(X);
k = size(W,2);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[1]
subplot(4,6,1); hold on;
plot(W_n(:,1),'r','lineWidth',1);

%[7]
subplot(4,6,7);
imagesc(H_r(:,:,1),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[2]
subplot(4,6,2); hold on;
plot(W_n(:,2),'r','lineWidth',1);

%[7]
subplot(4,6,8);
imagesc(H_r(:,:,2),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[3]
subplot(4,6,3); hold on;
plot(W_n(:,3),'r','lineWidth',1);

%[9]
subplot(4,6,9);
imagesc(H_r(:,:,3),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%% KbSNMF-div
clear;
load('Variables_KbSNMF_div_gamma_800_E-2_theta_40_E-2.mat');
W = A_s;
H = S_s;
[n,m] = size(X);
k = size(W,2);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[1]
subplot(4,6,1); hold on;
plot(W_n(:,1),'m','lineWidth',1);

%[13]
subplot(4,6,13);
imagesc(H_r(:,:,1),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[2]
subplot(4,6,2); hold on;
plot(W_n(:,2),'m','lineWidth',1);

%[14]
subplot(4,6,14);
imagesc(H_r(:,:,2),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%[3]
subplot(4,6,3); hold on;
plot(W_n(:,3),'m','lineWidth',1);

%[15]
subplot(4,6,15);
imagesc(H_r(:,:,3),[0 1]);
% xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

%%
% print('-r300','-depsc2', 'synthetic_dataset');


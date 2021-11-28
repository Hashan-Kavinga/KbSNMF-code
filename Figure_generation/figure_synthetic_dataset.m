clear; close all; clc;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Datasets');

%% load dataset
load('dataset_simulated.mat')
% load('samson.mat');

%% obtain dimensions
[n,m] = size(X);
k = size(W,2);
p = 16;

% plot ground truth
figure('units','normalized','outerposition',[0 0 1 1]);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);
labels = {"seawater","clintonite","sodiumbicarbonate"};

i=1;
subplot(2,k,1);
plot(W_n(:,i),'lineWidth',1);
grid on;
xlabel({'spectral bands';'{\bf(a)}'});
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
subplot(2,k,i+k);
imagesc(H_r(:,:,i));
xlabel('{\bf(d)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',p);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

i=2;
subplot(2,k,i);
plot(W_n(:,i),'lineWidth',1);
grid on;
xlabel({'spectral bands';'{\bf(b)}'});
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
subplot(2,k,i+k);
imagesc(H_r(:,:,i));
xlabel('{\bf(e)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',p);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

i=3;
subplot(2,k,i);
plot(W_n(:,i),'lineWidth',1);
grid on;
xlabel({'spectral bands';'{\bf(c)}'});
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
subplot(2,k,i+k);
imagesc(H_r(:,:,i));
xlabel('{\bf(f)}');
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',p);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colorbar;

% print('-r300','-depsc2', 'simulated_dataset');


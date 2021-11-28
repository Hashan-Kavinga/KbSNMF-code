 close all;
 figure('units','normalized','outerposition',[0 0 1 1]);
 clear;
% font size
p = 8; x= 0.147; y=0.295;
a = 3; b = 3; pos = 0; t = 0.29;
% ground truth
load('dataset_real_samson.mat');
[n,m] = size(X);
k = size(W,2);

W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[1]
h1 = subplot(a,b,1);
imagesc(H_r(:,:,1),[0 1]);
set(h1,'Position',[0 0.7 t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

%[2]
h2 = subplot(a,b,2);
imagesc(H_r(:,:,2),[0 1]);
set(h2,'Position',[0+x 0.7 t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;
%
%[21]
h3 = subplot(a,b,3);
imagesc(H_r(:,:,3),[0 1]);
set(h3,'Position',[0+x+x 0.7 t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

% KbSNMF-fnorm
load('Variables_KbSNMF_fnorm_samson_gamma_300_E-2_theta_10_E-2.mat');
W = A_s;
H = S_s;
[n,m] = size(X);
k = size(W,2);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[7]
h4 = subplot(a,b,4);
imagesc(H_r(:,:,1),[0 1]);
set(h4,'Position',[0 0.7-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;
%
%[7]
h5 = subplot(a,b,5);
imagesc(H_r(:,:,2),[0 1]);
set(h5,'Position',[0+x 0.7-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

%[9]
h6 = subplot(a,b,6);
imagesc(H_r(:,:,3),[0 1]);
set(h6,'Position',[0+x+x 0.7-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

% KbSNMF-div

load('Variables_KbSNMF_div_samson_gamma_800_E-2_theta_20_E-2.mat');
W = A_s;
H = S_s;
[n,m] = size(X);
k = size(W,2);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

%[13]
h7 = subplot(a,b,7);
imagesc(H_r(:,:,1),[0 1]);
set(h7,'Position',[0 0.7-y-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

%[14]
h8 = subplot(a,b,8);
imagesc(H_r(:,:,2),[0 1]);
set(h8,'Position',[0+x 0.7-y-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

%[15]
h9 = subplot(a,b,9);
imagesc(H_r(:,:,3),[0 1]);
set(h9,'Position',[0+x+x 0.7-y-y t t]);
axis equal;
axis([1 sqrt(m) 1 sqrt(m)]);
set(gca,'FontSize',12);
set(gca,'xtick',[]);
set(gca,'xticklabel',[]);
set(gca,'ytick',[]);
set(gca,'yticklabel',[]);
colormap;

cb = colorbar;
set(gca,'FontSize',16);

%%
set(cb,'Position',[0+x+x+x+x/2+0.02 0.7-y-y .02 .88])% To change size
%%
% print('-r300','-depsc2', 'performance_samson_abundance');


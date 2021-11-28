clear; close all;

restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm');
addpath('D:\GRAD\EE408HSI\Algorithm\Datasets');


figure('units','normalized','outerposition',[0 0 1 1]);

% font size
p = 16; x= 0.16; y=0.32;
a = 2; b = 3; c = [1]; d = [2]; e = [3];

% ground truth
load('dataset_simulated.mat');
[n,m] = size(X);
k = size(W,2);
W_n = zscore(W);
H_r = reshape(H',sqrt(m),sqrt(m),k);

subplot(a,b,c);
plot(W_n(:,1),'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

subplot(a,b,d);
plot(W_n(:,2),'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

subplot(a,b,e);
plot(W_n(:,3),'lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

%%

load('Variables_KbSNMF_fnorm_gamma_300_E-2_theta_40_E-2.mat');
[n,m] = size(X);
k = size(W,2);
W_n = zscore(A_s);
H_r = reshape(S_s',sqrt(m),sqrt(m),k);

subplot(a,b,c); hold on;
plot(W_n(:,1),'r-.','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

subplot(a,b,d); hold on;
plot(W_n(:,2),'r-.','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

subplot(a,b,e); hold on;
plot(W_n(:,3),'r-.','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);

%%

load('Variables_KbSNMF_div_gamma_800_E-2_theta_40_E-2.mat');
[n,m] = size(X);
k = size(W,2);
W_n = zscore(A_s);
H_r = reshape(S_s',sqrt(m),sqrt(m),k);

subplot(a,b,c); hold on;
plot(W_n(:,1),'g--','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
% legend('ground truth','KbNMF-fnorm','KbNMF-div');

subplot(a,b,d); hold on;
plot(W_n(:,2),'g--','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
% legend('ground truth','KbNMF-fnorm','KbNMF-div');

subplot(a,b,e); hold on;
plot(W_n(:,3),'g--','lineWidth',1);
grid on;
xlabel('spectral bands');
ylabel('normalized reflectance');
set(gca,'FontSize',p);
axis([1 n -3 3]);
%%
legend('ground truth','KbSNMF-fnorm','KbSNMF-div','Orientation','horizontal','Location',[0.5 .97 0 0]);

%%
% print('-r300','-depsc2', 'performance_simulated_endmember');


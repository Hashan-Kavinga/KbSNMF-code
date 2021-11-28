clear; close all; clc;

%% add path
restoredefaultpath;
addpath('D:\GRAD\EE408HSI\Algorithm\Datasets'); 

%% load dataset
load('dataset_real_urban.mat')
% load('dataset_simulated.mat')

%% obtain dimensions
[n,m] = size(X);
k = size(W,2);

%% plot ground truth
% figure('units','normalized','outerposition',[0 0 1 1]);
% W_n = zscore(W);
% H_r = reshape(H',sqrt(m),sqrt(m),k);
% labels = {"seawater","clintonite","sodiumbicarbonate"};
% 
% for i=1:k
%     subplot(2,k,i);
%     plot(W_n(:,i),'lineWidth',1);
%     grid on;
%     xlabel('spectral bands');
%     ylabel('normalized reflectance');
%     set(gca,'FontSize',16);
%     title(labels(i));
%     axis([1 n -3 3]);
%     
%     subplot(2,k,i+k);
%     imagesc(H_r(:,:,i));
%     axis equal;
%     axis([1 sqrt(m) 1 sqrt(m)]);
%     set(gca,'FontSize',16);
%     set(gca,'xtick',[]);
%     set(gca,'xticklabel',[]);
%     set(gca,'ytick',[]);
%     set(gca,'yticklabel',[]);
% end

%% set parameters
tmax = 1000;
Cmin = 10^-5;
[A_init,S_init] = NNDSVD(X,k);

gamma_range = 3;
theta_range = 0.1;

%% run algorithm
for gamma = gamma_range
    for theta = theta_range
        
        %alter gamma for print/save purposes
        gamma_print = round(gamma*100);
        theta_print = round(theta*100);
        
        %run algorithm
        [A,S,avg_kurt,smooth_fnorm,obj_fun,C,time] = KbSNMF_fnorm(X,A_init,S_init,tmax,Cmin,gamma,theta);
        
        %match pairs
        A_n = (A-repmat(mean(A),n,1))./repmat(std(A),n,1) ;
        S_n = S./repmat(sum(S),k,1);
        W_n = (W-repmat(mean(W),n,1))./repmat(std(W),n,1);
        H_n = H./repmat(sum(H),k,1);
        [A_s,S_s,W_s,H_s]=match_pairs(A_n,S_n,W_n,H_n);
        
        %evaluate performance
        [SAD,RMSE,Kurtosis] = performance_eval(A_s,S_s,W_s,H_s);
        
        %save variables
      save(sprintf('Variables_KbSNMF_fnorm_gamma_%d_E-2_theta_%d_E-2',gamma_print,theta_print),'SAD','RMSE');
    end
end

fprintf('\nHyperspectral Unmixing Performance\n----------------------------------\nSAD = %.4f | RMSE = %.4f\n',SAD,RMSE);


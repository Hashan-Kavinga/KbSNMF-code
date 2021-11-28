clear; close all;

addpath(genpath('D:\GRAD\EE408HSI\Algorithm')); %add all paths in the Algorithm folder

load('dataset_real_samson.mat');
% load('dataset_simulated.mat')

%% obtain dimensions
[n,m] = size(X);
k = size(W,2);

%% visualize
theta_range = [0,0.2,0.5,0.8,1];
endmember = 1;
xlabels=["a","b","c","d","e"];

figure('units','normalized','outerposition',[0 0 1 1]);

for i = 1:length(theta_range)
    
    theta = theta_range(i);
    M = (1-theta)*eye(k) + (theta/k)*ones(k);
    Y = M*H;
    Yt = reshape(Y,k,sqrt(m),sqrt(m));
    
    subplot(1,length(theta_range)*2,[2*i-1, 2*i]);
    i
    imagesc(squeeze(Yt(endmember,:,:)),[0 1]);
    axis equal;
    colorbar;
    axis([1-0.5 sqrt(m)+0.5 1-0.5 sqrt(m)+0.5]);
    set(gca,'xtick',[]);
    set(gca,'xticklabel',[]);
    set(gca,'ytick',[]);
    set(gca,'yticklabel',[]);
    set(gca,'FontSize',16);

    switch i
        case 1
             xlabel('{\bf(a)}')
        case 2
             xlabel('{\bf(b)}')
        case 3
             xlabel('{\bf(c)}')
        case 4
             xlabel('{\bf(d)}')
        case 5
             xlabel('{\bf(e)}')
    end
    
    
    
end

%print('-r300','-depsc2', 'smoothing');

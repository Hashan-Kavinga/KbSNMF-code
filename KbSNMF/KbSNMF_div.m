function [A,S,avg_kurt,smooth_div,obj_fun,C,time] = KbSNMF_div(X,A_init,S_init,tmax,Cmin,gamma,theta)

% Author : Mevan Ekanayake (mevanekanayake@gmail.com)
% Title  : Kurtosis based Smooth NMF based on divergence (KbSNMF-div)
% Last modified : 12/02/2020

% Inputs :  (1) X = The HSI dataset - n x m matrix (n = no. of spectral bands, m = no. of pixels)
%           (2) A_init = initial endmember matrix - n x k matrix (n = no. of spectral bands, k = no. of endmembers)
%           (3) S_init = initial abundance matrix - k x m matrix (k = no. of endmembers, m = no. of pixels)
%           (4) tmax = no. of maximum iterations that the algorithm runs before termination
%           (5) Cmin = minimum rate of change in the objective function before termination of the algorithm
%           (6) gamma = trade-off between the objective function and average kurtosis constraint
%           (7) theta = smoothing parameter which controls the extent of smoothness in S

% Outputs : (1) A = estimated endmember matrix - n x k matrix (n = no. of spectral bands, k = no. of endmembers)
%           (2) S = estimated abundance matrix - k x m matrix (k = no. of endmembers, m = no. of pixels)
%           (3) avg_kurt = a vector containing average kurtosis of endmembers estimated at each iteration
%           (4) smooth_div = a vector containing values of the smooth divergence of X from estimated AS
%           (5) obj_fun = a vector containing values of the objective function at each iteration
%           (6) C = a vector containing values of the rate of change in the objective function at each iteration
%           (7) t = time elapsed for the algorithm

%% set local options
[n,k] = size(A_init);
m = size(S_init,2);
myeps = 1e-16;
gamma_ = (-2*gamma)/(n*k);
N = eye(n)-ones(n,n)/n;
M = (1-theta)*eye(k) + (theta/k)*ones(k);

%% initialize
A = A_init;
S = S_init;
iter = 0;
avg_kurt = [];
smooth_div = [];
obj_fun = [];
C = [];
time = 0;

%normalize A w.r.t std
A = A./repmat(std(A),n,1);

%% initialize rate of of change in objective the function
Lt2 = 10^9;
Lt1 = 10^10;

%% print initial info
fprintf('KbSNMF-div: started ...\nmy_mu_euc: Iteration = 0000\n');

%% main loop
while iter<tmax && (abs(Lt1-Lt2)/abs(Lt1))>Cmin
    
    %start time
    tic;
    
    %update A
    MS = M*S;
    A = max(myeps,(A.*(((X./(A*MS))*MS')./(ones(n,m)*MS'+gamma_*N*(N*A).^3))));

    %normalize A w.r.t std
    A = A./repmat(std(A),n,1);
    
    %update S
    AM = A*M;
    S = max(myeps,(S.*(AM'*(X./(AM*S)))./(AM'*ones(n,m))));
    
    %stop time
    time = time+toc;
    
    %update variables
    iter = iter + 1;
    avg_kurt(iter) = mean(kurtosis(A));
    smooth_div(iter) = nansum(nansum(X.*log10(X./(A*M*S))-X+A*M*S));
    obj_fun(iter) = smooth_div(iter)-gamma*avg_kurt(iter);
    
    %compute rate of change in objective function
    Lt2 = obj_fun(iter);
    if iter~=1
        Lt1 = obj_fun(iter-1);
    end
    C(iter) = abs(Lt1-Lt2)/abs(Lt1);
    
    %print iteration updates
    fprintf('iter = %04d, avg_kurt = %.4e, smooth_div = %.4e, obj_fun = %.4e, C = %.4e\n',iter,avg_kurt(iter),smooth_div(iter),obj_fun(iter),C(iter));
    
    %Negative value ERROR!
    if sum(sum(A<0))>0
        fprintf('ERROR: Negative elements occured in A');
        break
    end
    if sum(sum(S<0))>0
        fprintf('ERROR: Negative elements occured in S');
        break
    end
end

%% amending the first element of the rate of change in objective function vector
C(1) = nan;

end

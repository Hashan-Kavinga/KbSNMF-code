function [W,H] = my_NNDSVD(V,r)

%size of the input matrix
[m,n] = size(V);

%the matrices of the factorization
W = zeros(m,r);
H = zeros(r,n);

% 1st SVD --> partial SVD rank-k to the input matrix A.
V=abs(V);
[U,S,V] = svds(V,r);

%choose the first singular triplet to be nonnegative
W(:,1)     =  sqrt(S(1,1)) * abs(U(:,1) );
H(1,:)     =  sqrt(S(1,1)) * abs(V(:,1)');


% 2nd SVD for the other factors (see table 1 in our paper)
for i=2:r
    uu = U(:,i); vv = V(:,i);
    uup = pos(uu); uun = neg(uu) ;
    vvp = pos(vv); vvn = neg(vv);
    n_uup = norm(uup);
    n_vvp = norm(vvp) ;
    n_uun = norm(uun) ;
    n_vvn = norm(vvn) ;
    termp = n_uup*n_vvp; termn = n_uun*n_vvn;
    if (termp >= termn)
        W(:,i) = sqrt(S(i,i)*termp)*uup/n_uup;
        H(i,:) = sqrt(S(i,i)*termp)*vvp'/n_vvp;
    else
        W(:,i) = sqrt(S(i,i)*termn)*uun/n_uun;
        H(i,:) = sqrt(S(i,i)*termn)*vvn'/n_vvn;
    end
end

%actually these numbers are zeros
W((W<0.0000000001))=0.1;
H((H<0.0000000001))=0.1;

end

%This function sets to zero the negative elements of a matrix
function [Ap] = pos(A)
Ap = (A>=0).*A;
end

%This functions sets to zero the positive elements of a matrix and takes
%the absolute value of the negative elements
function [Am] = neg(A)
Am = (A<0).*(-A);
end

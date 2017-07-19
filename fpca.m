function [p] = fpca(specmusic,K)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    
    %for k = 1:length(K(:,1))
    for k = 1:1
        %Split the vector
        specm = specmusic(:,K(k,1):K(k,2));
        %Get mean value
        mu = mean(specm,2);
        mu = repmat(mu,1,length(K(k,1):K(k,2)));
        specm = specm - mu;
        %Get the transposed matrix
        specmt = transpose(specm);
        %Autocorrelation matrix
        R = specm*specmt;
        %Calculate principal components
        [V,D,W] = eig(R);
        p = transpose(V)*specm;
    end
end


function [p,xr] = fpca(specmusic,K)
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    
    %Create cell array
    ca = cell(1,length(K(:,1)));
    
    %Calculate principal components for each window
    %for k = 1:length(K(:,1))
    for k = 2:2
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
%         D = abs(D);
%         ca{1,k} = transpose(V)*specm;
        p = ones(1,length(V(1,:)));
        %Reconstruct music
        pm = repmat(p,length(V(:,1)),1);
        xr = pm.*V + mu;
    end
end


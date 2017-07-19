function [Vc] = getEigenVectors(specmusic,K)
    %Calculate the N most important eigenvectors for describing the system.
    %   Inputs:
    %       - specmusic: music spectrogram
    %       - K: matrix for spliting in parts
    %   Outputs:
    %       - Vc: cell array with eigenvectors
    %
    %   Author: Miguel Gameiro
    
    %Allocate cell array
    Vc = cell(1,length(K(:,1)));
    
    %Create a waitbar
    h = waitbar(0,'Calculating EigenVectors...');
    
    for k = 1:length(K(:,1))
        waitbar(k/length(K(:,1)),h);
        %Split the vector
        specm = specmusic(:,K(k,1):K(k,2));
        %Get mean value
        mu = mean(specm,2);
        specm = specm - repmat(mu,1,length(K(k,1):K(k,2)));
        %Get the transposed matrix
        specmt = transpose(specm);
        %Autocorrelation matrix
        R = specm*specmt;
        %Calculate principal components
        %[V,D,W] = eig(R);
        [V,~] = eigs(R,5);
        Vc{1,k} = V;
    end
    
    %Delete waitbar
    delete(h);
end


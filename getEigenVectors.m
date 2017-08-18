function [p,Vc] = getEigenVectors(specmusic,K)
    %Calculate the N most important eigenvectors for describing the system.
    %   Inputs:
    %       - specmusic: music spectrogram
    %       - K: matrix for spliting in parts
    %   Outputs:
    %       - p: principal component values
    %       - Vc: cell array with eigenvectors
    %
    %   Author: Miguel Gameiro
    
    %Allocate cell array
    Vc = cell(1,length(K(:,1)));
    p = cell(1,length(K(:,1)));
    
    %Create a waitbar
    h = waitbar(0,'Calculating EigenVectors...');
    
    for k = 1:length(K(:,1))
        %Update waitbar percentage
        waitbar(k/length(K(:,1)),h);
        %Split the vector
        specm = specmusic(:,K(k,1):K(k,2));
        %Get mean value
%         mu = mean(specm,2);
%         specm = specm - repmat(mu,1,length(K(k,1):K(k,2)));
        %Get the transposed matrix
        specmt = transpose(specm);
        %Autocorrelation matrix
        R = specm*specmt;
        size(R)
        %Calculate eigenvectors
        %[V,D,W] = eig(R);
        [V,~] = eigs(R,2);
        Vc{1,k} = V;
        %Calculate eigenvalues
        p{1,k} = transpose(Vc{1,k})*specm;
    end
    
    %Delete waitbar
    delete(h);
end


function [K,Km] = getWindowLimits(specmusic,eigsize,window)
    %Decide where to limit and process diferent parts.
    %   Inputs:
    %       - specmusic: music spectrogram
    %       - eigsize: number of FFTs for eigvector processing
    %   Outputs:
    %       - K: matrix for limits
    %
    %   Author: Miguel Gameiro
    
    
    %Get number por processing parts
    N = length(specmusic(1,:));
    Nw = floor(N/eigsize) + sign(floor(N/eigsize));

    %Matrix with limits
    K = zeros(Nw,2);

    %Limit matrix for spectrogram
    for k = 1:Nw
        K(k,1) = eigsize*(k-1)+1;
        K(k,2) = K(k,1) + eigsize;
    end
    K(end,2) = N;
    
    %Limit matrix for music
    Km = zeros(1,1);
end


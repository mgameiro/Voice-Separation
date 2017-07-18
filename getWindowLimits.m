function [K] = getWindowLimits(specmusic,eigsize)
    %Decide where to limit and process diferent parts.
    %   Inputs:
    %       - specmusic: music spectrogram
    %       - eigsize: number of FFTs for eigvector processing
    %   Outputs:
    %       - K: matrix for limits
    %
    %   Author: Miguel Gameiro
    
    
    %Get number por processing parts
    % Lw = 2*(1/18)*fs;
    % N = length(specmusic(1,:));
    % Nw = floor(N/Lw) + sign(rem(N,Lw));
    N = length(specmusic(1,:));
    Nw = floor(N/eigsize) + sign(floor(N/eigsize));

    %Matrix with limits
    K = zeros(Nw,2);

    %
    for k = 1:Nw
        K(k,1) = eigsize*(k-1)+1;
        K(k,2) = K(k,1) + eigsize;
    end
    K(end,2) = N;
    
end


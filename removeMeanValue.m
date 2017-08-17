function [music,mu] = removeMeanValue(music)
    %Remove the mean value from the original signal.
    %   Inputs:
    %       - music: original signal
    %   Outputs:
    %       - music: signal without mean value
    %       - mu: mean value of the signal
    %
    %   Author: Miguel Gameiro
    
    %Size of music signal
    mu = mean(music);
    
    %Remove DC value
    music = music - mu;
    
end


function [specmusic] = specMusic(music, fs)
    %Create a music spectrogram with the adequate scales and with data
    %readble after this
    %   Inputs:
    %       - music: music signal
    %       - fs: sampling frequency
    %   Outputs:
    %       - specmusic: spectrogram values matrix
    %
    %   Author: Miguel Gameiro
    
    %Create a window for computation of spectrogram
    %https://www.mathworks.com/help/signal/windows.html
    %We want a minimum 2 periods at a window of 18Hz frequency
    window = hamming((2/18)*fs);
    
    specmusic = spectrogram(music,window, 'yaxis');
        
end


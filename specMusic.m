function [specmusic] = specMusic(music)
    %Create a music spectrogram with the adequate scales and with data
    %readble after this
    
    %Create a window for computation of spectrogram
    %https://www.mathworks.com/help/signal/windows.html
    window = taylorwin(floor(length(music)/20));
    
    specmusic = spectrogram(music,window, 'yaxis')
    
    
end


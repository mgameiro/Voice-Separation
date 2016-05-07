function [s,f,t] = espectrograma(sinal,fs)
%Cria o espectrograma do sinal
    %Windows: https://en.wikipedia.org/wiki/Window_function

n = 64;
[s,f,t] = spectrogram(sinal,hann(n),3*n/4,4*n,fs,'yaxis');

end


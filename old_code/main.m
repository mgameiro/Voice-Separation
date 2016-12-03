%% Recebe uma musica e separa parte intstrumental da parte vocal

clear all;
%Recebe musica a abrir
filename = input('Ficheiro: ');
%Abre ficheiro da musica
[musica,fs] = audioread(filename);
%plot (musica)
%Calcula dura��o total da musica
tempo = length(musica)*(1/fs);
fprintf('Dura��o da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);
%%Aplica��o do algoritmo de PCA
%Valor central = 0
mu = mean(musica);
musica = musica - mu;
%Obt�m eigenvectors de matriz de autocorrela��o
fprintf('Calculando espectrograma...\n');
musica = musica(1:5e6);
spectrogram(musica,hann(64),3*64/4,4*64,fs,'yaxis');
%[s,f,t] = espectrograma(musica,fs);
fprintf('Calculando vectores pr�prios...\n');
%v = EigVec(s,f,t);
%Grava musica no ficheiro
%audiowrite('parte1.wav',musica1,fs);
fprintf('A concatenar v�rias partes...\n');

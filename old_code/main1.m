%% Recebe uma musica e separa parte intstrumental da parte vocal

%Recebe musica a abrir
filename = input('Ficheiro: ');
%Abre ficheiro da musica
[musica,fs] = audioread(filename);
%plot (musica)
%Calcula duração total da musica
tempo = length(musica)*(1/fs);
fprintf('Duração da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);
%Espectrograma da musica
[s,f,t] = espectrograma(musica,fs);
%Algoritmo RPCA
M0 = s;
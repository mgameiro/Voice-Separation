%% Recebe uma musica e separa parte intstrumental da parte vocal

clear all;

%% Abertura do ficheiro da musica
%Recebe musica a abrir
%filename = input('Ficheiro: ');
filename = 'Sacrifice.wav';
%Abre ficheiro da musica
[music,fs] = audioread(filename);
%plot (musica)
%Calcula dura��o total da musica
tempo = length(music)*(1/fs);
fprintf('Dura��o da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);
%% Gera��o de espectrograma do sinal da musica

%% Aplica��o de PCA
pcamusic = pca(specmusic);
%% Retira componente vocal
music = removeVoice(music,specmusic,1);

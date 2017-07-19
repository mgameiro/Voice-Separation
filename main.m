%% Recebe uma musica e separa parte intstrumental da parte vocal

clear all;
close all;
clc;

%% Abertura do ficheiro da musica
%Recebe musica a abrir
%filename = input('Ficheiro: ');
filename = 'Cats in the cradle - Ricky Skaggs.wav';
%Abre ficheiro da musica
[music,fs] = audioread(filename);
%plot(music)

%Calcula dura��o total da musica
tempo = length(music)*(1/fs);
fprintf('Dura��o da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);

%% Gera��o de espectrograma do sinal da musica
specmusic = specMusic(music, fs);
K = getWindowLimits(specmusic,20);
mspecmusic = abs(specmusic);

%% Aplica��o de PCA
%[pcamusic,pcascore,pcalatent] = pca(specmusic);
%[p,D] = fpca(mspecmusic,K);
test;

%% Retira componente vocal
% music = removeVoice(music,specmusic,1);

%% Save vocal part in file
% audiowrite('vocal.wav');

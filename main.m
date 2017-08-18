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

%Calcula duração total da musica
tempo = length(music)*(1/fs);
fprintf('Duração da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);

%% Remove mean value of music
[music,mu] = removeMeanValue(music);

%% Geração de espectrograma do sinal da musica
[specmusic,wind] = specMusic(music, fs);
[K,Km] = getWindowLimits(specmusic,20,wind);
mspecmusic = abs(specmusic);

%% Aplicação de PCA
tic,
[p,V] = getEigenVectors(specmusic,K);
toc

%% Retira componente vocal
tic,
vocal = reconstructVocal(wind,p,V,mu,Km);
toc

%% Save vocal part in file
audiowrite('vocal.wav',vocal,fs);

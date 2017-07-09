%% Recebe uma musica e separa parte intstrumental da parte vocal

clear all;

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

%% Geração de espectrograma do sinal da musica
specmusic = specMusic(music, fs);

%% Aplicação de PCA
[pcamusic,pcascore,pcalatent] = pca(specmusic);

%% Retira componente vocal
% music = removeVoice(music,specmusic,1);

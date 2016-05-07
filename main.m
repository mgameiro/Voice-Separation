%% Recebe uma musica e separa parte intstrumental da parte vocal

clear all;
%Recebe musica a abrir
filename = input('Ficheiro: ');
%Abre ficheiro da musica
[musica,fs] = audioread(filename);
%plot (musica)
%Calcula duração total da musica
tempo = length(musica)*(1/fs);
fprintf('Duração da musica: %d min e %g s\n', floor(tempo/60), (tempo/60-floor(tempo/60))*60);
%%Aplicação do algoritmo de PCA
%Valor central = 0
mu = mean(musica);
musica = musica - mu;
%Obtém eigenvectors de matriz de autocorrelação
[n,musicar] = PartAnalysesCicle(musica,fs,mu);
%v1 = getEigVec(musica);
%v1 = transpose(v1);
%Obtém principal componente 1
%musica1 = v1*musica(1:1e2+1)*v1;
%Grava musica no ficheiro
%audiowrite('parte1.wav',musica1,fs);
fprintf('A concatenar várias partes...');
musicar = [];
for k=1:n-1
   fprintf('Concatenando %d\n', num2str(k));
   musicar = [musicar; audioread(strcat('parte',num2str(k),'.wav'))];
end
plot(musicar);
audiowrite('musicar.wav',musicar,fs);
%delete('parte*');
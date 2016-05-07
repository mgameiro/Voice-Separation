function [n,musicar] = PartAnalysesCicle(musica,fs,mu)
musicar = [];
%Define o tamanho das partes de analise da musica
SALTO = 2e3;
%Define "cursor"
p = 1;
%Inicializa variáveis
N = length(musica);
v = [];
fprintf('Numero de partes: %d\n', N/SALTO);
n = 1;
while(N > 0 && n <= 50)
    fprintf('Parte: %d\n', n);
    %Avança na musica
    p = p + SALTO;
    %Divide a musica em pequenas partes mais fáceis de analisar
    if N >= SALTO
        s = musica(p:p+SALTO);
    else
        s = musica(p:p+N);
    end
    %Encontra matriz de autocorrelação
    R = getR(s);
    %Encontra eigevectores
    [v,~] = eig(R);
    %Verifica quanto falta para terminar
    N = N-SALTO;
    %Separa componente 1
    v1 = v(:,1);
    v1 = transpose(v1);
    %Obtém parte da música
    musicap = v1*musica(p:p+SALTO)*v1*(1/(norm(v1))^2)+mu;
    musicar = [musicar musicap];
    %Escreve num ficheiro
    audiowrite(strcat('parte',num2str(n),'.wav'),transpose(musicap),fs);
    %Avança para parte seguinte
    n = n+1;    
end

%Concatena as várias partes
% fprintf('A concatenar várias partes...');
% musicar = [];
% for i=1:n-1
%    fprintf('Concatenando %d\n', num2str(i));
%    musicar = [musicar; audioread(strcat('parte',num2str(i),'.wav'))];
% end
% audiowrite('musicar.wav',musicar,fs);

end


function [v1] = getEigVec(musica)

SALTO = 1e2;
p = 1;
N = length(musica);
v = [];
fprintf('Numero de partes: %d\n', N/SALTO);
n = 1;
while(N > 0 && p < 2)
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
    n = n+1;    
end


v1 = v(:,1);
end


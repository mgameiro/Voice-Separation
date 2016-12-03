function [v] = EigVec(s,f,t)
    %Encontra eigenvectors
    %   input: espectrograma de potências
    %   output: eigen vectores do espectrograma
    
    R = []; v = [];
    for n=1:length(t)
        %Constrói matrizes de autocorrelação para cada instante
        R = getR(s(:,n));
        %Encontra eigevectores
        [vaux,~] = eig(R);
        v = [v vaux];
    end
end


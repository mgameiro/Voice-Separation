function [R] = getR(musica)
%Retorna a autocorrelação da musica

R = musica*(musica.');

end


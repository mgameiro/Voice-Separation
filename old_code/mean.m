function [mean] = mean(sinal)
%Retorna o valor medio do sinal

N = length(sinal);
mean = (1/N)*sum(sinal);

end


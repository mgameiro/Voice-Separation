function [R] = autocorrelation(sinal)
%Auto-correlação do sinal (assume-se processo ergódigo)
%https://en.wikipedia.org/wiki/Autocorrelation

%% Brute force
%N = length(sinal);
%autocorr = zeros(1,N);
%for l=1:N
%    for i=1:N
%        for j=1:N
%            autocorr(l) = autocorr(l) + sinal(i)*sinal(j);
%        end
%    end
%end
%autocorr = autocorr/N;

%% Algoritmo eficiente
SINAL = fft(sinal);
S = (abs(SINAL)).^2;
R = ifft(S);

end


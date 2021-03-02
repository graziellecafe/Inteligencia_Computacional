% Problema da Mochila
% M�todo Construtivo
% Nome: Grazielle Amanda do Carmo Caf�
% Disciplina: Intelig�ncia Computacional para Otimiza��o 
% -------------------------------------------------------------------------------------------------------------
% Defini��o do problema: Uma mochila com 5 objetos e com capacidade b = 23
% Solu��o do problema: Usando a heur�stica de constru��o gulosa

% Implementa��o 
clear all;
close;
clc

% Descri��o das vari�veis
pesos = [4 5 7 9 6];
beneficios = [2 2 3 4 4];
limite_peso = 23; 

% C�lculo ponto a ponto de benef�cio / pre�o
% Fun��o custo b: 
b = beneficios./pesos;               % C�lculo da fun��o gulosa: pj/wj 
[b, indices] = sort (b, 'descend');  % Forma descendente

% 2. Representa��o da Solu��o: 
% Representa��o bin�ria: s (00000)'
% Criando um vetor de uma linha com o tamanho de b
s0 = zeros(1, length(b));           % 1 linha, 5 colunas        
s = s0; 
fs = 0; 
peso_total = 0; 


% 3. Loop de intera��o 
for i = 1: length(b)                % Percorrer at� o tamanho do vetor b
    if pesos(indices(i))<= limite_peso
        s(indices(i)) = 1; 
        fs = fs + beneficios(indices(i)); 
        limite_peso = limite_peso - pesos(indices(i)); 
        peso_total = peso_total + pesos(indices(i));
    end
end

s_otimo = s;
fs_otimo = fs;
peso_otimo = peso_total;

fprintf('O valor de fs_otimo: %d \n\n ', fs_otimo);
fprintf('O peso �timo �: %d \n\n' , peso_otimo);

fprintf('A vetor com os objetos adicionados �: [');
fprintf(' %g', s_otimo);
fprintf(']');

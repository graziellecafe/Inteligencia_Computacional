% Problema da Mochila
% Método Construtivo
% Nome: Grazielle Amanda do Carmo Café
% Disciplina: Inteligência Computacional para Otimização 
% -------------------------------------------------------------------------------------------------------------
% Definição do problema: Uma mochila com 5 objetos e com capacidade b = 23
% Solução do problema: Usando a heurística de construção gulosa

% Implementação 
clear all;
close;
clc

% Descrição das variáveis
pesos = [4 5 7 9 6];
beneficios = [2 2 3 4 4];
limite_peso = 23; 

% Cálculo ponto a ponto de benefício / preço
% Função custo b: 
b = beneficios./pesos;               % Cálculo da função gulosa: pj/wj 
[b, indices] = sort (b, 'descend');  % Forma descendente

% 2. Representação da Solução: 
% Representação binária: s (00000)'
% Criando um vetor de uma linha com o tamanho de b
s0 = zeros(1, length(b));           % 1 linha, 5 colunas        
s = s0; 
fs = 0; 
peso_total = 0; 


% 3. Loop de interação 
for i = 1: length(b)                % Percorrer até o tamanho do vetor b
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
fprintf('O peso ótimo é: %d \n\n' , peso_otimo);

fprintf('A vetor com os objetos adicionados é: [');
fprintf(' %g', s_otimo);
fprintf(']');

function [ Pa, Pb, v ] = estrategias_mistas( P )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Questao 1a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Recebe uma matriz que representa uma tabela de premios e retorna, 
% para cada jogador, o vetor de probabilidades de se selecionar cada estrategia,
% e o valor do jogo. Em outras palavras, e' uma funcao que resolve o problema 
% via estrategias mistas.
%
%   Ao receber a tabela de premios P, foi necessario trabalha-la de forma que 
% ela ficasse no formato pedido pela funcao glpk. Generalizando o problema para
% uma matriz NxN, adicionamos uma variavel auxiliar que simboliza o resultado
% do jogo e arrumamos uma forma de generalizar os parametros vartype e ctype,
% de forma a aceitar qualquer tamanho de matriz.
%
%   Parametros: P = Matriz  NxN que representa a tabela de premios
%
%   Retorna: Pa = Vetor coluna com a probabilidade de se selecionar cada 
%                 estrategia para o jogador A
%            Pb = Vetor coluna com a probabilidade de se selecionar cada 
%                 estrategia para o jogador B
%            v = Valor do jogo esperado
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%   A Matriz P deve ter apenas os coeficientes da tabela de premios, de forma
% que precisamos complementa-la no modelo de programacao linear com a adicao de 
% uma variavel auxiliar.
[nrows, ncols] = size(P);
a = [P ones(nrows, 1)*(-1)];
a = [a ; ones(1, ncols+1)];
a(nrows+1, ncols+1) = 0;


# Coeficientes de custo: Apenas a variavel auxiliar
c = horzcat(zeros(1, ncols), 1)';

# bounds, ou limites do lado esquerdo. Como espera-se um jogo de soma zero,
# Os limites sao zero, exceto pelo somatorio das probabilidades, que deve ser 1
b = vertcat(zeros(nrows, 1), 1);

# Vetor de lower bound das variaveis. Zero para os premios e infinito para aux.
lb = horzcat(zeros(1, ncols), Inf);

# Vetor de Upper Bound, vazio pq se houver limite, esta' na tabela de premios P.
ub = [];

# Todas as variaveis sao continuas, portanto, basta repetir C para tudo.
string_fill_char = "C"; # ascii para o caracter 'C'
vartype = repmat(string_fill_char, 1, ncols+1);

# Todas as variaveis tem um Lower bound (>=), portato L.
# O somatorio das probabilidades deve ser exatamente 1, entao S.
string_fill_char = "L"; # ascii para o caracter 'L'
ctype = horzcat(repmat(string_fill_char, 1, ncols), "S");

# Sentido: Se = 1, minimizacao Se = -1, maximizacao
s = -1;

# parametros bons para debug.
# msglev: Level of messages output by solver. 3 is full output. Default is 1.
param.msglev = 1;
# itlimit eh o numero limite de iteracoes do simplex
# itlim = 10;

# dual: Se o problema e o dual ou o primal. Default = 1 (primal), mas 3 e' dual.
param.dual = 1;

# O resultado do comando GLPK e':
# Pa = O valor das variaveis otimas
# v = O valor esperado otimo
# status = nao utilizado. 180 se otimo, 181 se nao otimo, 
#                         182 se nao factivel, 183 se nao ha solucao factivel
[Pa, v, ~  ] = glpk (c, a, b, lb, ub, ctype, vartype, s, param );
param.dual = 3;
[Pb, v, ~  ] = glpk (c, a, b, lb, ub, ctype, vartype, s, param );

# O Resultado do comando GLPK retorna com a probabilidade da variavel auxiliar
# igual a zero, entao a gente retira essa parte do vetor.
Pa = Pa(1:ncols, 1);
Pb = Pb(1:ncols, 1);

end
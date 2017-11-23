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
%   DESCREVER AQUI COMO IMPLEMENTAMOS ESSA FUNCAO
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






%  EXEMPLO DE EXECUCAO DO GLPK. COMO NAO ENTENDI, SO DEIXEI AQUI PARA SABERMOS
% QUE EXISTE





# matrix notation of problem
c = [1; -2; -3; -1];
a = [1, -1, -2, -1; 
     2,  0,  1, -4; 
     -2, 1,  0,  1];
b = [4; 2; 1];

#empty vector because the default lower bound on the variables is zero
lb = [];

#empty vector because there is no upper bound on the variables
ub = [];

#indicates that each variable is continuous type
vartype = "CCCC";

#indicates the sense of each constraint as having an upper bound
ctype = "UUU";

#indicates that it is a maximization problem
s = -1;

# the command below displays:
# xopt = the optimal variables
# fopt = the optimal value
# status = 180 if solution is optimal
# status = 181 if solution is feasible, but, not optimal
# status = 182 if solution is not feasible
# status = 183 if there are no feasible solutions
[xopt, fopt, status ] = glpk (c, a, b, lb, ub, ctype, vartype, s )


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                QUESTAO 1b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   O presente script resolve a questao 1b, realizando a solucao de um jogo de
% par ou impar. O jogo e' simulado 100 vezes, e e' acumulado o premio de cada
% uma das execucoes. Apos as execucoes, verifica-se se o 
% resultado acumulado e' similar ao esperado.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nrepet = 100; % Numero de repeticoes

P = [  1 -1  ; 
      -1  1 ]; % Tabela de premios

% Pa = Vetor de Probabilidades de estrategias do jogador A
% Pa = Vetor de Probabilidades de estrategias do jogador B
[Pa, Pb, v ] = estrategias_mistas( P );

premio = 0;
for i=1:nrepet
  idxa = monte_carlo(Pa); % Processo de MonteCarlo  para cada jogador, que
  idxb = monte_carlo(Pb); % decide se o carinha vai selecionar par ou ímpar
  premio = premio + P(idxa, idxb); % acumula o premio
end


printPa=sprintf('%.2f ', Pa);
printPb=sprintf('%.2f ', Pb);
fprintf('Probabilidades das escolhas do jogador A: %s\n', printPa);
fprintf('Probabilidades das escolhas do jogador B: %s\n', printPb);
fprintf('Valor esperado de premio: %.2f\n', v);
fprintf('Premio acumulado apos %d repeticoes: %.2f\n', nrepet, premio);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                QUESTAO 1c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   O presente script resolve a questao 1c, realizando a solucao do jogo 
% proposto pela tabela de premios. O jogo e' simulado 100 vezes, e e' acumulado 
% o premio de cada uma das execucoes. Apos fazer exatamente o mesmo que faz a 
% questao 1b, perturba um pouco os valores dos vetores de probabilidades obtidos
% com valores arbitrarios (nos mesmos decidimos os valores) e realiza novamente
% a simulacao. Ao final, compara os dois valores.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nrepet = 100; % Numero de repeticoes

P = [  3 -1 -3 ; 
      -2  4 -1 ;
      -5 -6 -2]; % Tabela de premios

% Pa = Vetor de Probabilidades de estrategias do jogador A
% Pa = Vetor de Probabilidades de estrategias do jogador B
[Pa, Pb, v ] = estrategias_mistas( P );

printPa=sprintf('%.2f ', Pa);
printPb=sprintf('%.2f ', Pb);
fprintf('Probabilidades das escolhas do jogador A: %s\n', printPa);
fprintf('Probabilidades das escolhas do jogador B: %s\n', printPb);
fprintf('Valor esperado de premio: %.2f\n', v);

premio = 0;
for i=1:nrepet
  idxa = monte_carlo(Pa); % Processo de MonteCarlo  para cada jogador, que
  idxb = monte_carlo(Pb); % decide se o carinha vai selecionar par ou ímpar
  premio = premio + P(idxa, idxb); % acumula o premio
end

fprintf('Premio acumulado apos %d repeticoes: %.2f\n', nrepet, premio);

fprintf('\n\nPerturbando os vetores de Probabilidades...');
fprintf('\nPressione qualquer tecla para continuar\n');
pause;


% Perturbando os vetores de probabilidades Pa e Pb com valores arbitrarios:
Pap = Pa; Pap(1)=Pap(1)-0.01;  Pap(2)=Pap(2)+0.01;
Pbp = Pb; Pbp(3)=Pbp(3)-0.005; Pbp(2)=Pbp(2)+0.005; Pbp(1)=Pbp(1)+0.005;

printPa=sprintf('%.2f ', Pap);
printPb=sprintf('%.2f ', Pbp);
fprintf('Probabilidades das escolhas do jogador A: %s\n', printPa);
fprintf('Probabilidades das escolhas do jogador B: %s\n', printPb);

% realizando o mesmo processo de simulacao anterior
premiop = 0;
for i=1:nrepet
  idxa = monte_carlo(Pap); % Processo de MonteCarlo  para cada jogador, que
  idxb = monte_carlo(Pbp); % decide se o carinha vai selecionar par ou ímpar
  premiop = premiop + P(idxa, idxb); % acumula o premio
end

fprintf('Premio acumulado apos %d repeticoes: %.2f\n', nrepet, premiop);



fprintf('\n\nA diferenca entre os premios foi de %.2f unidades\n', 
        sqrt((premio-premiop)^2) );
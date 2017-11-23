function [ idx ] = monte_carlo( P )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Processo de Decisao de  Monte Carlo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Executa um processo de decisao de Monte Carlo. O que essa funcao faz,  
% basicamente, e' gerar um numero randomico, e ir somando as probabilidades, em
% ordem, ate que essa acumulacao alcance o valor sorteado. O indice 
% correspondente ao primeiro valor a ultrapassar o valor sorteado e' o indice 
% escolhido.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


  p = rand();   % Gera o numero randomico
  idx = 0;      % indice que sera retornado
  soma = 0;
  sizeP = size(P(1,:));
  
  for i=1:sizeP
    idx = i;    % ja atribui o indice, para apos o teste ser retornado
    soma = soma + P(i); % realiza a acumulacao, de forma a preparar para o teste
    if p < soma % caso a acumulacao de probabilidades ultrapasse o indice
      break;    % interrompe-se o loop e retorna o valor
    end
  end
  
end
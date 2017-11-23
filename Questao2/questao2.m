function [percZero, percQuatro] = questao2()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Questao 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Realiza a simulacao de uma cadeia de markov representada pela matriz de
% transicao proposta no exercicio. A solucao dada foi bem direta, com apenas um
% detalhe passivel de observacao: Como as probabilidades de transicao entre
% estados sao de 1/3 e 2/3, ao inves do processo de decisao de Monte Carlo,
% utilizamos uma estrategia mais direta: Gerar um numero inteiro randomico 
% entre 1 e 3, e, caso este numero seja 1 (ha uma probabilidade de 1/3 disso
% acontecer), a transicao com menor probabilidade e' escolhida. 
%
%   Retorna: PercZero = Percentual de vezes que o valor chegou ao estado 0
%            PercQuatro = Percentual de vezes que o valor chegou ao estado 4
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



nsims = 1000;    % Numero de simulacoes
nit = 100;       % Numero de iteracoes dentro de cada simulacao
  
contZero = 0;    % Quantidade de vezes que a simulacao chegou ao estado 0
contQuatro = 0;  % Quantidade de vezes que a simulacao chegou ao estado 4

for i = 1:nsims
  
    estado = 1;   % Estado inicial da simulacao
    
    for j = 1:nit % realiza 100 iteracoes. Pra cada uma delas, verifica o estado
        if estado == 0 
            contZero = contZero + 1; 
            break;
        elseif estado == 1
            rand = randi([1, 3]);   % gera um inteiro aleatorio entre 1 e 3
            if rand == 1            % Como as probabilidades sao de 1/3 e 2/3
                estado = 2;         % basta verificar se o numero sorteado foi 1
            else                    % e, caso positivo, atribuir o proximo  
                estado = 0;         % estado 'a menor probabilidade. Caso  
            end                     % contrario, atribuir a maior probabilidade.
        elseif estado==2
            rand = randi([1, 3]);
            if rand == 1
                estado = 3;
            else
                estado = 1;
            end
        elseif estado==3
            rand = randi([1, 3]);
            if rand == 1
                estado = 4;
            else
                estado = 3;
            end
        else
            contQuatro = contQuatro + 1;
            break;
        end
    end
    
end

percZero = (contZero * 100)/(contZero + contQuatro)
percQuatro = (contQuatro * 100)/(contZero + contQuatro)
fprintf("Probabilidade da cadeia cair no estado Zero: %.2f", percZero);
fprintf("\nProbabilidade da cadeia cair no estado Quatro: %.2f", percQuatro);
end
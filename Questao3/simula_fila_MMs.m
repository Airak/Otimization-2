function [nW, nT] = simula_fila_MMs(lambda, mu, s, T)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                QUESTAO 3a
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Simula T epocas em uma fila MMs atraves dos valores passados.
%   Parametros: lambda = taxa de entrada na fila - valor escalar
%               mu = taxa de atendimento - Valor escalar
%               s = numero de atendentes - Valor escalar
%               T = numero de atendentes - Valor escalar
%   Retorna: nW = Vetor coluna com o numero de clientes que aguardam atendimento 
%                 ao logo do tempo - 1xT
%            nT = Vetor coluna com o total de clientes no sistema
%                 ao logo do tempo - 1xT
%
%   Realiza a simulacao de T unidades de tempo em um sistema de filas M/M/s.
%   Para cada tempo T, calcula-se um valor randomico para saber se alguem
% vai entrar na fila. Depois disso, percorre os atendentes, verificando se 
% tem algum livre para pegar um usuario na fila. Caso esteja ocupado, 
% verifica a possibilidade de ja ter atendido o cliente. Os valores de numero
% de clientes na fila e numero total de clientes no sistema sao calculados ao 
% fim de cada iteracao em T.  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Checa se os valores informados sao validos
    if any( [lambda mu] > 1 ) || any( [lambda mu] < 0 )
        error('As taxas lambda e mu devem ser valores de probabilidade!!!');
    elseif any( [s T] < 1 )
        error('Ta de zueira comigo que vai usar valor invalido aqui, ne?!');
    end 
    
    atendentes = logical(zeros(1, s)); % Vetor lógico de atendentes
    n = 0; % Numero de clientes esperando na fila
    
    nW = zeros(1, T); % Numero de clientes esperando na fila ao longo do tempo
    nT = zeros(1, T); % Numero total de clientes no sistema ao longo do tempo
    
    for i=1:T
        
        P_entrar = rand(); % Probabilidade de um cliente entrar na fila
        if P_entrar<lambda
            n = n + 1;
        end
        
        ns = 0; % numero de clientes sendo atendidos
        for j=1:s   % para cada atendente
            if ( ~atendentes(j) && n>0 ) % se esta ocioso e tem cliente na fila
                n = n - 1;               % atende o cliente
                atendentes(j) = true;    % fica ocupado
            elseif ( atendentes(j) )     % se esta atendendo um cliente
                atendentes(j) = ~(rand()<mu); % prob. de ter terminado atendimento
            end
            
            if( atendentes(j) )
                ns = ns + 1; % realiza contagem de pessoas em atendimento
            end
        end  
      
        nW(i) = n;       % numero de clientes aguardando atendimento
        nT(i) = n + ns;  % numero total de clientes no sistema.
    end
    
end
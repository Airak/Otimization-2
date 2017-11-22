%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                QUESTAO 3b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   O presente script resolve a questao 3b, realizando uma simulacao
% de cada um dos tres cenarios propostos. Como cada simulacao retorna vetores  
% coluna com os resultados, foram utilizadas duas matrizes, nW e nT, para 
% guardar, iterativamente em suas linhas, a medida que executamos as simulacoes,
% o numero de clientes aguardando na fila e o numero de clientes total no
% sistema ao longo do tempo. Os graficos sao plotados utilizando a media dos 
% valores obtidos em cada simulacao.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ns = [1 2 3]; % Quantidade de atendentes a ser variada nas simulacoes
nsims = 100;  % Numero de simulacoes

lambda = 0.3; % Taxa de entrada de clientes na fila
mu = 0.25;    % Taxa de atendimento dos atendentes
T = 1000;      % Numero de epocas dentro das simulacoes

for s=ns      % Para cada situacao (numero de atendentes)
  
  nW = zeros(nsims, T);
  nT = zeros(nsims, T);

  for i=1:nsims % Simula nsims vezes e armazena o resultado
    [ nW(i,:) , nT(i,:) ] = simula_fila_MMs(lambda, mu, s, T);
  end
  
  nWmedio = mean(nW); % faz a media para plotar o grafico
  nTmedio = mean(nT);
  x = 1:T;            % indices do grafico
  
  figure(s)
  clf
  plot(x,nWmedio, '-r');
  hold on
  plot(x,nTmedio, '-b');
  xlabel('Tempo de simulacao');
  ylabel('Numero de clientes medio');
  legend('Clientes aguardando atendimento','Total de clientes no sistema');
  %title(strcat('Simulacao da fila M/M/', num2str(s)));

end
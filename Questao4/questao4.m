function [ ] = questao4( lambda, mu )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Funcao Pn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Imprime uma tabela de com os valores das metricas de qualidade de processos
% de nascimento e morte, para filas M/M/1, M/M/2, M/M/3 e M/M/4. Inicialmente,
% todos os vetores sao inicializados, e percorremos-os, preenchendo com 
% os valores. Como ha dependencia de alguns parametros com outros, preferimos
% fazer tudo num for do que utilizar o paradigma matricial, para facilitar o 
% entendimento. Uma funcao Pn foi criada para calcular os valores de 
% probabilidade para os diversos valores de N propostos.
%
%   Parametros: lambda = taxa de entrada na fila - valor escalar
%               mu = taxa de atendimento - Valor escalar
%
%   Imprime: Pn = A probabilidade de se encontrar n clientes esperando na fila
%                 para ser atendido em regime de estado estavel.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s_vals = [1 2 3 4];
ro = lambda./(s_vals.*mu);

P0 = zeros(1, 4);
P1 = zeros(1, 4);
P2 = zeros(1, 4);
P3 = zeros(1, 4);
P5 = zeros(1, 4);
P10 = zeros(1, 4);
Lq = zeros(1, 4);
L = zeros(1, 4);
Wq = zeros(1, 4);
W = zeros(1, 4);
P_wq0 = zeros(1, 4);
P_wqm0 = zeros(1, 4);
P_wq1 = zeros(1, 4);
P_wq2 = zeros(1, 4);
P_wq5 = zeros(1, 4);

for s = s_vals
    P0(1, s) = Pn(lambda, mu, 0, s);
    P1(1, s) = Pn(lambda, mu, 1, s);
    P2(1, s) = Pn(lambda, mu, 2, s);
    P3(1, s) = Pn(lambda, mu, 3, s);
    P5(1, s) = Pn(lambda, mu, 5, s);
    P10(1, s) = Pn(lambda, mu, 10, s);
    Lq(1, s) = P0(1, s)*( (((lambda/mu)^s)*ro(1, s)) / (factorial(s)*(1-ro(1, s))^2)  );
    L(1, s) = Lq(1, s) + lambda/mu;
    Wq(1, s) = Lq(1, s)/lambda;
    W(1, s) = Wq(1, s) + 1 / mu;
    
    if s==1
        P_wq0(1, s) = P0(1, s);
    elseif s==2
        P_wq0(1, s) = P0(1, s) + P1(1, s);
    elseif s==3
        P_wq0(1, s) = P0(1, s) + P1(1, s) + P2(1, s);
    else
        P_wq0(1, s) = P0(1, s) + P1(1, s) + P2(1, s) + P3(1, s);
    end
    
    P_wqm0(1, s) = (1-P_wq0(1, s));
    P_wq1(1, s) = (1-P_wq0(1, s)) * ( exp(-s*mu*(1-ro(1, s))*1) );
    P_wq2(1, s) = (1-P_wq0(1, s)) * ( exp(-s*mu*(1-ro(1, s))*2) );
    P_wq5(1, s) = (1-P_wq0(1, s)) * ( exp(-s*mu*(1-ro(1, s))*5) );
end


fprintf('============= Fila M/M/s =============\n');
fprintf('s\t%d\t%d\t%d\t%d\n', s_vals);
fprintf('ro\t%.3f\t%.3f\t%.3f\t%.3f\n', ro);
fprintf('P0\t%.3f\t%.3f\t%.3f\t%.3f\n', P0);
fprintf('P1\t%.3f\t%.3f\t%.3f\t%.3f\n', P1);
fprintf('P2\t%.3f\t%.3f\t%.3f\t%.3f\n', P2);
fprintf('P5\t%.3f\t%.3f\t%.3f\t%.3f\n', P5);
fprintf('P10\t%.3f\t%.3f\t%.3f\t%.3f\n', P10);
fprintf('Lq\t%.3f\t%.3f\t%.3f\t%.3f\n', Lq);
fprintf('L\t%.3f\t%.3f\t%.3f\t%.3f\n', L);
fprintf('Wq\t%.3f\t%.3f\t%.3f\t%.3f\n', Wq);
fprintf('W\t%.3f\t%.3f\t%.3f\t%.3f\n', W);
fprintf('P(Wq=0)\t%.3f\t%.3f\t%.3f\t%.3f\n', P_wq0);
fprintf('P(Wq>0)\t%.3f\t%.3f\t%.3f\t%.3f\n', P_wqm0);
fprintf('P(Wq>1)\t%.3f\t%.3f\t%.3f\t%.3f\n', P_wq1);
fprintf('P(Wq>2)\t%.3f\t%.3f\t%.3f\t%.3f\n', P_wq2);
fprintf('P(Wq>5)\t%.3f\t%.3f\t%.3f\t%.3f\n', P_wq5);

end


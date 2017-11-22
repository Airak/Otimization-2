function [Pn] = Pn(lambda, mu, n, s)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                Funcao Pn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Autores:  201212040538 Gustavo Henrique de Souza Borba
%             201322040095 Marco Antonio do Espirito Santo
%             201222040107 Matheus Martins Aguiar  
%             201222040360 Rafael Antunes Batista
%
%   Calcula o termo Pn, a partir do termo P0 e Cn. P0, por sua vez, pode ser 
% encontrado utilizando os parametros lambda, mu, n e s. (sim, recalculamos P0
% para cada valor de Pn que queremos calcular, mas como e' so' pra mostrar uma 
% tabela, o custo computacional e' desprezivel).
%
%   Parametros: lambda = taxa de entrada na fila - valor escalar
%               mu = taxa de atendimento - Valor escalar
%               n = Numero de clientes na fila que desejamos calcular 
%                   a probabilidade de encontrar - Valor escalar
%               s = numero de atendentes - Valor escalar
%
%   Retorna: Pn = A probabilidade de se encontrar n clientes esperando na fila
%                 para ser atendido em regime de estado estavel.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    P0 = 0;
    if s==1
        P0 = 1 - (lambda/mu);
        Pn = P0*(lambda/mu)^n;
    else
        for var_sum=0:s-1
            P0 = P0 + ((lambda/mu)^var_sum)/factorial(var_sum);
        end
        
        P0 = P0 + (((lambda/mu)^s)/factorial(s)) * (1/(1-(lambda/(s*mu))));
        P0 = 1/P0;
        
        if n <= s
            Cn = ((lambda/mu)^n) / factorial(n);
        else % n > s
            Cn = ((lambda/mu)^n) / (factorial(s)*s^(n-s));
        end
        
        if n==0
            Pn = P0;
        elseif n>0 % exclui P0
            Pn = Cn*P0;
        end
    end
end
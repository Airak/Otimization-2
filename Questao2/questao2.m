function [ out ] = questao2()
contZero = 0;
contQuatro = 0;

for i = 1:1000
    estado = 1;
    for j = 1:100
        if estado == 0 
            contZero = contZero + 1; 
            break;
        elseif estado == 1
            rand = randi([1, 3]);
            if rand == 1
                estado = 2;
                continue;
            else
                estado = 0;
            end
        elseif estado==2
            rand = randi([1, 3]);
            if rand == 1
                estado = 3;
                continue;
            else
                estado = 1;
            end
        elseif estado==3
            rand = randi([1, 3]);
            if rand == 1
                estado = 4;
                continue;
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
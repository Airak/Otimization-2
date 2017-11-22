
function [ out ] = questao4( lambda, mu )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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

for i = 1:4
    s = s_vals(i);
    P0(1, i) = Pn(lambda, mu, 0, s);
    P1(1, i) = Pn(lambda, mu, 1, s);
    P2(1, i) = Pn(lambda, mu, 2, s);
    P3(1, i) = Pn(lambda, mu, 3, s);
    P5(1, i) = Pn(lambda, mu, 5, s);
    P10(1, i) = Pn(lambda, mu, 10, s);
    Lq(1, i) = P0(1, i)*( (((lambda/mu)^s)*ro(1, i)) / (factorial(s)*(1-ro(1, i))^2)  );
    L(1, i) = Lq(1, i) + lambda/mu;
    Wq(1, i) = Lq(1, i)/lambda;
    W(1, i) = Wq(1, i) + 1 / mu;
    
    if s==1
        P_wq0(1, i) = P0(1, i);
    elseif s==2
        P_wq0(1, i) = P0(1, i) + P1(1, i);
    elseif s==3
        P_wq0(1, i) = P0(1, i) + P1(1, i) + P2(1, i);
    else
        P_wq0(1, i) = P0(1, i) + P1(1, i) + P2(1, i) + P3(1, i);
    end
    
    P_wqm0(1, i) = (1-P_wq0(1, i));
    P_wq1(1, i) = (1-P_wq0(1, i)) * ( exp(-s*mu*(1-ro(1, i))*1) );
    P_wq2(1, i) = (1-P_wq0(1, i)) * ( exp(-s*mu*(1-ro(1, i))*2) );
    P_wq5(1, i) = (1-P_wq0(1, i)) * ( exp(-s*mu*(1-ro(1, i))*5) );
end


fprintf("========== Fila M/M/s ==========\n");
fprintf("ro\t%.2f\t%.2f\t%.2f\t%.2f\n", ro);
fprintf("s\t%.2f\t%.2f\t%.2f\t%.2f\n", s_vals);
fprintf("P0\t%.2f\t%.2f\t%.2f\t%.2f\n", P0);
fprintf("P1\t%.2f\t%.2f\t%.2f\t%.2f\n", P1);
fprintf("P2\t%.2f\t%.2f\t%.2f\t%.2f\n", P2);
fprintf("P5\t%.2f\t%.2f\t%.2f\t%.2f\n", P5);
fprintf("P10\t%.2f\t%.2f\t%.2f\t%.2f\n", P10);
fprintf("Lq\t%.2f\t%.2f\t%.2f\t%.2f\n", Lq);
fprintf("L\t%.2f\t%.2f\t%.2f\t%.2f\n", L);
fprintf("Wq\t%.2f\t%.2f\t%.2f\t%.2f\n", Wq);
fprintf("W\t%.2f\t%.2f\t%.2f\t%.2f\n", W);
fprintf("P(Wq=0)\t%.2f\t%.2f\t%.2f\t%.2f\n", P_wq0);
fprintf("P(Wq>0)\t%.2f\t%.2f\t%.2f\t%.2f\n", P_wqm0);
fprintf("P(Wq>1)\t%.2f\t%.2f\t%.2f\t%.2f\n", P_wq1);
fprintf("P(Wq>2)\t%.2f\t%.2f\t%.2f\t%.2f\n", P_wq2);
fprintf("P(Wq>5)\t%.2f\t%.2f\t%.2f\t%.2f\n", P_wq5);

end


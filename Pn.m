function [Pn] = Pn(lambda, mu, n, s)

    P0 = 0;
    if s==1
        P0 = 1 - (lambda/mu);
        Pn = P0*(lambda/mu)^n;
    else
        for var_sum=0:s-1
            P0 = P0 + ((lambda/mu)^var_sum)/factorial(var_sum);
        end
        
        P0 = P0 + ((lambda/mu)^s)/factorial(s) * 1/(1-(lambda/s*mu));
        P0 = P0^(-1);
        Pn = P0;

        if n <= s
            Cn = ((lambda/mu)^n) / factorial(n);
        else % n > s
            Cn = ((lambda/mu)^n) / (factorial(s)*s^(n-s));
        end
        
        if n>0
            Pn = Cn*P0;
        end
    end
end

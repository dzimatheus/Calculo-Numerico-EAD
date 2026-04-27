clc;
clear;
function [x_root, iter] = bisseccao(f, a, b, eps)
    if f(a) * f(b) >= 0 then
        error("O sinal da função deve ser oposto nos extremos do intervalo [a, b]."); 
    end
    
    iter = 0; 
    while %t // Loop infinito controlado internamente 
        iter = iter + 1; 
        x_root = (a + b) / 2; 
        
        // Critério de parada: |f(xk)| <= eps E |bk - ak| <= eps
        if abs(f(x_root)) <= eps & abs(b - a) <= eps then 
            break; 
        end
        
        if f(a) * f(x_root) < 0 then 
            b = x_root; 
        else 
            a = x_root; 
        end 
    end
endfunction

// Tolerância definida no enunciado
epsilon = 1e-3;

deff("y = f1(x)", "y = x^2 + log(x)");
[raiz1, it1] = bisseccao(f1, 0.5, 1, epsilon); 
printf("(a) Raiz aprox: %f | Iterações: %d | f(xk): %e\n", raiz1, it1, f1(raiz1)); 

deff("y = f2(x)", "y = exp(x) - x - 2"); 
[raiz2, it2] = bisseccao(f2, 1, 2, epsilon);
printf("(b) Raiz aprox: %f | Iterações: %d | f(xk): %e\n", raiz2, it2, f2(raiz2)); 

deff("y = f3(x)", "y = x^3 + x - 100");
[raiz3, it3] = bisseccao(f3, 4, 5, epsilon);
printf("(c) Raiz aprox: %f | Iterações: %d | f(xk): %e\n", raiz3, it3, f3(raiz3)); 

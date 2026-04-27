clc;
clear;
function [x_root, iter] = falsa_posicao(f, a, b, eps)
    iter = 0;
    x_root = a; 
    
    // O loop continua ENQUANTO ( |f(x)| > eps OU |b-a| > eps )
    // Isso garante que ele só pare quando AMBOS forem satisfeitos.
    while (abs(f(x_root)) > eps | abs(b - a) > eps) & iter < 1000
        iter = iter + 1;
        
        // Cálculo do ponto
        x_root = (a * f(b) - b * f(a)) / (f(b) - f(a));
        
        if f(a) * f(x_root) < 0 then
            b = x_root;
        else
            a = x_root;
        end
    end 
endfunction

// --- DEFINIÇÃO DAS FUNÇÕES
deff("y = f1(x)", "y = x^2 + log(x)");
deff("y = f2(x)", "y = exp(x) - x - 2");
deff("y = f3(x)", "y = x^3 + x - 100");

// Tolerância definida no enunciado
epsilon = 1e-3;

// Execução e Prints
[raiz1_fp, it1_fp] = falsa_posicao(f1, 0.5, 1, epsilon);
printf("(a) FP - Raiz: %f | Iterações: %d | f(xk): %e\n", raiz1_fp, it1_fp, f1(raiz1_fp));

[raiz2_fp, it2_fp] = falsa_posicao(f2, 1, 2, epsilon);
printf("(b) FP - Raiz: %f | Iterações: %d | f(xk): %e\n", raiz2_fp, it2_fp, f2(raiz2_fp));

[raiz3_fp, it3_fp] = falsa_posicao(f3, 4, 5, epsilon);
printf("(c) FP - Raiz: %f | Iterações: %d | f(xk): %e\n", raiz3_fp, it3_fp, f3(raiz3_fp));

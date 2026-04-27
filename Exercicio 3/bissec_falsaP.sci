clc;
clear;
// --- FUNÇÕES DOS MÉTODOS ---
function [x_root, iter] = bisseccao(f, a, b, eps)
    if f(a) * f(b) >= 0 then error("Sinal deve ser oposto."); end 
    iter = 0;
    while %t 
        iter = iter + 1; 
        x_root = (a + b) / 2; 
        if abs(f(x_root)) <= eps | abs(b - a) <= eps then break; end 
        if f(a) * f(x_root) < 0 then b = x_root; else a = x_root; end 
    end
endfunction

function [x_root, iter] = falsa_posicao(f, a, b, eps)
    iter = 0; x_root = a; 
    while (abs(f(x_root)) > eps & abs(b - a) > eps) & iter < 1000 
        iter = iter + 1; 
        x_root = (a * f(b) - b * f(a)) / (f(b) - f(a)); 
        if f(a) * f(x_root) < 0 then b = x_root; else a = x_root; end 
    end 
endfunction

// --- RESOLUÇÃO DO EXERCÍCIO 3 ---
epsilon = 1e-6; // Para garantir 5 casas exatas
deff("y = f_raiz(x)", "y = x^6 - 1249");

// Execução Bisseccao
tic();
[raiz_b, it_b] = bisseccao(f_raiz, 3, 4, epsilon);
tempo_b = toc();

// Execução Falsa Posição
tic();
[raiz_f, it_f] = falsa_posicao(f_raiz, 3, 4, epsilon);
tempo_f = toc();

// --- EXIBIÇÃO DOS RESULTADOS ---
printf("\n================ COMPARATIVO EXERCÍCIO 3 ================\n");
printf("Método       | Raiz Obtida  | Iterações | Tempo CPU (s)\n");
printf("-----------------------------------------------------------\n");
printf("Bisseccao    | %12.7f | %9d | %10.8f\n", raiz_b, it_b, tempo_b);
printf("Falsa Pos.   | %12.7f | %9d | %10.8f\n", raiz_f, it_f, tempo_f);
printf("===========================================================\n");

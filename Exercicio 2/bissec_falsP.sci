clc;
clear;
// --- MÉTODO DA BISSECÇÃO ---
function [x_root, iter] = bisseccao(f, a, b, eps)
    tic();
    iter = 0; 
    while %t
        iter = iter + 1;
        x_root = (a + b) / 2;
        
        // Critério da imagem: |f(xk)| <= eps OU |bk - ak| <= eps
        if abs(f(x_root)) <= eps | abs(b - a) <= eps then 
            break;
        end
        
        if f(a) * f(x_root) < 0 then 
            b = x_root; 
        else
            a = x_root; 
        end
    end
    timea = toc();
endfunction

// --- MÉTODO DA FALSA POSIÇÃO ---
function [x_root, iter] = falsa_posicao(f, a, b, eps)
    tic();
    iter = 0;
    x_root = a; 
    // Continua enquanto AMBOS forem maiores que eps (para parar quando UM for satisfeito)
    while (abs(f(x_root)) > eps & abs(b - a) > eps) & iter < 1000 
        iter = iter + 1; 
        x_root = (a * f(b) - b * f(a)) / (f(b) - f(a)); 
        if f(a) * f(x_root) < 0 then 
            b = x_root; 
        else
            a = x_root; 
        end
    end 
    timeb = toc();
endfunction

epsilon = 1e-5;
deff("y = fa(x)", "y = exp(-x) - sin(x)");
deff("y = fb(x)", "y = x^3 - x*exp(x) + 3");
deff("y = fc(x)", "y = sin(x) - log(x)");

// Função A
tic(); [r1b, i1b] = bisseccao(fa, 0, 1, epsilon); t1b = toc();
tic(); [r1f, i1f] = falsa_posicao(fa, 0, 1, epsilon); t1f = toc();

// Função B
tic(); [r2b, i2b] = bisseccao(fb, 1, 2, epsilon); t2b = toc();
tic(); [r2f, i2f] = falsa_posicao(fb, 1, 2, epsilon); t2f = toc();

// Função C
tic(); [r3b, i3b] = bisseccao(fc, 2, 3, epsilon); t3b = toc();
tic(); [r3f, i3f] = falsa_posicao(fc, 2, 3, epsilon); t3f = toc();

// --- EXIBIÇÃO DOS RESULTADOS ---
printf("\n================ COMPARATIVO DE DESEMPENHO ================\n");
printf("Func | Metodo     | Raiz       | Iter | Tempo CPU (s)\n");
printf("-----------------------------------------------------------\n");
printf("(a)  | Bisseccao  | %10.6f | %4d | %10.8f\n", r1b, i1b, t1b);
printf("(a)  | Falsa Pos  | %10.6f | %4d | %10.8f\n", r1f, i1f, t1f);
printf("-----------------------------------------------------------\n");
printf("(b)  | Bisseccao  | %10.6f | %4d | %10.8f\n", r2b, i2b, t2b);
printf("(b)  | Falsa Pos  | %10.6f | %4d | %10.8f\n", r2f, i2f, t2f);
printf("-----------------------------------------------------------\n");
printf("(c)  | Bisseccao  | %10.6f | %4d | %10.8f\n", r3b, i3b, t3b);
printf("(c)  | Falsa Pos  | %10.6f | %4d | %10.8f\n", r3f, i3f, t3f);
printf("===========================================================\n");

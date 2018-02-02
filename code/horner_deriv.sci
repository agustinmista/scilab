// Algoritmo de Horner y derivación:
// Parámetros:
//    a - vector horizontal de coeficientes del polinomio 
//        (ordenados crecientemente respecto de su exponente).
//    x - valor en el cual evaluar el polinimio y su derivada.

function [v, df] = hornerDeriv(a, x)
    v = 0;
    df = 0;
    
    [m, n] = size(a);
    if(m <> 1) then
        error("La dimensión de a es incorrecta.");
    end
    
    // Evalúo el polinomio.
    for( i = 1 : n),
        v = v + a(i) * x^(i - 1);
    end
    
    // Obtengo y evalúo su derivada.
    for( i = 1 : n),
        df = df + (i-1) * a(i) * x^(i-2);
    end

endfunction

//-----------------------------------------------------------------------------
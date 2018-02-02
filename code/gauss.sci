// Cargar las funciones necesarias
exec('sustitucion.sci', -1)

// Eliminación de Gauss:
// Parámetros: 
//    A - Matriz a escalonar
//    b - Vector de términos independientes

function [M, v] = gauss(A,b)
    [nr nc] = size(A);
    [bm bn] = size(b);
    
    if (nr <> nc) then
        error("La matriz no es cuadrada.");
    end
    if (bm <> nr | bn <> 1) then
        error("El vector no tiene la dimensión correcta.")
    end
    
    A = [A b];
    
    for (k = 1 : nr),
        for (i = k+1 : nr),
            m = A(i, k) / A(k, k);
            for (j = k : nc+1),
                A(i, j) = A(i, j) - m * A(k, j);
            end
        end
    end

    M = A(:, 1 : nc);
    v = A(:, nc+1);

endfunction

//-----------------------------------------------------------------------------

// Eliminación de Gauss con pivoteo parcial:
// Parámetros: 
//    A - Matriz a escalonar
//    b - Vector de términos independientes

function [M, v] = gauss_pp(A,b) 
    [nr nc] = size(A);
    [bm bn] = size(b);
    
    if (nr <> nc) then
        error("La matriz no es cuadrada.");
    end
    if (bm <> nr | bn <> 1) then
        error("El vector no tiene la dimensión correcta.")
    end
    
    A = [A b];
    
    for (k = 1 : nr-1),
        [q, c] = max(abs(A(k : nr, k)));
        c = c + k - 1;
        t = A(k, :);
        A(k, :) = A(c, :);
        A(c, :) = t;
        for (i = k+1 : nr),
            m = A(i, k) / A(k, k);
            for (j = k : nc+1),
                A(i, j) = A(i, j) - m * A(k, j);
            end
        end
    end
    
    M = A(:, 1 : nc);
    v = A(:, nc+1);
    
endfunction

//-----------------------------------------------------------------------------

// Resolución de sistemas usando eliminación de Gauss con pivoteo parcial:
// Parámetros: 
//    A - Matriz de coeficientes
//    b - Vector de términos independientes

function ans = gauss_solve(A, b)
    [A2, b2] = gauss_pp(A, b);
    ans = sust_atras(A2, b2);
endfunction
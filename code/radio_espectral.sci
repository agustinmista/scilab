// Radio espectral de una matriz:
// Parámetros:
//    A - Matriz
// Nota: el radio espectral es el máximo del valor absoluto de los autovalores de A.

function ans = radio_espectral(A)
    ans = max(abs(spec(A)));
endfunction

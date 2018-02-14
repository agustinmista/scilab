// Cargar las funciones necesarias
exec('definida_positiva.sci', -1)

// Factorizacion de Cholesky
// Parámetros:
//     A - matriz simetrica definida positiva a factorizar
//
// Nota: A = L L^T

function ans = cholesky(A)

  if (A <> A')
    error("La matriz no es simetrica");
  end
    
  if (~ definida_positiva(A))
    error("La matriz no es definida positiva");
  end
    
  [m n] = size(A);
  
  L = zeros(n, n);
  for (i = 1:n),

    L(i, i) = sqrt(A(i, i) - L(i, :) * L(i, :)');

    for (j = i+1 : n),
        L(j, i) = (A(j, i) - L(i, :) * L(j, :)') / L(i, i);
    end
  end       
 
  ans = L;
endfunction


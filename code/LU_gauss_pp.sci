// Eliminación LU de Gauss con pivoteo parcial:
// Parámetros: 
//    A - Matriz a escalonar

function [P, L, U] = LU_gauss_pp(A) 
 
  [m, n] = size(A);
  
  U = A;
  L = eye(m, n);
  P = eye(m, n);
  
  for (k = 1 : m-1),
    
    // Encuentro el mejor elemento pivote
    [v, i] = max(abs(A(k:m, k)));
    i = i + k - 1;
    
    // Intercambio las filas
    if (i <> k)  then
      U([k i], k:m) = U([i k], k:m);
      L([k i], 1:k-1) = L([i k], 1:k-1);
      P([k i], :) = P([i k], :);
    end
     
    // Obtengo los valores de L y U
    for (j = k+1 : m),
      
      L(j, k) = U(j, k) / U(k, k);
      
      for (c = k : m),
        U(j, c) = U(j, c) - L(j, k) * U(k, c);
      end
    
    end
  end
  
endfunction
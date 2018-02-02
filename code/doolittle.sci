// Factorización LU usando el método de Doolittle
// L es triangular inferior con 1's en la diagonal
// U es triangular superior
// Parámetros:
//     A - matriz

function [L, U] = doolittle(A)
  [nr, nc] = size(A);
  L = zeros(nr, nc);
  U = zeros(nr, nc);

  for (j = 1 : nc),
    for (i = 1 : nr),
      
      // Estamos por encima de la diagonal, hallamos elemento de U
      if (i <= j) then
        U(i,j) = A(i,j);
        
        for (k = 1 : i-1),
          U(i, j) = U(i, j) - L(i, k) * U(k, j);
        end
        
      end
      
      // Estamos por debajo de la diagonal, hallamos elemento de L
      if (j <= i) then
        L(i, j) = A(i, j);
        
        for (k = 1 : j-1)
          L(i,j) = L(i,j)-L(i,k)*U(k,j);
        end
        
        L(i, j) = L(i,j) / U(j, j);
      end
      
    end
  end
  
endfunction

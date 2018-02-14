// Test de matrices definidas positivas
// Parámetros:
//     A - matriz cuadrada
//
// Nota: una matriz es DP si x^T A x > 0. 
// Nota: utiliza el criterio de Sylvester, todos los determinantes
//       de las menores principales de la matriz son positivos. 

function ans = definida_positiva(A)
  
  if (A <> A')
    error("La matriz no es simetrica");
  end
  
  [m,_] = size(A);
    
  x = %T;
  
  for (i = 1 : m),
    subA = A(1 : i, 1 : i);
    
    if(det(subA) <= 0); 
      x = %F;
      break;
    
    end
  end
  
  ans = x;
    
endfunction
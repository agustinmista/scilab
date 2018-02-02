// Cargar las funciones necesarias
exec('sustitucion.sci', -1)

// Factorización LU:
// Parámetros: 
//    A - Matriz a factorizar

function [L, U] = LU(A)
  [nr nc] = size(A);
  L = eye(A);

  if (nr <> nc) then
    error("La matriz no es cuadrada.");
  end

  for (k = 1 : nr),
    for (i = k+1 : nr),
      
      m = A(i, k) / A(k, k);
      L(i, k) = m;
      
      for (j = k : nc),
        A(i, j) = A(i, j) - m * A(k, j);
      end
      
    end
  end
  U = A;     
  
endfunction

//-----------------------------------------------------------------------------

// Resolución de sistemas con factorización LU:
// Parámetros: 
//    A - Matriz de coeficientes
//    b - Vector de términos independientes

function ans = LU_solve(A, b)
  [L, U] = LU(A);
  g = sust_adelante(L, b);
  ans = sust_atras(U, g);
endfunction

//-----------------------------------------------------------------------------

// Deteriminante utilizando U:
// Parámetros: 
//    A - Matriz original

function ans = LU_det(A)
  [L, U] = LU(A);
  [nr, nc] = size(U);
  
  ans = 1;
  for (i = 1 : nr),
    ans = ans * U(i, i);
  end
endfunction

//-----------------------------------------------------------------------------

// Factorización PA = LU
// P matriz de permutación
// L matriz triangular inferior con unos en la diagonal
// U matriz triangular superior
// Parámetros:
//    A - matriz a factorizar

function [P, L, U] = PALU(A) 
  [nr nc] = size(A);
  
  if (nr <> nc) then
    error("La matriz no es cuadrada.");
  end
  
  P = eye(A);
  L = eye(A);
  
  // Calculo la matriz de permutación
  for (k = 1 : nr),
    [_, c] = max(abs(A(k : nr, k)));
    c = c + k - 1;
    
    t = A(k, :);
    A(k, :) = A(c, :);
    A(c, :) = t;
    
    p = P(k, :);
    P(k, :) = P(c, :);
    P(c, :) = p;
  end  
    
  // Eliminación Gaussiana
  for (k = 1 : nr),
    for (i = k+1 : nr),
      m = A(i, k) / A(k, k);
      L(i, k) = m;
      
      for (j = k : nc),
        A(i, j) = A(i, j) - m * A(k, j);
      end
      
    end
  end
  U = A;
  
endfunction

//-----------------------------------------------------------------------------

// Resolución de sistemas con factorización PA = LU:
// Parámetros: 
//    A - Matriz de coeficientes
//    b - Vector de términos independientes

function ans = PALU_solve(A, b)
    [nr nc] = size(A);
    
    if (nr <> nc) then
        error("La matriz no es cuadrada.");
    end
    
    [P, L, U] = PALU(A)
    b = P * b
    g = sust_adelante(L, b);
    ans = sust_atras(U, g);
endfunction

//-----------------------------------------------------------------------------

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

//-----------------------------------------------------------------------------

// Resolución de sistemas con factorización LU usando el método de Doolittle:
// Parámetros: 
//    A - Matriz de coeficientes
//    b - Vector de términos independientes

function ans = doolittle_solve(A, b)
  [L, U] = doolittle(A);
  g = sust_adelante(L, b);
  ans = sust_atras(U, g);
endfunction

//-----------------------------------------------------------------------------

// Factorización LU usando el método de Crout
// L es una matriz triangular inferior 
// U es una triangular superior con 1's en la diagonal.
// Parámetros:
//     A - matriz cuadrada

function [L, U] = crout(A)
  [m, n] = size(A);
  if (m <> n) then
    error('La matriz A debe ser cuadrada')
  end
  
  L = zeros(m, n);
  U = zeros(m, n);
  
  for (i = 1 : m),
    L(i, 1) = A(i, 1);
    U(i, i) = 1;
  end
  
  for (j = 2 : m),
    U(1, j) = A(1, j) / L(1, 1);
  end
  
  for (i = 2 : m),
    for (j = 2 : i)
      L(i, j) = A(i, j) - L(i, 1 : j-1) * U(1 : j-1, j);
    end
    
    for (j = i+1 : m),
      U(i, j) = (A(i, j) - L(i, 1 : i-1) * U(1 : i-1, j)) / L(i, i);
    end
  end
  
endfunction

//-----------------------------------------------------------------------------

// Resolución de sistemas con factorización LU usando el método de Crout:
// Parámetros: 
//    A - Matriz de coeficientes
//    b - Vector de términos independientes

function ans = crout_solve(A, b)
  [L, U] = crout(A);
  g = sust_adelante(L, b);
  ans = sust_atras(U, g);
endfunction
// Factorizacion QR
// Parámetros:
//     A - matriz a factorizar
//
// Nota: Q es ortonormal y es base de span(A) (Q * Q' = I)
// Nota: R es triangular superior y también se puede calcular haciendo Q' * A

function [Q, R] = QR(A)
  [m, n] = size(A)
  
  if rank(A) <> n then
    error('Las columnas de A deben ser LI')
  end
  
  if (A * A' == eye(m)) then    // A ya es ortonormal
    Q = A;
    R = eye(n);
  end   
    
  nu = zeros(n)
  nu(1) = norm(A(:, 1))
  Q = zeros(m, n)
  Q(:, 1) = A(:, 1) / nu(1);
  
  for (k = 2 : n),
    
    suma = 0;
    for (i = 1 : k-1),
      suma = suma + (A(:, k)' * Q(:, i)) * Q(:, i);
    end
    
    nu(k) = norm((A(:, k)) - suma);
    Q(:,k) = (A(:,k) - suma) / nu(k);
  end
  
  R = zeros(n, n);
  for (i = 1 : n),
    R(i, i) = nu(i);
  end
  
  for (j = 1 : n-1),
    for (k = j+1 : n),
      R(j, k) = A(:, k)' * Q(:, j);
    end
  end

endfunction
    
//-----------------------------------------------------------------------------

// Resolución de sistemas mediante factorización QR
//
// Si A es no singular, Q' = inv(Q)
//   Ax = b <-> QRx = b <-> Rx = Q'b
//
// Si rank(A) = n (sol. única) tambien resuelve minimos cuadrados donde
//   E(i) = abs(f(ti) - bi) = abs(a' + b' * ti - bi)
//   E = Ax - b, A = [1 t1; 1 t2; ...; 1 tm], b = [b1; ...; bn], x = [a', b']
//   El conjunto solucion de mínimos cuadrados es A' * Ax = A' * b

function ans = QR_solve(A, b)
    [m, n] = size(A)
    [bm, bn] = size(b)
    
    if ([bm, bn] <> [m, 1]) then
      error('El vector b tiene dimensiones incorrectas')
    end
    
    [Q, R] = QR(A)
    nb = Q' * b
    x = zeros(n)
    x(n) = nb(n) / R(n, n);
    
    for (k = n-1 : -1 : 1),
      x(k) = (nb(k) - R(k, k+1 : n) * x(k+1 : n)) / R(k, k);
    end
    
    ans = x
endfunction

//-----------------------------------------------------------------------------

// Mínimos Cuadrados
// Parámetros:
//    P - matriz con vectores fila representando [x, y]

function minimos_cuadrados(P)
  A(:, 2) = P(:, 1);
  A(:, 1) = 1;

  b = P(:,2);

  x = QR_solve(A, b);
  ord = x(1);
  pend = x(2);

  disp("Aproximación lineal:  "+string(pend)+"x + "+string(ord));
  
  deff("y = f(x)", "y = "+string(pend)+"*x + "+string(ord));
  
  minV = min(P(:,1)) -1;
  maxV = max(P(:,1)) +1;
  
  x = [minV:0.01:maxV];
  plot2d(P(:,1),P(:,2), -4);
  plot2d(x, f(x), 2);

endfunction

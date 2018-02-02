// Interpolación de Newton
// La función devuelve el valor aproximado de una función en un punto mediante
// interpolación por un polinomio en la forma de Newton
// Parámetros:
//    x  -  vector columna
//    y  -  vector columna con los valores de la función en los puntos de x
//    z  -  valor en el que se quiere aproximar la función
//    n  -  grado del polinomio de interpolación a usar

// Nota:
// La función evalúa el siguiente polinomio:
//   Pn(x) = f(x0) + (x-x0)f[x0,x1] + (x-x0)(x-x1)f[x0,x1,x2] + ...
// Donde:
//   f[xi, ..., xi+k] = (f[xi+1, ..., xi+k] - f[xi,...,xi+k-1]) / (xi+k - xi)

function ans = interp_newton(x, y, z, n)
  [xm, xn] = size(x);
  [ym, yn] = size(y);
  
  if (xn <> 1 | yn <> 1) then
    error('Los vectores iniciales deben ser vectores columna')
  end
  if (xm <> ym) then
    error('Los vectores x e y deben tener las mismas dimensiones')
  end
  if (n <= 0) then
    error('El valor de n debe ser positivo')
  end
  if (n + 1 > length(x)) then
    error('No hay suficientes puntos para interpolar')
  end
  
  //El indice para que empieza por 1
  n = n + 1;
  
  //Desarrollo de la matriz DD de diferencias divididas
  m = size(x, 1);
  DD = zeros(m, n);
  DD(:, 1) = y;
  
  for (j = 1 : n),
    for (i = 1 : m-j),
      Djfi = (DD(i+1, j) - DD(i,j)) / (x(i+j) - x(i));
      DD(i, j+1) = Djfi
    end
  end
  
  for (i = 1 : n-1),
    t(i) = (z - x(i));
  end
  
  aprox = y(1);
  for (j = 2 : n),
    producto = 1;
    for (i = 1 : j-1),
      producto = producto * t(i);
    end
    aprox = aprox + producto * DD(1, j);
  end
  ans = aprox;
  
endfunction
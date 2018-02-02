// Interpolación de Lagrange
// Parámetros:
//    x  -  vector columna con los valores conocidos de x
//    y  -  vector columna con los valores conocidos de y (mismo orden x)
//    z  -  punto en el que queremos una aproximación del valor de la función
//    n  -  grado máximo del polinomio interpolante

// Nota: 
// la función evalúa el siguiente polinomio:
//    Pn(x) = L0(x)*y0 + L1(x)*y1 + ... + Ln(x)*yn
// donde:
//             (x-x0)(x-x1)...(x-xk-1)(x-xk+1)...(x-xn)
//     Lk(x) = ----------------------------------------
//              (xk-x0)...(xk-xk-1)(xk-xk+1)...(xk-xn)

function ans = interp_lagrange(x, y, z, n)
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
  
  //El indice para que empiece por 1
  n = n + 1;
  
  for (k = 1 : n),
    L(k) = 1;
    for (i = 1 : n),
      if (i <> k) then
        L(k) = L(k) * (z - x(i)) / (x(k) - x(i));
      end
    end
  end
  
  pol = 0;
  for (k = 1 : n),
    pol = pol + L(k) * y(k);
  end
  ans = pol;
  
endfunction

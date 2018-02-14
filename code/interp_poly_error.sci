// Cargar las funciones necesarias
exec('derivar.sci', -1)


// Error de la interpolación polinómica en un intervalo
// Parámetros:
//    x  -  vector columna con los valores conocidos de x
//    f  -  función a aproximar
//    n  -  grado máximo del polinomio interpolante

// Fórmula general del error:
//    e(x) = | f(x) - Pn(val) | 
//         = max_{x in min(x)..max(x)}  | (x-x0)...(x-xn) | / (n+1)! 
//         * max_{cx in min(x)..max(x)} | f^(n+1)(cx) |

function ans = interp_poly_error(x, f, n)
  
  if (n + 1 > length(x)) then
    error('No hay suficientes puntos para interpolar')
  end
  
  pol = poly(x(1:n+1), "x", "roots");
  
  psi = [x(1):0.001:x(n+1)];
  for (i = 1 : length(psi)),
    psi(i) = horner(pol, psi(i));
  end
  
  cx = [x(1):0.001:x(n+1)];
  for (i = 1 : length(cx)),
    cx(i) = derivar(f, cx(i), n+1);
  end

  ans = max(abs(psi)) * max(abs(cx)) / factorial(n+1);
  
endfunction

//-----------------------------------------------------------------------------

// Error de la interpolación polinómica en un punto
// Parámetros:
//    x  -  vector columna con los valores conocidos de x
//    f  -  función a aproximar
//    val  -  punto en el que queremos una aproximación del valor de la función
//    n  -  grado máximo del polinomio interpolante

// Fórmula del error usada acá:
//    e(val) = | f(val) - Pn(val) | 
//           = | (val-x0)...(val-xn) | / (n+1)! 
//           * max_{cx in min(x)..max(x)} | f^(n+1)(cx) |

function ans = interp_poly_error_puntual(x, f, val, n)
  
  if (n + 1 > length(x)) then
    error('No hay suficientes puntos para interpolar')
  end
  
  e = 1;
  for (i = 1 : n+1),
    e = e * (val - x(i));
  end
  e = abs(e) / factorial(n+1);
  
  cx = [x(1):0.001:x(n+1)];
  for (i = 1 : length(cx)),
    cx(i) = derivar(f, cx(i), n+1);
  end
  cx = max(abs(cx));

  ans = abs(e * cx);
  
endfunction

//-----------------------------------------------------------------------------

// Error de la interpolación polinómica en un punto conociendo la cota de
// la derivada.
// Parámetros:
//    x  -  vector columna con los valores conocidos de x
//    val  -  punto en el que queremos una aproximación del valor de la función
//    n  -  grado máximo del polinomio interpolante

// Fórmula del error usada acá:
//    e(val) = | f(val) - Pn(val) | 
//           = | (val-x0)...(val-xn) | / (n+1)! 
//           * | cota |

function ans = interp_poly_error_cota(x, val, n, cota)
  
  if (n + 1 > length(x)) then
    error('No hay suficientes puntos para interpolar')
  end
  
  e = 1;
  for (i = 1 : n+1),
    e = e * (val - x(i));
  end
  e = abs(e) / factorial(n+1);

  ans = e * abs(cota);
  
endfunction
// Regla del Trapecio compuesto:
// Aplica la regla del Trapecio con n subintervalos de igual longitud. Aproxima
// la función mediante polinomios de interpolación (Lagrange) de grado n.
// Obs: Para el método simple se debe tomar 1 subintervalo.
// Parámetros:
//    a  -  punto inicial intervalo de integración.
//    b  -  punto final intervalo de integración.
//    f  -  función a integrar. Debe ser string.
//    n  -  número de subintervalos usados al aplicar la regla.

function ans = integ_trapecio(f, a, b, n)
  
  deff('y=f(x)','y='+f);
  
  //Longitud de los intervalos
  h = (b - a) / n;
  
  //Definición de los n+1 puntos
  x0 = a;
  for (i = 1 : n),
    x(i) = a + i*h;
  end

  // Aplicación de la regla en los n+1 puntos
  T = f(x0) / 2;
  for (i = 1 : n-1);
    T = T + f(x(i));
  end
  T = T + f(x(n)) / 2;
  ans = h * T
  
endfunction

// Wrapper para el metodo simple
function ans = integ_trapecio_simple(f, a, b)
  ans = integ_trapecio(f, a, b, 1);
endfunction

//------------------------------------------------------------------------------

// Error exacto del método compuesto del Trapecio.
// Parámetros:
//    a  -  punto inicial intervalo de integración.
//    b  -  punto final intervalo de integración.
//    cota  -  cota de la derivada segunda de la función a integrar.
//    n  -  número de subintervalos usados al aplicar la regla.
// Obs: para el método simple usar n=2

function ans = integ_trapecio_error_ex(a, b, cota, n)
    h = (b - a) / n;
    ans = (-h^2 * (b-a) / 12) * abs(cota);
endfunction

//------------------------------------------------------------------------------

// Estimación del error del método del trapecio.
// Parámetros:
//    a  -  punto inicial intervalo de integración.
//    b  -  punto final intervalo de integración.
//    f  -  función a integrar. Debe ser string.
//    n  -  número de subintervalos usados al aplicar la regla.
// Obs: para el método simple usar n=1

function ans = integ_trapecio_error_es(f, a, b, n)
    deff('y=f(x)','y='+f);
    h = (b - a) / n;
    ans = (-h^2 / 12) * (derivative(f, b) - derivative(f, a));
endfunction

//------------------------------------------------------------------------------

// Regla del Trapecio para funciones de dos variables:
// Obs.: Para el método simple se toman 2 subintervalos.
// Parámetros:
//    f  -  función a integrar (string), debe tener la forma S(exp(x,y))dx.dy
//    x0  -  punto inicial intervalo de integración x.
//    x1  -  punto final intervalo de integración x.
//    y0  -  punto inicial intervalo de integración y.
//    y1  -  punto final intervalo de integración y.
//    v  -  variable interna de integracion.
//    xn  -  número de subintervalos usados al aplicar la regla sobre x.
//    yn  -  número de subintervalos usados al aplicar la regla sobre y.

function ans = integ_trapecio_bi(f, x0, x1, y0, y1, xn, yn)
  
  //Longitud de los intervalos
  xh = (x1 - x0) / xn;
  
  //Definición de los n+1 puntos
  for (i = 1 : xn),
    x(i) = x0 + i*xh;
  end
  
  //Aplicación de la regla en los n+1 puntos
  T = "("+string(1/2)+"*"+strsubst(f, "x", string(x0));
  for (i = 1 : xn-1);
    T = T+"+"+strsubst(f, "x", string(x(i)));
  end
  T = T+"+"+string(1/2)+"*"+strsubst(f, "x", string(x(xn)))+")";
  T = T+"*"+string(xh);
  T = strsubst(T, "y", "x");
  
  disp("Se transformo f(x,y) = "+f);
  disp("en g(x) = "+T);
  
  ans = integ_trapecio(T, y0, y1, yn);
  
endfunction

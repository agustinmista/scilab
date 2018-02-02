// Cargar las funciones necesarias
exec('derivar.sci', -1)

// Regla de Simpson Compuesta:
// Aplica la regla de Simpson con n subintervalos de igual longitud.
// Aproxima la función mediante polinomios de interpolación de grado n.
// Obs.: Para el método simple se toman 2 subintervalos
// Parámetros:
//    a  -  punto inicial del intervalo de integración
//    b  -  punto final del intervalo de integración
//    f  -  función a integrar. Debe ser string.
//    n  -  números de subintervalos usados al aplicar la regla.
//          Debe ser entero no negativo y par.

function ans = integ_simpson(f, a, b, n)
  
  if (modulo(n,2) <> 0) then
    error('El numero de intervalos debe ser par');
  end
  
  deff('y=f(x)','y='+f);
  
  //Longitud de los intervalos
  h = (b - a) / n;
  
  //Definición de los n+1 puntos
  x0 = a;
  for (i = 1 : n),
    x(i) = a + i*h;
  end
  
  //Aplicación de la regla en los n+1 puntos
  S = f(x0);
  for (i = 1 : n-1),
    if (modulo(i, 2) <> 0) then
      S = S + 4 * f(x(i));
    else
      S = S + 2 * f(x(i));
    end
  end
  S = S + f(x(n));
  ans = S * (h/3);
  
endfunction

// Wrapper para el metodo simple
function ans = integ_simpson_simple(f, a, b)
  ans = integ_simpson(f, a, b, 2);
endfunction

//------------------------------------------------------------------------------

// Error exacto del método compuesto de Simpson.
// Parámetros:
//   a  -  punto inicial intervalo de integración.
//   b  -  punto final intervalo de integración.
//   cota  -  cota de la derivada cuarta de la función a integrar.
//   n  -  número de subintervalos usados al aplicar la regla.
// Obs: para el método simple usar n=2

function ans = integ_simpson_error_ex(a, b, cota, n)
    h = (b - a) / n;
    ans = (-h^4 * (b - a) / 180) * abs(cota);
endfunction

//------------------------------------------------------------------------------

// Estimación del error del método de Simpson.
// Parámetros:
//    a  -  punto inicial intervalo de integración.
//    b  -  punto final intervalo de integración.
//    f  -  función a integrar. Debe ser string.
//    n  -  número de subintervalos usados al aplicar la regla.
// Obs: para el método simple usar n=2

function ans = integ_simpson_error_es(f, a, b, n)
    h = (b - a) / n;
    ans = (-h^4 / 180) * (derivar(f, b, 3) - derivar(f, a, 3));
endfunction

//------------------------------------------------------------------------------

// Regla del Simpson para funciones de dos variables:
// Aplica la regla del Trapecio con n subintervalos de igual longitud. Aproxima
// la función mediante polinomios de interpolación (Lagrange) de grado n.
// Obs.: Para el método simple se toma 1 subintervalo
// Parámetros:
//    f  -  función a integrar (string), debe tener la forma S(exp(x,y))dx.dy
//    x0  -  punto inicial intervalo de integración x.
//    x1  -  punto final intervalo de integración x.
//    y0  -  punto inicial intervalo de integración y.
//    y1  -  punto final intervalo de integración y.
//    xn  -  número de subintervalos usados al aplicar la regla sobre x.
//    yn  -  número de subintervalos usados al aplicar la regla sobre y.

function ans = integ_simpson_bi(f, x0, x1, y0, y1, xn, yn)
    
  if (modulo(xn, 2) <> 0 | modulo(yn, 2) <> 0) then
    error('El numero de intervalos debe ser par.');
  end
    
  //Longitud de los intervalos
  xh = (x1 - x0) / xn;
  
  //Definición de los n+1 puntos
  for (i = 1 : xn),
    x(i) = x0 + i*xh;
  end
  
  //Aplicación de la regla en los n+1 puntos
  S = "("+strsubst(f, "x", string(x0));
  for (i = 1 : xn-1);
    if (modulo(i, 2) <> 0) then
      S = S+"+4*"+strsubst(f, "x", string(x(i)));
    else
      S = S+"+2*"+strsubst(f, "x", string(x(i)));
    end
  end
  S = S+"+"+strsubst(f, "x", string(x(xn)))+")"
  S = S+"*"+string(xh/3);
  S = strsubst(S, "y", "x");
  
  disp("Se transformo f(x,y) = "+f);
  disp("en g(x) = "+S);
  
  ans = integ_simpson(S, y0, y1, yn);
  
endfunction

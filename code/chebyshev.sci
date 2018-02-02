// Calcula las raices del polinomio de Chebyshev de grado g
// Parámetros:
//        g  -  grado del polinomio de Chebyshev

function ans = chebyshev(g)
  for (i = 1 : g),
    ans(i) = cos((%pi / 2) * ((2 * i-1) / g))
  end
endfunction

//------------------------------------------------------------------------------

// Cambio lineal de intervalo para nodos de Chebyshev.
// Calcula los nodos del polinomio de Chebyshev para intervalos
// distintos de [-1:1].
// Parámetros:
//    a, b - extremos del polinomio.
//    g - grado del polinomio.

function ans = chebyshev_interval(a, b, g)
    deff("y = f(x)","y = ((b + a) + x * (b - a)) / 2");
    ans = feval(chebyshev(g), f);
endfunction

//------------------------------------------------------------------------------

// Obtiene los vectores nodos de interpolacion de Chebyshev para una
// funcion en un intervalo dado.
// Parámetros:
//    f - funcion a aproximar (String)
//    a, b - intervalo de interpolacion.
//    g - grado del polinomio.

function [x, y] = chebyshev_function_nodes(f, a, b, g)
  deff("y = f(x)","y = "+f);
  x = chebyshev_interval(a, b, g)
  y = feval(x, f);
endfunction
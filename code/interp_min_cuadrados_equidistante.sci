// Cargar las funciones necesarias
exec('interp_min_cuadrados.sci', -1)

// Ejercicio 9 - Práctica 7

function P7ej9(n)
  deff("y = f(x)", "y = 1/(1+x^2)");
  x = [-5:(10/n):5];    // intervalo uniformemente espaciado
  y = feval(x, f);
  
  p = interp_min_cuadrados(x', y', n, %F);
  
  g = [-5:0.01:5];
  plot2d(g, feval(g, f)-horner(p, g));
  
  plot(g, feval(g, f), "r");
  plot(g, horner(p, g), "b");
endfunction
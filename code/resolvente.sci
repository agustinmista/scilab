// Halla las dos raíces de una ecuación cuadrática aplicando la resolvente:
// Parámetros: 
//    a,b,c - coeficientes de la función cuadrática (ax^2 + bx + c)
function [x,y] = resolvente(a, b, c)
  disc = sqrt(b^2 - 4*a*c)
  x = (-b + disc) / (2*a)
  y = (-b - disc) / (2*a)
endfunction

// Versión alternativa
function [x,y] = resolvente_alt(a, b, c)
  disc = sqrt(b^2 - 4*a*c)
  x = (2*c) / (-b - disc)
  y = (2*c) / (-b + disc)
endfunction

//-----------------------------------------------------------------------------

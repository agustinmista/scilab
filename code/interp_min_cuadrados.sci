// Aproximación Polinomial de Mínimos Cuadrados
// Obs.: Esta función es para el caso particular de aproximación por polinomios
//       Para aproximar utilizando otras funciones hay que modificar las columnas
//Parámetros:
//   x  -   vector columna
//   y  -   vector columna de igual dimensión que x
//   g  -   grado del polinomio de aproximación
//   flag - bandera para realizar o no el gráfico

function  sol = interp_min_cuadrados(x, y, n, flag)
  [xm, xn] = size(x);
  [ym, yn] = size(y);
  
  if (xn <> 1 | yn <> 1) then
    error('Los vectores iniciales deben ser vectores columna')
  end
  if (xm <> ym) then
    error('Los vectores x e y deben tener las mismas dimensiones')
  end
  if (n < 0) then
    error('El valor de n debe ser no-negativo')
  end
  if (n + 1 > length(x)) then
    error('No hay suficientes puntos para interpolar')
  end
    
  p = n + 1;
  A = zeros(xm, p);
  
  for (r = 1 : p),
    A(:, r) = x^(r-1);
  end
  
  B = y;
  s = A \ B;
  
  sol = poly(s, 'x', 'coeff');
  disp(sol, "Polinomio interpolante:");
  
  // Error medio
  z = horner(p, x);
  err = y - z;
  err = err^2;
  err = sqrt(sum(err) / n);
  disp(err, "Error medio:");
  
  //Gráfico de los puntos a aproximar y del polinomio de aproximación
  if (flag) then 
  
    minx = min(x);
    miny = min(y);
    maxx = max(x);
    maxy = max(y);
    
    for (i = 1 : xm),
      plot(x(i),y(i),'.')
    end
    
    xe = [minx:0.001:maxx];
    plot2d(xe, horner(sol, xe));  
  end
  
endfunction
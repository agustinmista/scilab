// Cargar las funciones necesarias
exec('LU.sci', -1)


// Aproximación genérica de Mínimos Cuadrados
// Parámetros:
//   x  -   vector columna
//   y  -   vector columna de igual dimensión que x
//   F  -   vector de funciones para interpolar (string)
//   flag - plotea la funcion?

function  ans = interp_min_cuad(x, y, F, flag)
  
  [m _] = size(x);
  [_ p] = size(F);
  
  if (length(x) <> length(y)) then
    error('Los vectores x e y deben tener las mismas dimensiones')
  end
  
  for (i = 1 : p),
    deff('y = phi'+string(i)+'(x)', 'y = '+F(i));
  end
  
  A = zeros(m, p);
  for (i = 1 : m),
    for (j = 1 : p),
      eq = "phi"+string(j)+"("+string(x(i))+")";
      A(i, j) = eval(eq);
    end
  end
 
  coeffs = LU_solve(A'*A, A'*y);
  
  expr = "(" + string(coeffs(1)) + ")*" + F(1);
  for (i = 2 : p),
    expr = expr + " + (" + string(coeffs(i)) + ")*" + F(i);
  end
  
  disp("ls(x) = " + expr);
  deff('y = ls(x)', 'y = ' + expr);
  
  // Error medio
  z = ls(x);
  err = y - z;
  err = err^2;
  err = sqrt(sum(err) / m);
  disp("Error medio cuadrado: " + string(err));
  
  if (flag) then 
    minx = min(x);
    maxx = max(x);
    
    for (i = 1 : m),
      plot(x(i), y(i),'.')
    end
    
    fx = [minx : 0.01 : maxx];
    plot(fx, ls);  
  end

  ans = coeffs;

endfunction

//--------------------------------------------------------------------------

// Aproximación Polinomial de Mínimos Cuadrados 
// Obs.: Esta función es para el caso particular de aproximación por
// polinomios Para aproximar utilizando otras funciones hay que modificar
// las columnas
// Parámetros:
//   x  -   vector columna
//   y  -   vector columna de igual dimensión que x
//   g  -   grado del polinomio de aproximación
//   flag - bandera para realizar o no el gráfico

function  sol = interp_min_cuad_poly(x, y, n, flag)
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
    maxx = max(x);
    
    for (i = 1 : xm),
      plot(x(i),y(i),'.')
    end
    
    xe = [minx:0.001:maxx];
    plot2d(xe, horner(sol, xe));  
  end
  
endfunction

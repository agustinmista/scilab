// Método de Newton para resolver la raiz de arctan(x)
// Parámetros: 
//    x0 - aproximación inicial
//    nMax - número máximo de iteraciones
// Nota : el método puede no converger dependiendo de la elección de x0

function ans = newton_arctan(x0,  nMax)
  
  xPrev = x0;
    
  for (n = 0 : nMax),
    dx = 1 / (1 + xPrev^2)
    x = xPrev - (atan(xPrev) / dx);
    
    if (abs(atan(x)) < 10^(-9)) then
      break;
    end
    
    xPrev = x;
  end

  disp ("Número de iteraciones: " + string(n));  
  ans = x;
endfunction

//-----------------------------------------------------------------------------

// Método de Newton combinado con bisección
// Parámetros: 
//    f - función (String)
//    df - derivada de la función (String)
//    a, b - intervalo para usar el método de la bisección
//    x0 - aproximación inicial
//    eps - precisión de la aproximación
//    nMax - número máximo de iteraciones
// Nota : el método puede no converger dependiendo de la elección de x0

function ans = newton_bisecc(f, df, a, b, x0, eps, nMax)
  deff("y = f(x)", "y = "+f)
  deff("y = df(x)", "y = "+df)

  xPrev = x0;
  itersNewton = 0;
  itersBisecc = 0;
  
  for (n = 1 : nMax),
    x = xPrev - (f(xPrev) / df(xPrev));
   
    // El método de Newton falló, tomo x como
    // la mitad del intervalo actual
    if (x < a | x > b) then
      
      x = (b - a) / 2;
      
      // Reduzco el intervalo adecuadamente
      if (f(b)*f(x) < 0) then
        b = x;
      else
        a = x;
      end
      
      // Cuento una iteración donde corresponda
      itersBisecc = itersBisecc + 1;
    else
      itersNewton = itersNewton + 1;
    end
   
    // Criterio de corte
    if (abs(f(x)) < eps) then
      break;
    end
    
    xPrev = x;
  end
  
  disp ("Número Total de iteraciones: " + string(n));  
  disp ("Número de iteraciones de Newton: " + string(itersNewton));  
  disp ("Número de iteraciones de biseccion: " + string(itersBisecc));  

  ans = x;
endfunction

//-----------------------------------------------------------------------------
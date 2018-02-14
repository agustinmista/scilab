// Calcula la suma de una serie hasta un valor dado:
// Parámetros: 
//    f - función sobre n
//    a - valor inicial
//    b - valor final

function ans = series_eval(f, a, b)
  deff("y = f(n)", "y ="+f);
  x = a : b;
  
  suma = 0;
  for (n = a : b),
    suma = suma + f(n);
  end 
  
  ans = suma;
  
endfunction

//-----------------------------------------------------------------------------
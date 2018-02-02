// Plotea fácilmete funciones codificadas como string:
// Parámetros: 
//    f - función (String)
//    a , b - límites del plot

function easy_plot(f, a, b)
  deff("y = f(x)", "y ="+f);
  x = a : 0.01 : b;
  y = a : 0.01 : b;
  
  for (i = 1 : length(y)),  
    y(i) = f(x(i));
  end 
  
  disp("Min : "+string(min(y)));
  disp("Max : "+string(max(y)));
  plot(x, f);
endfunction

//-----------------------------------------------------------------------------
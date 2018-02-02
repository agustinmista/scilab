// Función que encuentra los centros y radios de los círculos de Gerschgorin
// (en caso de círculos superpuestos, cambia el espesor de ellos en el gráfico)
// Parámetros:
//    A - matriz cuadrada a coeficientes reales

function [c, r] = gerschgorin(A)

  [m, n] = size(A)

  if (m <> n) then
    error('La matriz debe ser cuadrada');
  end

  // Calculo los círculos de Gerschgorin
  for (i = 1 : m),
    
    //c es un vector que contiene los centros
    c(i) = A(i,i);   
    
    //r es un vector que contiene los radios
    r(i) = 0
    for (j = 1 : n),
      if(i <> j) then
        r(i) = r(i) + abs(A(i, j));
      end
    end
    
  end

  //t es un vector que contiene el espesor de los círculos para graficar
  t = ones(m, 1);
  for (i = 1 : m),
    for (j = 1 : m),
      if (i <> j & c(i) == c(j) & r(i) == r(j)) then
        t(i) = t(i) + 1;  
      end
    end
  end

  for (i = 1 : m),
    disp("λ" + string(i) + " está en el intervalo [" + string(c(i)-r(i))+", " ...
         + string(c(i) + r(i)) + "]");
  end

  ev = spec(A);
  disp(ev', "Autovalores reales usando spec():");
  
  // Plot de los círculos
  maxx = max(c + r);
  minx = min(c - r);
  maxy = max(r);
  miny = -max(r);

  plot2d(0, 0, rect = [minx-1, miny-1, maxx+1, maxy+1]);
  xgrid(1);

  for (i = 1 : n),
    if (r(i) <> 0) then
      x(i) = c(i) - r(i);
      y(i) = r(i);
      w(i) = 2 * r(i);
      h(i) = 2 * r(i);
    end
  end

  for (i = 1 : n),
    // ploteo círculos o bullets en caso de que sean de radio 0
    if (r(i) == 0) then
      plot(c(i), 0, '.b');
    else
      xarc(x(i), y(i), w(i), h(i), 0, 360 * 64);
      arc = get("hdl");
      arc.thickness = t(i);
      arc.foreground = 2;
    end
    // ploteo el autovalor real
    plot(ev(i), 0, 'oblue');
  end
  
endfunction

//-----------------------------------------------------------------------------

// Encuentra los centros y radios de los círculos de Gerschgorin de la matriz
// y de su transpuesta. 
// Parámetros:
//    A - matriz cuadrada a coeficientes reales

function [c1, r1, c2, r2] = gerschgorin_trans(A)
  
    [c1, r1] = gerschgorin(A);
    [c2, r2] = gerschgorin(A');

endfunction
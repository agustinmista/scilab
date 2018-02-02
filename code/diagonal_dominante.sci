// Checkea si una matrix es diagonal dominante.
// Parámetros:
//     A - matriz

function ans = diagonal_dominante(A)
  [nc nr] = size(A);

  // Asumo que A es diagonal dominante
  flag = 1;
  
  for (i = 1 : nr),
    sumrow = 0;
    for (j = 1 : nr),
      if (i ~= j)
        sumrow = sumrow + abs(A(i, j));
      end
    end
    
    // Encuentro una fila que no satisface la condición
    if (abs(A(i, i)) <= sumrow),
      flag = 0;
      break;
    end
    
  end

  if (flag == 1)
    disp('A es diagonal dominante')
  else
    disp('A NO es diagonal dominante')
  end

  ans = flag;
endfunction
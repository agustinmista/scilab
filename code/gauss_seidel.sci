// Cargar las funciones necesarias
exec('diagonal_dominante.sci', -1)
exec('radio_espectral.sci', -1)

// Método de Gauss Seidel:
// Parámetros:
//    A - matriz de coeficientes del sistema.
//    b - término independiente.
//    x - estimación inicial de la solución.
//    eps - presición del método.
//    nMax - cantidad máxima de iteraciones.

function ans = gauss_seidel(A, b, x, eps, nMax)
  [m, n] = size(A);
  [bm, bn] = size(b);
  [xm, xn] = size(x);

  if (m <> n) then
    error("ERROR: La matriz A debe ser cuadrada.");
  end  
  if (bm <> m | bn <> 1) then
    error("ERROR: La dimensión de b es incorrecta.");
  end
  if (xm <> m | xn <> 1) then
    error("ERROR: La dimensión de x es incorrecta.")
  end

  for (it = 0 : nMax),
    x0 = x;
    
    for (i = 1 : n),
      suma = ((A(i, :) * x(:)) - A(i, i) * x(i));
      x(i) = (1 / A(i, i)) * (b(i) - suma);
    end
    
    it = it + 1;
    
    if (norm((x - x0), 2) <= eps) then 
      break;
    end
  end
  
  disp("Cantidad de iteraciones: " + string(it));
  ans = x;
  
endfunction

//-----------------------------------------------------------------------------

// Checkea si la convergencia está garantizada para cualquier aproximación
// inicial usando el método de Gauss-Seidel:
// Parámetros:
//    A - matriz de coeficientes del sistema. 

function ans = gauss_seidel_converge(A)
  [m, n] = size(A);
  [bm, bn] = size(b);

  if (m <> n) then
    error("ERROR: La matriz A debe ser cuadrada.");
  end  
 
  // Checkeo si A es diagonal dominante
  if (diagonal_dominante(A)) then
    disp("La matriz es diagonal dominante. El sistema converge.");
    ans = 1;
  else 
  
    // Sino, checkeo que || I - N^-1 * A || < 1
    N = zeros(m, n);
    for (i = 1 : m),
      for (j = 1 : n),
        if (i >= j) then
          N(i, j) = A(i, j);
        end
      end
    end
 
    disp(N, "N = ");
    
    INA = eye(n, m) - inv(N)*A;
    disp(INA, "I - N^-1 * A = ");
    
    nrm_1 = norm(INA);
    nrm_2 = norm(INA, 2);
    nrm_inf = norm(INA, 'inf');
    
    disp ("|| I - N^-1 * A ||_1   = " + string(nrm_1));
    disp ("|| I - N^-1 * A ||_2   = " + string(nrm_2));
    disp ("|| I - N^-1 * A ||_inf = " + string(nrm_inf));
    
    if (nrm_1 < 1 | nrm_2 < 1 | nrm_inf < 1) then
      disp("El sistema converge");
      ans = 1;
    else
      
      // Checkeo el radio espectral de I - N^-1 * A
      re = radio_espectral(INA);
      disp("Radio espectral de A = " + string(re));
      if (re < 1) then
        disp("Radio espectral de (I-N^(-1)A) = " + re + ". El sistema converge");
        ans = 1;
      else
        disp("El sistema NO converge");
        ans = 0;
      end
    end
  end
endfunction
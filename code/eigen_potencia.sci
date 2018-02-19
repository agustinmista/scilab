// Método de la Potencia: 
// Suponiendo que hay un único autovalor de módulo máximo, la función devuelve
//   una aproximación de dicho autovalor y de su autovector asociado. Además
//   retorna el vector con la progresión del error en cada iteración.
// Parámetros:
//    A  -  matriz cuadrada simétrica con un único autovalor de módulo máximo
//    z0  -  vector de aproximación inicial (¡¡No debe ser nulo!!)
//    maxit -  número máximo de iteraciones a realizar
//    tol  -  tolerancia máxima aceptada

function [aval, avec, err] = eigen_potencia(A, z0, maxit, tol)
  [m, n] = size(A);
  [mz0, nz0] = size(z0)
  
  if (m <> n) then
    error('La matriz debe ser cuadrada');
  end
  if (A <> A') then
    error('La matriz debe ser simétrica');
  end
  if ([mz0, nz0] <> [m, 1]) then
  end
  if (z0 == zeros([m, 1])) then
    error('El vector de aproximacion inicial no tiene la dimensión correcta');
    error('El vector inicial no puede ser nulo');
  end
  
  
  eval = max(abs(spec(A)));
  err = zeros(maxit, 1);
  
  for (i = 1 : maxit),
    w = A * z0;
    z1 = w / norm(w, 'inf');
    k = 1;
    
    while (z0(k) == 0 & k < n),
      k = k + 1;
    end
    
    if (z0(k) == 0) then
      error('El proceso se detuvo en '+string(i)+' iteraciones porque el' ...
            + 'vector es nulo. Error de division por 0.')
    end
    
    lambda = w(k) / z0(k);
    
    if (norm(z0 - z1, 'inf') <= tol) then
      break;
    end
    
    err(i) = abs(eval - lambda);
    z0 = z1;
    
  end
  
  disp('Se realizaron '+string(i)+' iteraciones.');
 
  aval = lambda;
  avec = z1;
  err = err(1:i);
  
endfunction

// Método de la Potencia usando |lambda^k - lambda^(k-1)| como criterio de
// parada:

function [aval, avec] = eigen_potencia_alt(A, z0, maxit, tol)
  
  [m, n] = size(A);
  [mz0, nz0] = size(z0)
  
  if (m <> n) then
    error('La matriz debe ser cuadrada');
  end
  if (A <> A') then
    error('La matriz debe ser simétrica');
  end
  if ([mz0, nz0] <> [m, 1]) then
    error('El vector de aproximacion inicial no tiene la dimensión correcta');
  end
  if (z0 == zeros([m, 1])) then
    error('El vector inicial no puede ser nulo');
  end

  
  lambda0 = %inf;
  
  for (i = 1 : maxit),
    
    // Obtengo una nueva aproximación 
    w1 = A * z0;
    z1 = w1 / norm(w1, 'inf');
    
    // Encuentro la primer componente no nula de z0
    k = 1;
    while (z0(k) == 0 & k < n),
      k = k + 1;
    end
    
    // Calculo la aproximación al autovalor actual
    lambda1 = w1(k) / z0(k);
    
    // Criterio de parada
    // if (abs(lambda1 - lambda0)) then
    if (norm(A*z1 - lambda1*z1, 2) <= tol) then
      break;
    end
    
    // Preparo los datos para la próxima iteración
    z0 = z1;
    lambda0 = lambda1;
    
  end
  
  disp('Se realizaron ' + string(i) + ' iteraciones.');
 
  aval = lambda1;
  avec = z1;
  
endfunction
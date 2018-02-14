// Cargar las funciones necesarias
exec('diagonal_dominante.sci', -1)
exec('radio_espectral.sci', -1)


// Método de Sobre-relajación:
// Parámetros:
//    A - matriz de coeficientes del sistema.
//    b - termino independiente.
//    x - estimación inicial de la solución.
//    w - factor de escala.
//    eps - presición del método.
//    nMax - cantidad máxima de iteraciones.

function ans = SOR(A, b, x, w, eps, nMax)
    [m,n]=size(A);
    [bm,bn]=size(b);
    [xm,xn]=size(x);

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
            x(i) = (1-w) * x(i) + (w / A(i, i)) * (b(i) - suma);
        end
        
        it = it + 1;
        
        if (norm((x - x0), 2) <= eps) then
            break;
        end
        
    end

    disp("Cantidad de iteraciones: " + string(it));     
    ans = x;
    
endfunction

//--------------------------------------------------------------------------

// Parametro de relajación óptimo de SOR para matrices tridiagonales:
// Parámetros:
//    A - matriz tridiagonal definida positiva de coeficientes del sistema.

function ans = tridiag_best_w(A)
  
  [m n] = size(A);
  Tj = eye(m, m) - inv(eye(m, m) * A(1,1)) * A;
  ans = 2 / (1 + sqrt(1 - radio_espectral(Tj)^2));

endfunction

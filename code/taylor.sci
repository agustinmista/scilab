// Cargar las funciones necesarias
exec('derivar.sci', -1)

// Polinomio de Taylor
// Parámetros:
//    f - función a aproximar (String)
//    a - valor alrededor del que aproximar.
//    x - valor donde obtener la aproximación.
//    n - orden del polinomio de Taylor.

function ans = taylor(f, a, x, n)
    deff("y = g(x)", "y = "+f);
    t = g(a);
    
    for(k = 1 : n),
        d = derivar(f,a,k);
        disp(d);
        t = t + (%e^(a) * (x - a)^k / factorial(k));
    end
    
    ans = t;
    
endfunction

// Calcular el error absoluto del polinomio de Taylor
function ans = taylor_error(f, a, x, cota, n)
  deff("y = g(x)", "y = "+f);
  ans = abs(cota) / factorial(n + 1) * (x - a)^(n+1);
endfunction

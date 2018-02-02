// Método de Newton (única ecuación)
// Parámetros: 
//    f - función (String)
//    x0 - aproximación inicial
//    eps - precisión de la aproximación
//    nMax - número máximo de iteraciones
// Nota : el método puede no converger dependiendo de la elección de x0

function ans = newton(f, x0, eps, nMax)
    deff("y = f(x)", "y = "+f)
    xPrev = x0;

    for (n = 0:nMax ),
        x = xPrev - (f(xPrev) / derivative(f, xPrev, 4));
        xPrev = x;
        n = n+1;
        if (abs(f(x)) < eps) then
            break;
        end
    end
    disp ("Número de iteraciones: "+string(n));  
    ans = x;
endfunction

//-----------------------------------------------------------------------------
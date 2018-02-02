// Método de la bisección:
// Parámetros: 
//    f - función (String)
//    a, b - aproximaciones extremas iniciales
//    eps - precisión de la aproximación
//    nMax - número máximo de iteraciones

function ans = biseccion(f, a, b, eps, nMax)
    deff("y = f(x)", "y = "+f);
    c = (a+b)/2;
    n = 0;
    while ((abs(f(c)) > eps) & (n < nMax))

        if ((b-c) > eps) then 
            if ( f(b)*f(c) < 0) then
                a = c;
            else
                b = c;
            end
            c = (a+b)/ 2;
        end
        n = n+1;
    end
    disp ("Cantidad de iteraciones: " + string(n));
    ans = c;
endfunction

//-----------------------------------------------------------------------------
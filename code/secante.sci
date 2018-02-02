// Método de la secante:
// Parámetros: 
//    f - función (String)
//    a , b - aproximaciones extremas iniciales
//    eps - precisión de la aproximacion
//    nMax - número máximo de iteraciones

function ans = secante(f, a, b, eps, nMax)
    deff ( "y = f(x)", " y ="+f);
    c = b - f(b)*(b-a)/(f(b)-f(a));
    n = 0;

    while ( n < nMax & abs(f(c)) > eps)
        y = c - f(c) * (c - b)/(f(c) - f(b));
        b = c;
        c = y;
        n = n+1;
    end
    
    disp ("Número de iteraciones: " + string(n)); 
    ans = c; 
    
endfunction

//-----------------------------------------------------------------------------
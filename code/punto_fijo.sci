// Método iterativo de punto fijo:
// Parámetros: 
//    g - función (String)
//    x0 - aproximación inicial
//    eps - precisión de la aproximación
//    nMax - número máximo de iteraciones
// Nota : g debe ser la ecuacion que queremos resolver de manera
//        tal que    x = g(x)    (despejando x)

function ans = punto_fijo(g, x0, eps, nMax)
    deff("y = g(x)", "y ="+g);
    xPrev = x0;
    x = g(xPrev);
    iters = 0;
    
    for (n = 0 : nMax),
        x = g(xPrev);
        xPrev = x;
        if (abs(x - g(x)) < eps) then
            break;
        end
    end
    
    disp ("Número de iteraciones: "+string(n));  
    ans = x;
endfunction

//-----------------------------------------------------------------------------

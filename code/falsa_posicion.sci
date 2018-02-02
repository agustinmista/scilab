// Método de la falsa posición:
// Parámetros: 
//    f - función (String)
//    a , b - aproximaciones extremas iniciales
//    eps - precisión de la aproximación
//    nMax - número máximo de iteraciones
// Nota : para que el método funcione, a y b deben ser tal que f(a)*f(b) < 0

function ans = falsa_posicion(f, a, b, eps, nMax)
    deff ( "y = f(x)", " y ="+f);
    c = b - f(b)*((b-a)/(f(b)-f(a)));
    n = 0;
    
    if( f(a)*f(b) >= 0) then
        error("Error al elegir a y b. [ f(a)*f(b) < 0 ]");
    else
        while (n < nMax & abs(f(c)) > eps)

            if(f(a)*f(b) < 0) then b = c; end
            if(f(b)*f(c) < 0) then a = c; end 
            if(f(c) == 0) then ans = c;   end

            c = b - f(b)*((b-a)/(f(b)-f(a)));
            n = n+1;
        end
        disp ("Número de iteraciones: " + string(n)); 
        ans = c; 
    end
endfunction

//-----------------------------------------------------------------------------
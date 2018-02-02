// Derivación de funciones:
// Parámetros:
//    f - función (String)
//    v - valor en el cual evaluar la derivada
//    n - orden de derivación
// Nota: la función deriva respecto a la variable x.

function ans = derivar(f, v, n)
    if (n < 1) then
        error("ERROR: El orden de derivación debe ser positivo.");
    else
        deff("y = DF0(x)","y ="+f);
        i=0;
        for i = 1:(n-1), 
            deff("y = DF"+string(i)+"(x)","y=derivative(DF"+string(i-1)+",x,0.01)"); 
        end
        deff("y = DFn(x)", "y = derivative(DF"+string(i)+", x,0.01)");
        ans = DFn(v);
    end
endfunction

//-----------------------------------------------------------------------------

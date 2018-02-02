// Truncamiento:
// Parámetros:
//    x - valor a truncar.
//    n - cantidad de cifras significativas.
function ans = truncar(x, n)
    if (x < 0) then
        s = -1;
    else 
        s = 1;
    end

    x = abs(x);
    
    if (x > 1) then 
        e = 0;
        while (x * 10**e >= 1)
            e = e - 1;
        end
    else 
        if (x < 0.1) then
            e = 0;
            while (x * 10**e < 0.1)
                e = e + 1;
            end
        end
    end

    x = x * 10**(n+e);
    x = int(x);
    x = x * 10**(-(n + e));
    ans = s * x;
endfunction

//-----------------------------------------------------------------------------
    
// Redondeo:
// Parámetros:
//    x - valor a redondear.
//    n - cantidad de cifras significativas.
function ans = redondear(x, n)
    if (x == 0) then
        ans = 0
    else
        if (x < 0) then
             s = -1;
        else 
             s = 1;
        end
        x = abs(x);
        e = 0;
        if (x > 1) then 
             while (x * 10**(e) >= 1)
                  e = e - 1;
             end
        else 
             if (x < 0.1) then
                  while (x * 10**(e) < 0.1)
                      e = e + 1;
                  end
             end
        end
        x = x * 10**(n + e);
        x = round(x);
        x = x * 10**(-(n + e));
        ans = s * x;
    end
endfunction
    
// Error absoluto:
// Parámetros:
//    xv - valor verdadero.
//    xa - valor aproximado.
function ans = errorAbs(xv,xa)
    ans = abs(xv - xa);
endfunction
    
// Error relativo:
// Parámetros:
//    xv - valor verdadero.
//    xa - valor aproximado.
function ans = errorRel(xv,xa)
    ans = errorAbs(xv, xa) / abs(xv);
endfunction
    
// Cantidad de cifras significativas de un valor respecto de su aproximación:
// Parámetros:
//    xv - valor verdadero.
//    xa - valor aproximado.
function ans = cifras(xv, xa)
    m = 0;
    while (errorRel(xv, xa) <= 5 * 10**(-m - 1))
        m = m + 1;
    end
    ans = m;
endfunction
    
// Operaciones en punto flotante con redondeo a n cifras significativas:
// Parámetros:
//    x, y - operandos.
//    n - cantidad de cifras significativas.
function ans = sumM(x, y, n)
    ans = redondear(redondear(x, n) + redondear(y, n), n);
endfunction

function ans = prodM(x, y, n)
    ans = redondear(redondear(x, n) * redondear(y, n), n);
endfunction

function ans = restaM(x, y, n)
    ans = redondear(redondear(x, n) - redondear(y, n), n);
endfunction

function ans = divM(x, y, n)
    ans = redondear(redondear(x, n) / redondear(y, n), n);
endfunction
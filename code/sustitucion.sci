// Sustitución hacia atrás:
// Parámetros: 
//    A - Matriz escalanada
//    b - Vector de términos independientes

function sol = sust_atras(A,b)
    [nr nc]=size(A);
    [bm bn]=size(b);
    
    if nr<>nc then
        error("La matriz no es cuadrada.");
    end
    if bm <> nr | bn <> 1 then
        error("El vector no tiene la dimensión correcta.")
    end
    for k=1:nr-1,
        if A(k+1:nr,k)<>zeros(nr-k,1) then
            error("La matriz no es triangular");
        end
    end
    
    sol=zeros(nr,1);
    
    for k=nr:-1:1,
        s=0;
        for i=k:nr,
            s=s+A(k,i)*sol(i);
        end
        sol(k)=(b(k)-s)/A(k,k);
    end

endfunction

// Sustitución hacia atrás:
// Parámetros: 
//    A - Matriz escalanada
//    b - Vector de términos independientes

function sol = sust_adelante(A,b)
    [nr nc]=size(A);
    [bm bn]=size(b);
    
    if nr<>nc then
        error("La matriz no es cuadrada.");
    end
    if bm <> nr | bn <> 1 then
        error("El vector no tiene la dimensión correcta.")
    end
    for k=1:nr-1,
        if A(k,k+1:nc)<>zeros(1,nr-k) then
            error("La matriz no es triangular");
        end
    end
    
    sol=zeros(nr,1);
    
    for k=1:nr,
        s=0;
        for i=k:-1:1,
            s=s+A(k,i)*sol(i);
        end
        sol(k)=(b(k)-s)/A(k,k);
    end

endfunction

//-----------------------------------------------------------------------------
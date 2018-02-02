// Conversor de decimal a número en punto flotante IEEE754 Precisión Simple por
// truncamiento.
// Parámetros:
//    n - Número decimal

function ans=toBinary(n)
if n==0 then
   ans=zeros(1,32)
 else
  
  //Signo
  if n < 0 then
        s=1;
    else
        s=0
  end
 
  n=abs(n);
  
  //Exponente
  ex=0;
  while 2^ex<n,
        ex=ex+1;
  end
  ex=ex+126;

  e=zeros(1,8);
  tmp=ex;
  for i = 8:-1:1,
        if tmp/2 <> int(tmp/2) then
          resto=1;
          cociente=(tmp-1)/2;
        else
          resto=0;
          cociente=tmp/2;
        end
        e(i)=resto;
        tmp=cociente;
  end
  
  //Mantisa
  man=n/(2^(ex-127))-1;
  m=zeros(1,23);
  tmp=man;
  for i = 1:23,
        m(i)=int(2*tmp);
        tmp=2*tmp-int(2*tmp);
  end
  
  disp('La conversion a binario en punto flotante ieee754 32 bits es: ')
  ans=zeros(1,32)
  tmp=[s e m];
  for i=1:32,
        ans(i)=tmp(i)
  end
  
end
endfunction

//------------------------------------------------------------------------------

// Conversor de número en punto flotante IEEE754 Precisión Simple a decimal
// Parámetros:
//   fl - vector fila que contiene al numero en punto flotante (Precisión Simple)

function ans=toDEC(fl)
  if length(fl) == 32 then
    select  fl
     case [0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1] then
      ans=%nan
     case [0 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] then
      ans=%inf
     case [1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] then
      ans=-%inf
    else
      //Comprobación de que fl sea un número binario válido
      for i=1:32
        if (fl(i) <> 1 & fl(i) <> 0) then
          error('El numero introducido no es valido')
        end
      end
      
      //Aislamiento del signo
      signo=fl(1)
      
      //Aislamiento de la mantisa
      mantisa = zeros([1:23]);
      for i = 1:23
        mantisa(i) = fl(i + 9)
      end
      
      //Aislamiento del exponente
      exponente=zeros([1:8]);
      for i=1:8
        exponente(i)=fl(i+1)
      end
      
      //Conversión del exponente a decimal
      e=exponente(8)
      for i=1:7
        e=e+exponente(i)*2^(8-i)
      end
      e=e-127
      
      //Conversión de la mantisa a decimal
      m=1
      for i=1:23
        m=m+mantisa(i)*2^(-(i))
      end
      
      //Finalización de la conversión
      dec=m*2^e
      
      if signo == 1 then
        ans=(-1)*dec
      else
        ans=dec
      end
    end
  else
    error('El numero en punto flotante introducido tiene una longitud erronea')
  end
endfunction

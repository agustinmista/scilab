// Método de Newton para resolver sistemas no lineales:
// Parámetros: 
//    f1, f2- funciónes del sistema. (String)
//    x - aproximación inicial. (Vector)
//    n - número de iteraciones.
// Nota:
//    parametrizar las funciones en el vector x(k),
//    por ejemplo:    f1 = x^2 - y^3  ----> x(1)^2 - x(2)^3
//                    f2 = 2*x + 4*y  ----> 2*x(1) + 4*x(2)

function ans = newton_sist2(f1, f2, x, n)

  f1 = strsubst(strsubst(f1,"x","(x(1))"), "y", "(x(2))");
  f2 = strsubst(strsubst(f2,"x","(x(1))"), "y", "(x(2))");
 
  disp(f1);
  disp(f2);
  
  deff("z = f(x)","z ="+f1);
  deff("w = g(x)","w ="+f2);

  for (i = 1 : n),
    J(1, :) = derivative(f, x, 4);
    J(2, :) = derivative(g, x, 4);
    F(1) = f(x);
    F(2) = g(x);
    a = x - inv(J) * F
    if (f(a) == 0 & g(a) == 0)
      break;
    end
    x = a;
  end
  ans = a;
endfunction

//-----------------------------------------------------------------------------
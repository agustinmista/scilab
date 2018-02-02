Integración Numérica
====================

Dada una función $f : [a,b] \rightarrow \real$ se quiere calcular la integral
definida $I(f) = \int_a^b f(x) dx = F(b) - F(a)$, donde $F(x)$ es cualquier
antiderivada de $f(x)$. Una aproximación de la misma resulta $\sum_{i=0}^n a_i
(f_xi)$.

Integración Numérica Basada en Polinomios Interpolantes
-------------------------------------------------------

Sean $\{x_0, ..., x_n\}$ $n+1$ nodos distintos en $[a,b]$. Tenemos que:
$$
f(x) = P_n(x) + \prod_{i=0}^n (x-x_i) \frac{f^{(n+1)}(\xi(x))}{(n+1)!}
$$

Donde $P_n(x) = \sum_{i=0}^n f(x_i) L_i(x)$. Integrando en $[a,b]$ tenemos:
\begin{align*}
\int_a^b f(x) dx &= \int_a^b \sum_{i=1}^n f(x_i) L_i(x) 
+ \int_a^b \prod_{i=0}^n (x-x_i) \frac{f^{(n+1)}(\xi(x))}{(n+1)!} \\
&= \sum_{i=0}^n a_i f(x_i) 
+ \underbrace{\frac{1}{(n+1)!} 
\int_a^b \prod_{i=0}^n (x-x_i) f^{(n+1)}(\xi(x))}_{\text{error de integración}}
\end{align*}

Donde $\xi(x) \in [a,b]$ para todo $x \in [a,b]$ y $a_i = \int_a^b L_i(x) dx$.

\Teorema (del Valor Intermedio Ponderado para Integrales) si $f \in [a,b]$, y
$g$ es integrable en $[a,b]$ y no cambia de signo en $[a,b]$, entonces existe un
número $c \in (a,b)$ tal que $\int_a^b f(x)g(x) dx = f(c) \int_a^b g(x) dx$.
 
### Regla del Trapecio

Aproximamos $f(x)$ mediante un polinomio lineal. Sean $x_0 = a$, $x_1 = b$ y $h
= b-a$. Por Lagrange tenemos que $P_1(x) = \frac{x-x_1}{x_0 - x_1} f(x_0) +
\frac{x-x_0}{x_1 - x_0} f(x_1)$. Luego:
$$
\int_a^b f(x) dx = \int_{x_0}^{x_1} 
\left[ \frac{(x - x_1)}{(x_0 - x_1)} f(x_0) + \frac{(x - x_0)}{(x_1 - x_0)} f(x_1)
\right] dx 
+ \frac{1}{2} \int_{x_0}^{x_1} f''(\xi(x)) (x-x_0)(x-x_1) dx
$$

Donde:
\begin{align*}
\int_{x_0}^{x_1} 
\left[ \frac{(x - x_1)}{(x_0 - x_1)} f(x_0) + \frac{(x - x_0)}{(x_1 - x_0)} f(x_1)
\right] dx 
&= \left[ \frac{(x-x_1)^2}{2(x_0 - x_1)} f(x_0) 
+ \frac{(x-x_0)^2}{2(x_1 - x_0)} f(x_1) \right]_{x_0}^{x_1} \\
&= \frac{(x_1 - x_0)}{2} (f(x_0) + f(x_1)) = \frac{h}{2} (f(x_0) + f(x_1))
\end{align*}

Además, como $(x-x_0)(x-x_1)$ no cambia de signo en $[x_0,x_1]$, luego podemos
aplicar el teorema anterior para obtener:
\begin{align*}
\frac{1}{2} \int_{x_0}^{x_1} f''(\xi(x)) (x-x_0)(x-x_1) dx
&= \frac{1}{2} f''(c) \int_{x_0}^{x_1} (x-x_0)(x-x_1) dx \quad
\text{p.a. } c \in [x_0, x_1] \\
&= \frac{1}{2} f''(c) \left[\frac{x^3}{3} 
- \frac{(x_1-x_0)}{2}x^2+x_0 x_1 \right]_{x_0}^{x_1} \\
&= f''(c) \left[ 
\left(\frac{x_1^3}{3}-\frac{x_1^3}{2}-\frac{x_0 x_1^2}{2} + x_0 x_1^2 \right) 
- \left( \frac{x_0^3}{3}-\frac{x_1 x_0^2}{2}-\frac{x_0^3}{2} + x_0^2 x_1 \right)
\right] \\
&= \frac{1}{2} f''(c) \left[ \left( - \frac{x_1^3}{6} + \frac{x_0 x_1^2}{2} \right) 
- \left( - \frac{x_0^3}{6} + \frac{x_0^2 x_1}{2} \right) \right] \\
&= \frac{f''(c)}{12} \left[ x_1^3 - 3 x_0 x_1^2  + 3 x_0^2 x_1 - x_0^3 \right] \\
&= - \frac{f''(c)}{12} (x_1 - x_0)^3 = -\frac{h^3}{6} f''(c)
\end{align*}

Finalmente, la regla del trapecio queda dada por:
$$
\int_a^b f(x) dx = 
\underbrace{\frac{h}{2} [f(x_0) + f(x_1)]}_{\text{integral aproximada}} 
\ \underbrace{- \frac{h^3}{12} f''(c)}_{\text{error de aproximación}}
$$

### Método Compuesto del Trapecio

Utiliza varios subintervalos de igual longitud. Sea $n$ el número de
subintervalos, luego $h = (b-a)/n$ y $x_j = a + jh$. Tenemos que la aproximación
por $n$ trapecios $T_n$ resulta:
\begin{align*}
T_n(f) 
&= h \left( \frac{f(x_0) + f(x_1)}{2} \right) 
+ h \left( \frac{f(x_1) + f(x_2)}{2} \right)
+ cdots
+ h \left( \frac{f(x_{n-1}) + f(x_n)}{2} \right) \\
&= h \left[\frac{1}{2}f(x_0) + f(x_1)+\cdots+f(x_{n-1}) + \frac{1}{2}f(x_n)\right]
\end{align*}

\Teorema (Error de la Integración Trapezoidal) sea $f : \real \rightarrow
\real$, derivable 2 veces en $[a,b]$, luego el error de integración usando $n$
subintervalos resulta:
$$
E_n^T(f) = \int_a^b f(x) dx - T_n (f) = - \frac{h^2(b-a)}{12} f''(cn)\ 
\text{p.a. } cn \in [a,b]
$$

\Demostracion 

+ Si $n = 1$ \implica $a = x_0$, $b = x_1$ y $h = b-a$. Luego $E_1^T(f) = -
\frac{h^3}{12} f''(c)$.
  
+ Si $n > 1$ \implica $h = (b-a) / n$, $x_j = a + jh$. Luego $E_n^T(f) = -
\frac{h^3}{12} f''(\gamma_1) - \frac{h^3}{12} f''(\gamma_2) - \cdots -
\frac{h^3}{12} f''(\gamma_n)$, donde $x_{j-1} \leq \gamma_j \leq x_j$.
Reagrupando y multiplicando por $\frac{n}{n}$ obtenemos:
$$
E_n^T(f) = - \frac{h^3}{12} n \left[ \frac{f''(\gamma_1) + \cdots +
f''(\gamma_n)}{n} \right]
$$

Si llamamos $\xi_n = (f''(\gamma_1) + \cdots + f''(\gamma_n))/n$ luego se cumple
que $min_{a \leq x \leq b} f''(x) \leq \xi_n \leq max_{a \leq x \leq b} f''(x)$.
Por hipótesis, $f''(x)$ es continua en $[a,b]$, luego existe $cn \in [a,b]$ tal
que $f''(cn) = \xi_n$. Como además $hn = b - a$ tenemos que $E_n^T(f) = -
\frac{h^2(b - a)}{12} f''(cn)$.

#### Estimación del Error Trapezoidal: 
Sabemos que $E_n^T(f) = - \frac{h^2}{12} \left[f''(\gamma_1)h + \cdots +
f''(\gamma_n)h \right]$, donde $[f''(\gamma_1)h + \cdots + f''(\gamma_n)h]$ es una
aproximación de $\int_a^b f''(x) dx = f'(b) - f'(a)$. Luego 
$$
E_n^T(f) \approx -\frac{h^2}{12}[f'(b) - f'(a)]
$$

### Regla de Simpson

Aproximamos $f(x)$ mediante el polinomio de interpolación de Lagrange de grado 2
con los nodos $x_0 = a$, $x_1 = a + h$ y $x_2 = b$, donde $h = (b-a)/2$. Luego
resulta: 
\begin{align*}
\int_a^b f(x) dx 
&= \int_{x_0}^{x_2} \underbrace{\left[
\frac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0 - x_2)} f(x_0) 
+ \frac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1 - x_2)} f(x_1) 
+ \frac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2 - x_0)} f(x_2)
\right]}_{P_2(x)}  dx \\ 
&+ \int_{x_0}^{x_2} \underbrace{\frac{(x-x0)(x-x1)(x-x2)}{6} 
f^{(3)}(\xi(x))}_{\text{aproximación del error}} dx
\end{align*}

Luego, resulta de operar algebraicamente que:
\begin{align*}
&\int_{x_0}^{x_2} P_2(x) dx = \frac{h}{3} [f(x_0) + 4 f(x_1) + f(x_2)] \\
&\int_{x_0}^{x_2} \frac{(x-x0)(x-x1)(x-x2)}{6} f^{(3)}(\xi(x)) dx 
= - \frac{h^5}{90} f^{(4)}(\xi)\ \text{p.a. }\xi \in [x_0,x_2]
\end{align*}

Y resulta:
$$
\int_a^b f(x) dx = \frac{h}{3} [f(x_0) + 4 f(x_1) + f(x_2)] 
- \frac{h^5}{90} f^{(4)}(\xi)\ \text{p.a. }\xi \in [x_0,x_2]
$$

### Método Compuesto de Simpson

Utiliza varios subintervalos de igual longitud. Sea $n$ el número de
subintervalos, luego $h = (b-a)/n$ y $x_j = a + jh$. Tenemos que la aproximación
$S_n$ resulta: 
\begin{align*}
\int_a^b f(x) dx &= \int_{x_0}^{x_2} f(x) dx +\cdots +\int_{x_{n-2}}^{x_n} f(x) dx\\
&= \frac{h}{3}[f(x_0) + 4f(x_1) + f(x_2)]
+ \frac{h}{3}[f(x_2) + 4f(x_3) + f(x_4)]
+ \cdots 
+ \frac{h}{3}[f(x_{n-2}) + 4f(x_{n-1}) + f(x_n)] \\
&= \frac{h}{3} [f(x_0) + 4f(x_1) + 2f(x_2) + 4f(x_3) 
+ \cdots 
+ 2f(x_{n-2}) + 4 f(x_{n-1}) + f(x_n)]
\end{align*}


\Teorema (Error de la Integración Compuesta de Simpson) sea $f : \real
\rightarrow \real$, derivable 4 veces en $[a,b]$, luego el error de integración
usando $n \in \mathbb{P^+}$ subintervalos resulta:
$$
E_n^S(f) = \int_a^b f(x) dx - S_n (f) = - \frac{h^4(b-a)}{180} f^{(4)}(cn)\ 
\text{p.a. } cn \in [a,b]
$$

\Demostracion Sabemos que $E_n^S(f) = - \frac{h^5}{90} f''(\gamma_1) -
\frac{h^5}{90} f''(\gamma_2) - \cdots - \frac{h^5}{90} f''(\gamma_n)$, donde
$x_{j-1} \leq \gamma_j \leq x_j$. Reagrupando y multiplicando por $\frac{n}{n}$
obtenemos:
$$
E_n^S(f) = - \frac{h^5}{90} \left(\frac{n}{2} \right) 
\left[ \frac{f''(\gamma_1) + \cdots + f''(\gamma_n)}{n/2} \right]
$$

Si llamamos $\xi_n = (f''(\gamma_1) + \cdots + f''(\gamma_n))/(n/2)$ luego se
cumple que $min_{a \leq x \leq b} f^{(4)}(x) \leq \xi_n \leq max_{a \leq x \leq
b} f^{(4)}(x)$. Por hipótesis, $f^{(4)}(x)$ es continua en $[a,b]$, luego existe
$cn \in [a,b]$ tal que $f^{(4)}(cn) = \xi_n$. Como además $hn = b - a$ tenemos
que $E_n^S(f) = - \frac{h^4(b - a)}{180} f^{(4)}(cn)$.

#### Estimación del Error de Simpson: 
Sabemos que $E_n^S(f) = - \frac{h^4}{90} \frac{1}{2} [2nf^{(4)}(\gamma_1) +
\cdots + 2nf^{(4)}(\gamma_n)]$, donde $[2nf^{(4)}(\gamma_1) + \cdots +
2nf^{(4)}(\gamma_n)]$ es una aproximación de $\int_a^b f^{(4)}(x) dx =
f^{(3)}(b) - f^{(3)}(a)$. Luego $$ E_n^S(f) \approx
-\frac{h^4}{180}[f^{(3)}(b) - f^{(3)}(a)]$$

### Integración Numérica en Dominio Bidimensional

Sea desea calcular la integral de una función $f(x, y)$ en un dominio
bidimensional $Q = \{(x, y)\in \real^2\ |\ a \leq x \leq b, c(x) \leq y \leq
d(x)\}$. Es decir:
$$
I = \int_a^b \int_{c(x)}^{d(x)} f(x, y) dy dx
$$

Para esto, definimos $G(x) = \int_{c(x)}^{d(x)} f(x, y) dy$, luego $I = \int_a^b
G(x) dx$, lo cual puede aproximarse como $I \approx \sum_{i=1}^n \omega_i
G(x_i)$, donde $\omega_i$ es el _factor de ponderamiento_ del método utilizado,
y $x_i$ son los nodos equidistantes en $x$. Por otra parte tenemos que $G(x_i)
\approx \sum_{j=1}^m a_{ij} f(x_i, y_j)$.

#### Cota del Error:
$$ 
|E_n^S| \leq \frac{h x^4 (b-a) hy^4(d-c)}{180^2} 
\cdot \max_{(x,y)\in Q} \left| \frac{\delta^4f}{\delta x^4} \right| 
\cdot \max_{(x,y)\in Q} \left| \frac{\delta^4f}{\delta y^4} \right| 
$$

Interpolación y Ajuste de Curvas
================================

Dados $n+1$ puntos distintos $a \leq x_1 < \cdots x_{n+1} \leq b$ de un
intervalo $[a,b]$, llamados _nodos_ de la interpolación, y $n+1$ números reales
$y_1,...,y_{n+1}$ llamados _valores_ de la interpolación, se trata de hallar una
función $P$ tal que $P(x_i) = y_i,\ i=1,...,n+1$.

### Interpolación Polinomial

Dados $n+1$ puntos $\{(x_i, y_i)\ :\ y_i = f(x_i), i=0,...,n\}$, buscamos
encontrar un polinomio $P(x)$ que interpole los datos, es decir que $P(x_i) =
y_i,\ i=1,...,n$.

\Teorema (Existencia y Unicidad del Polinomio Interpolante) dados $n+1$ puntos
distintos $(x_0, y_0), (x_1, y_1), ..., (x_n, y_n)$ con $x_0, ..., x_n$ números
distintos, _existe_ un polinomio $P(x)$ de grado menor o igual a $n$ que
interpola dichos puntos. Además, dicho polinomio es _único_ en el conjunto de
polinomios de grado menor o igual a $n$.

### Método de Interpolación de Lagrange

Consideramos el polinomio de grado máximo $n$ que pasa por los puntos $(x_0,
y_0), (x_1, y_1), ..., (x_n, y_n)$. Para $k=0,...,n$ definimos:
$$
L_k(x) = \frac{(x-x_0) \cdots (x-x_{k-1})(x-x_{k+1}) \cdots (x-x_n)}{(x_k-x_0)
\cdots (x_k-x_{k-1})(x_k-x_{k+1}) \cdots (x_k-x_n)}
= \prod_{i=0\ i\neq k}^n \frac{(x - x_i)}{(x_k - x_i)}
$$

Donde $L_k(x)$ satisface $L_k(x_k) = 1$ y $L_k(x_i) = 0$ si $i \neq k$. Luego el
polinomio interpolador de Lagrange está dado por:
$$
P(x) = L_0(x) y_0 + L_1(x) y_1 + \cdots + L_n(x) y_n
= \sum_{k=0}^n L_k(x) y_k
$$

Notar que $P(x_i) = y_i,\ i=0,...,n$.

### Método de Interpolación por Diferencias Divididas de Newton

Dados los $n+1$ puntos $(x_0, y_0), (x_1, y_1), ..., (x_n, y_n)$, expresar el
polinomio interpolador de la forma:
$$ 
P(x) = a_0 + a_1(x-x_0) + a_2(x-x_0)(x-x_1) + \cdots +
a_n(x-x_0)(x-x_1)\cdots(x-x_{n-1})
$$

Luego vemos que:
\begin{align*}
P_1(x) &= a_0 + a_1(x-x_0) \\
P_1(x) &= \underbrace{a_0 + a_1(x-x_0)}_{P_1(x)} + a_2(x-x_0)(x-x_1) \\
&\vdots \\
P_n(x) &= P_{n-1}(x) + a_n(x-x_0)\cdots(x-x_{n-1})
\end{align*}

#### Imponiendo las Condiciones de Interpolación:
queremos que $P_n(x_i) = f(x_i) = y_i,\ i=1,...,n$. Luego:
\begin{align*}
P_n(x_0) &= a_0 = y_0 \\
P_n(x_1) &= y_0 + a_1(x_1-x_0) \implica a_1 = \frac{y_1 - y_0}{x_1 - x_0} \\
&\vdots \\
\end{align*}
Los coeficientes $a_i$ se pueden calcular introduciendo la idea de _diferencia
dividida_. 

+ Diferencia dividida de primer orden: $f[x_0, x_1] = \frac{f(x_1) -
  f(x_0)}{(x_1 - x_0)} = (y_1 - y_0) / (x_1 - x_0)$

+ Diferencia dividida de segundo orden: $f[x_0, x_1, x_2] = \frac{f[x_1, x_2] -
  f[x_0, x_1]}{(x_2 - x_0)}$

+ Diferencia dividida de orden $k$: $f[x_i,...,x_{i+k}] =
  \frac{f[x_{i+1},...,x_{i+k}] - f[x_i, x_{i+k-1}]}{(x_{i+k} - x_i)}$

#### Propiedad:
sea $(i0, i1,..., in)$ una permutación de los enteros $(0, 1,...,n)$, luego se
demuestra que $f[x_{i0}, x_{i1},..., x_{in}] = f[x_0, x_1,..., x_n]$.

#### Fórmula de la Interpolación por Diferencias Divididas de Newton
$$ 
P_n(x) 
= f(x_0) + (x-x_0)f[x_0, x_1] + \cdots + (x-x_0)\cdots(x-x_{n-1})f[x_0,..., x_n]
= \sum_{i=0}^n \left( \prod_{j=0}^{i-1} (x - x_j) \right) f[x_0, ..., x_n]
$$

\Teorema suponga que $f$ está definida en $[a,b]$ y que $\{x_0, x_1, ..., x_n\}$
sin valores distintos en $[a,b]$. El polinomio de grado menor o igual a $k$ que
interpola $f(x)$ en $\{x_i, ..., x_{i+k}\} \subseteq \{x_0, ..., x_n\}$ está
dado por: 
$$ 
P_{i,k}(x) = f(x_i) + (x-x_i)f[x_i, x_{i+1}] + \cdots + (x-x_i) \cdots
(x-x_{i+k-1})f[x_i, ..., x_{i+k}]  
$$

\Teorema (de Rolle) sea $f$ continua en $[a,b]$ y diferenciable en $(a,b)$. Si
$f(a) = f(b)$, entonces existe $c \in (a,b)$ tal que $f'(c) = 0$.

\Teorema (generalizado de Rolle) sea $f$ continua en $[a,b]$ y diferenciable $n$
veces en $(a,b)$. Si $f(x)$ se anula en los $n+1$ números distintos $x_0, x_1,
..., x_n \in [a,b]$, entonces existe $c \in (a,b)$ tal que $f^{(n)}(c) = 0$.

### Error en la Interpolación Polinomial

\Teorema sean $x_0, x_1, ..., x_n \in [a,b]$ números distintos, y sea $f(x)$
diferenciable $n$ veces en $[a,b]$. Luego para todo $x \in [a,b]$ existe $\xi(x)
\in (a,b)$ tal que:
$$
f(x) - P(x) = \frac{(x-x_0)(x-x_1) \cdots (x-x_n)}{(n+1)!} f^{(n+1)}(\xi(x))
$$
donde $P(x)$ es un polinomio interpolante de grado menor o igual a $n$.

### Acotación del Error (Caso General)

$$
f(x) - P(x) = \frac{(x-x_0)(x-x_1) \cdots (x-x_n)}{(n+1)!} f^{(n+1)}(cx)
= \frac{\psi_n(x)}{(n+1)!} f^{(n+1)}(cx)
$$

Para $x_0, x_1, ..., x_n$ distintos en $[a,b]$ y $x \in [a,b]$ la cota de error
$|f(x) - P_n(x)|$ está dada por: 
$$
|f(x) - P_n(x)| \leq \max_{a \leq x \leq b} |f(x) - P_n(x)| \leq \frac{1}{(n+1)!}
\max_{a \leq x \leq b} |\psi_n(x)| \max_{a \leq x \leq b} |f^{(n+1)}(x)|
$$

#### Error para Nodos Uniformemente Espaciados
$$
h = \frac{b-a}{n}\qquad\qquad x_i = a + ih
$$

Luego $\psi_n(x) = x(x-h)(x-2h)\cdots(x-b) = \prod_{i=0}^n (x - ih)$. Usando
nodos uniformemente espaciado, en general, el error no está uniformemente
distribuido. Además, se tiene que el error no siempre tiende a cero cuando se
aumenta la cantidad de puntos. 

\Teorema (de Aproximación de Weierstrass) sea $f(x)$ una función continua en
$[a,b]$ y sea $\epsilon>0$. Luego existe un polinomio $P_n(x)$ tal que $\max_{a
\leq x \leq b} |f(x) - P(x)| \leq \epsilon$.

### Aproximación con Menor V.A. Máximo

Dada una función $f(x)$ continua en $[a,b]$ queremos aproximarla con un
polinomio $P(x)$ tal que minimice el error de aproximación $E(P) = \max_{a \leq
x \leq b} |f(x) - P(x)|$. Definimos el error _minimax_ como $\zeta(f) =
\min_{gr(P) \leq n} E(P)$ (esto requiere optimización no lineal). Luego
denotamos este polinomio minimax como $m_n(x)$, y se tiene $E(m_n) = \zeta(f)$.

### Polinomio de Chebychev

Para $n \geq 0$ definimos la función $T_n(x) = cos(n \cdot cos^{-1}(x))$ para
$-1 \leq x \leq 1$. Luego, $T_n$ verifica que $T_{n+1}(x) = 2 x T_n(x) -
T_{n-1}(x)$.

#### Propiedades de $T_n$:

+ $|T_n(x)| \leq 1,\ -1 \leq x \leq 1$
+ $T_n(x) = 2^{n-1} + \text{términos de menor grado}$

Las raíces de $T_n$ se usan para encontrar los valores de $x_0, ..., x_n$ que
minimizan el error de interpolación de grado menor o igual a $n-1$.

### Aproximación de Mínimos Cuadrados

Sea $y = g(x)$ una relación desconocida entre las variables $x$ e $y$.
Experimentalmente se obtienen $\{(x_1, y_1), ..., (x_m, y_m)\}$ donde $y_i =
g(x_i) + v_i$ con $v_i$ el error de medición. A partir de los datos queremos
aproximar $g(x)$ mediante una función $f(x)$ de la forma $f(x) = a_1
\varphi_1(x) + a_2 \varphi_2(x) + \cdots + a_p \varphi_p(x)$ donde $a_i$ son
números y $\varphi_i$ son funciones dadas. Es decir, queremos hallar los valores
de $a_1,..., a_p$ que minimizan $G(a_1, ..., a_p) = \sum_{j=1}^m [(a_i
\varphi(x_j) + \cdots + a_p \varphi_p(x_j)) - y_j]^2$. El mínimo se satisface
cuando $\delta G / \delta a_i = 0,\ i=1,...,p$.

#### Aproximación Polinomial de Mínimos Cuadrados: 
$\varphi_i = x^{i-1}$.

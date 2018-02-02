Solución de Ecuaciones Lineales
===============================

Métodos Directos
----------------

Consideramos sistemas de $n$ ecuaciones con $n$ incógnitas:
\begin{align*}
a_{11} x_1 + a_{12} x_2 + \cdots + a_{1n} x_n &=  b_1 \\
a_{21} x_1 + a_{22} x_2 + \cdots + a_{2n} x_n &=  b_2 \\
&\ \vdots \\
a_{n1} x_1 + a_{n2} x_2 + \cdots + a_{nn} x_n &=  b_n
\end{align*}

En forma matricial es $Ax = b$ con $A({ij}) = a_{ij}$.

\Definicion una matriz se dice _plena_ si la mayoría de sus elementos son _no
nulos_. En cambio, se dice _rala_ si la mayoría de sus elementos son nulos.

\Definicion decimos que una matriz es _p-banda_ si existe $p \geq \in \integer$
tal que $|i - j| \geq p \implica a_{ij} = 0$. Si $p = 1$, entonces la matriz es
_diagonal_, si $p = 2$ la matriz se dice _tri-diagonal_.

\Definicion dado un sistema $Ax = b$, si $b = 0$, decimos que el sistema es
_homogéneo_. En caso contrario el sistema es _no homogéneo_.

\Teorema los siguientes enunciados son equivalentes:

1. Para cada $b$, existe una única solución $x$.
2. Para cada $b$, existe una solución $x$.
3. El sistema homogéneo $Ax = 0$ tiene única solución $x=0$.
4. $det(A) \neq 0$
5. Existe $A^{-1}$.

#### Regla de Cramer
considere el sistema $Ax = b$ con $det(A) \neq 0$. Luego $x_i = det(A_i) /
det(A)$ donde $A_i = [a_1 | \cdots | a_{i-1} | b | a_{i+1} | \cdots | a_n]$.

### Matriz Inversa

\Definicion sea $A \in \real^{n \times n}$. Decimos que $A^{-1}$ es la _inversa
de A_ si $AA^-1 = A^-1A = I$. Si $A^-1$ existe, es única. Luego, un sistema $Ax
= b$ puede resolverse haciendo $x = A^{-1}b$, aunque esto es muy ineficiente.

### Eliminación de Gauss

Consiste en 2 pasos: _eliminación de incógnitas_ y _sustitución regresiva_.

$$
[A^{(1)} | b^1] = 
\left[ 
\begin{array}{c c c | c}
a_{11}^{(1)} & \cdots & a_{1n}^{(1)} & b_1^{(1)} \\ 
\vdots & & \vdots & \vdots \\
a_{n1}^{(1)} & \cdots & a_{nn}^{(1)} & b_n^{(1)}
\end{array} 
\right]
\quad
\stackrel{\text{reduce en (n-1) pasos a}}{\longrightarrow}
\quad
[A^{(n)} | b^n] = 
\left[ 
\begin{array}{c c c | c}
a_{11}^{(1)} & \cdots & a_{1n}^{(1)} & b_1^{(1)} \\ 
& \ddots & \vdots & \vdots \\
0 & & a_{nn}^{(n)} & b_n^{(n)}
\end{array} 
\right]
$$

Denotamos $U = A^{(n)}$ y $g = b^{(n)}$, luego $Ux = g$. 

#### Paso k-ésimo:

suponga que para $i = 1, ..., k-1$ los $x_i$ ya han sido eliminados de las
ecuaciones $i+1, ..., n$. Eliminamos $x_k$ de las ecuaciones $k+1, ..., n$.
$$
E_i^{(k+1)} = E_i^{(k)} - m_{ik} E_k^{(k)} \quad (\text{con } i = k+1, ..., n)
$$

Donde $m_{ik} = a_{ik}^{(k)} / a_{kk}^{(k)}$. Se llama a $a_{kk}$ el _elemento
pivote_.

\_ 

Una vez obtenida la matriz triangular superior $A^{(n)} = U$ resolvemos por
sustitución regresiva.
\begin{align*}
x_n &= \frac{b_n^{(n)}}{a_{nn}^{(n)}} \\
x_i &= \frac{1}{a_{ii}^{(i)}} 
  \left(  b_i^{(i)} - \sum_{j=i+1}^n a_{ij}^{(i)} x_j \right)
\end{align*}

### Pivoteo

Si $a_{kk}^{(k)} = 0$, se debe examinar los elementos $a_{ik}^{(k)} en las filas
$E_i^{(k)}$ con $i = k+1, ..., n$. Siendo $A$ no singular, al menos uno de
dichos elementos es no nulo. Luego esta fila puede intercambiarse con
$E_k^{(k)}$.

#### Pivoteo Parcial
en el paso $k$ calcular $c = \max_{k \leq i \leq n} |a_{ik}^{(k)}|$. Si
$|a_{kk}^{(k)}| < c$ luego intercambiar la ecuación $E_k^{(k)}$ por aquella
correspondiente a $c$. Esto reduce errores debido a la supresión de cifras
significativas.

#### Método de Gauss-Jordan
Transforma $[A | b] \longrightarrow [I | x]$. Requiere un mayor número de
operaciones que la eliminación de Gauss.

### Factorización LU

Queremos resolver $Ax = b$. Mediante eliminación de Gauss sin pivoteo obtenemos
$Ux = g$, donde 
$$
U = 
\begin{bmatrix}
u_{11} & u_{12} & \cdots & u_{1n} \\
0 & u_{22} & \cdots & u_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & u_{nn}
\end{bmatrix}
, \quad \text{con } u_{ij} = a_{ij}^{(i)}
$$

Además introducimos la matriz auxiliar $L$ triangular inferior basada en los
coeficientes $m_{ik} = a_{ij}^{(k)} / a_{kk}^{(k)}.$
$$
L = 
\begin{bmatrix}
1 & 0 & \cdots & 0 \\
m_{21} & 1 & \cdots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
m_{n1} & m_{n2} & \cdots & 1
\end{bmatrix}
$$

\Teorema sea $A \in \real^{n \times n}$ una matriz no singular, y sean $L$ y $U$
las matrices definidas anteriormente. Luego, si $U$ es generada sin pivoteo se
tiene $A = LU$.

\_

Luego resolver $Ax = b$ es igual a resolver $LUx = b$, lo cual es equivalente a
resolver dos sistemas triangulares.
\begin{align*} 
Lg &= b \rightarrow
\text{sist. triangular inferior} \rightarrow
\text{sustitución hacia adelante} \\ 
Ux &= g \rightarrow 
\text{sist. triangular superior} \rightarrow
\text{sustitución hacia atrás}
\end{align*}

### Factorización LU con Matriz de Permutación

\Definicion una _matriz de permutación_ $P \in \real^{n \times n}$ es una matriz
con exactamente una entrada unitaria en cada fila y cada columna, siendo el
resto de las entradas nulas.

#### Propiedad:
si $P$ es una matriz de permutación, entonces existe $P^{-1}$ y $P^{-1} = P^T$.

\_

Ahora para resolver $Ax = b$ donde $A$ requiere pivoteo, podemos resolver $PA =
LU$ donde $P$ incluye los intercambios de filas requeridos por $A$, y luego
resolver $Lg = Pb$ y $Ux = g$ como se mostró antes.

#### Unicidad de la Factorización LU:
si $A$ es tal que la eliminación de Gauss debe realizarse _sin pivoteo_, luego
$A$ puede factorizarse en $A = LU$ y dicha factorización es única.

\Definicion una matriz $A \in \real^{n \times n}$ es _estrictamente diagonal
dominante_ si
$$
|a_{ii}| > \sum_{j=1\\ j\neq i}^n |a_{ij}|, \quad \forall i \in 1..n
$$

\Teorema una matriz $A$ diagonal dominante es no singular. Luego, el sistema
$Ax=b$ puede resolverse por eliminación de Gauss sin pivoteo.

### Matrices Simétricas

\Definicion una matriz $A$ es _simétrica_ si $A = A^T$. Toda matriz simétrica
posee _autovalores reales_.

\Definicion una matriz es _definida positiva_ si es simétrica y sus autovalores
son todos positivos. Una matriz es _semidefinida positiva_ si es simétrica y sus
autovalores son todos no negativos.

\Teorema para matrices reales simétricas los siguientes enunciados son
equivalentes y sirven como definición de matriz _definida positiva_.

+ Para todo $x \neq 0$, $x^T A x > 0$.
+ Todos los autovalores de $A$ son positivos.
+ $A = B^T B$ para alguna matriz $B$ no singular. $B$ no es única pero existe
  una única matriz triangular superior $R$ con elementos diagonales positivos
  tal que $A = R^T T$ (factorización de Cholesky).

### Matrices No Simétricas Reales

Toda matriz no simétrica $A$ puede expresarse como $A = M + C$ donde:

+ $M = \frac{1}{2} (A + A^T)$ es una matriz simétrica.
+ $C = \frac{1}{2} (A - A^T)$ es una matriz antisimétrica.

#### Nota
para toda matriz antisimétrica $C$ y $x \in \real^n$ se cumple $x^T C x = 0$.

\Definicion (extensión de matriz definida positiva a matrices no simétricas)

$A$ es definida positiva \sii la matriz simétrica $M = \frac{1}{2} (A + A^T)$ es
definida positiva.

### Ortogonalización de Gram-Schmidt

Sea $\beta = \{x_1, x_2, ..., x_n\}$ una base arbitraria, no necesariamente
ortogonal de un espacio $n$-dimensional $S$. El objetivo es _construir una base
ortonormal_ $O = \{u_1, u_2, ..., u_n\}$ de $S$. La estrategia consta de
construir $O$ secuencialmente de manera que $O_k = \{u_1, u_2, ..., u_k\}$ es
una base ortonormal de $S_k = span\{x_1, x_2, ..., x_k\}$ para $k = 1..n$.

#### Algoritmo:
$$
u_1 = \frac{x_1}{||x_1||}, \qquad w_k = x_k - \sum_{i=1}^{k-1} (x_k^T u_i) u_i,
   \qquad u_k = \frac{w_k}{||w_k||}
$$

### Factorización QR

Sea $A \in \real^{m \times n}, A = [a_1 | a_2 | ... |a_n]$ una matriz con
columnas linealmente independientes. Aplicando Gram-Schmidt resulta una base
ortonormal ${q_1, q_2, ..., q_n}$ de $span\{A\}$ donde:
\begin{align*}
q_k &= \frac{a_k - \sum_{i=1}^{k-1} (a_k^T q_i) q_i}{\sqcup_k} \\
\sqcup_k &= \left\| a_k - \sum_{i=1}^{k-1} (a_k^T q_i) q_i \right\|
\end{align*}

En forma matricial tenemos:
$$
\underbrace{[a_1 | a_2 | ... | a_n]}_{A}
=
\underbrace{[q_1 | q_2 | ... | q_n]}_{Q}
\underbrace{
  \begin{bmatrix}
  \sqcup_1 & a_2^T q_1 & a_3^T q_1 & \cdots & a_n^T q_1 \\ \\
  0        & \sqcup_2  & a_3^T q_2 & \cdots & a_n^T q_2 \\ \\
  0        & 0         & \sqcup_3  & \cdots & a_n^T q_3 \\ \\
  \vdots   & \vdots    & \vdots    & \ddots & \vdots    \\ \\
  0        & 0         & 0         & \cdots & \sqcup_n  
  \end{bmatrix}}_{R}
$$

Donde:

+ $A \in \real{m \times n}$ es una matriz de columnas LI. 
+ $Q \in \real{m \times n}$ es una base ortonormal de $span\{A\}$. 
+ $R \in \real{n \times n}$ es una matriz triangular superior con elementos
  diagonales positivos.

\_ 

Toda matriz $A \in \real{m \times n}$ con columnas LI puede factorizarse de
manera única como $A = QR$. Además, si $A \in \real{n \times n}$ es no singular,
entonces $Q^T = Q^{-1}$. Luego $Ax = b \sii QRx = b \sii Rx = Q^T b$, y este
último es un sistema que se resuelve por sustitución regresiva.

### Problema de Mínimos Cuadrados

En puntos discretos $t_i$ obtenemos observaciones $b_i$, resultando un conjunto
de pares ordenados $\{(t_1, b_1), ..., (t_m, b_m)\}$. Supongamos que queremos
aproximar los datos mediante una ecuación lineal $y = f(t) = \alpha + \beta t$.
Tenemos que el error de aproximar cada punto es $\epsilon_i = |f(t_i) - b_i| = |
\alpha + \beta t_i - b_i|$. Luego en forma matricial $\epsilon = Ax - b$ (con $A
= [1 | t]$ y $x = [\alpha\ \beta]^T$) y queremos hallar los valores de $\alpha$ y
$\beta$ que minimicen el error al cuadrado $\sum_{i=1}^m \epsilon_i^2 =
\epsilon^T \epsilon$.

#### Problema de mínimos cuadrados general:
para $A \in \real^{m \times n}$ y $\b \in \real^m$, sea $\epsilon = \epsilon(x)
= A x - b$. El problema de los mínimos cuadrados es el de hallar un vector $x$
que minimice $\sum_{i=1}^m \epsilon^2 - \epsilon^T \epsilon = (Ax - b)T (Ax -
b).

\Teorema el conjunto solución del problema de mínimos cuadrados es el conjunto
de soluciones del sistema $A^T Ax = A^T b$. Además, existe una única solución
\sii $rank(A) = n$, en cuyo caso $x = (A^T A)^{-1}A^T b$.

#### Aplicando factorización QR al problema de mínimos cuadrados:

El conjunto solución de mínimos cuadrados es el conjunto solución del sistema
$A^T Ax = A^T b$. Suponga que $rank(A^{m \times n}) = n$ y sea $A = QR$ Luego
$A^T A = (QR)^T QR = R^T Q^T Q R = R^T Q^{-1} Q R = R^T R$. Por lo tanto $R^T Rx
= R^T Q^T b$. Siendo $R$ no singular nos queda $Rx = Q^T b$ lo cual se resuelve
por sustitución regresiva. Siendo $x = R^{-1} Q^T b = (A^T A)^{-1} A^T b$. Si el
sistema es consistente, la ecuación anterior da como resultado la solución $Ax -
b = 0$. Si no lo es, da la solución de mínimos cuadrados.

### Normas Vectoriales y Matriciales

\Definicion dado un espacio vectorial $V$, una función $||\cdot|| : V
\rightarrow \real$ es una _norma vectorial_ si satisface las siguientes
propiedades:

1. $\forall x \in V, ||x|| \geq 0 \qquad (||x|| = 0 \sii x = 0)$
2. $\forall x \in V, \lambda \in \real, ||\lambda x|| = |\lambda| ||x||$
3. $\forall x,y \in V, ||x+y|| \leq ||x|| + ||y||$

#### Norma Euclídea:
$||x||_2 = sqrt(x^T x)$

#### Norma Infinito:
$||x||_\infty = max |x_i|$

#### Norma l1:
$||x||_1 = \sum |x_i|$

#### Normas Matriciales para $A \in \real^{m \times n}$:

+ $||A|| = 0 \sii A = 0$
+ $\forall \lambda \in \real, ||\lambda A|| = |\lambda| ||A||$
+ $\forall A,B, ||A+B|| \leq ||A|| + ||B||$

\Definicion para una matriz cuadrada $A$, se dice que la norma matricial
$||\cdot||$ es _submultiplicativa_ si $\forall A, B, ||AB|| \leq ||A|| \cdot
||B||$.

\Definicion dada una norma vectorial se define la _norma matricial inducida_
para $A \in \real^{m \times n}$ como $||A|| = sup\{ ||Ax|| / ||x|| : x \neq 0, x
\in \real^n \}$.

\Teorema la norma matricial inducida es submultiplicativa.

\Teorema sea $||\cdot||$ una norma vectorial, luego $\forall x \in \real^n, ||
Ax || \leq ||A|| \cdot ||x||$.

\Demostracion para $x=0$ se verifica trivialmente. Luego supongo $x \neq 0$ y
sea $v = x / ||x||$ y $||v|| = 1$. Se tiene 
$$ || Ax || = \left\| A x \frac{||x||}{||x||} \right\|
= ||x|| \cdot ||Av|| \leq ||x|| \cdot ||v|| \cdot ||A|| = ||x|| \cdot ||A||
$$

### Estabilidad de la Resolución de Sistemas Lineales

Considerar el sistema $Ax = b$ y el sistema perturbado $A \tilde{x} =
\tilde{b}$. 

\Teorema sea $A \in \real^{n \times n}$ no singular. Luego las soluciones de $Ax
= b$ y $A \tilde{x} = \tilde{b}$ satisfacen
$$
\frac{||x - \tilde{x}||}{||x||} 
\leq ||A|| \cdot ||A^{-1}|| \cdot \frac{||b - \tilde{b}||}{||b||}
$$

\Demostracion tenemos que $A x - A \tilde{x} = b - \tilde{b}$, y como $A$ es no
singular obtenemos $x - \tilde{x} = A^{-1} (b - \tilde{b})$. Luego, usando la
propiedad anterior obtenemos $||x - \tilde{x}|| = ||A^{-1}|| \cdot ||b -
\tilde{b}||$. Dividimos cada lado por $||x||$ obteniendo $||x - \tilde{x}|| / ||
x|| = ||A^{-1}|| \cdot ||b - \tilde{b}|| / ||x||$. Luego $||x - \tilde{x}|| / ||
x|| = ||A|| \cdot ||A^{-1}|| \cdot ||b - \tilde{b}|| / (||A|| \cdot ||x||)$ y
como $||b|| = ||Ax|| \leq ||A|| \cdot ||x||$ llegamos al resultado buscado.

#### Nota: 
El número $||A|| \cdot ||A^{-1}|| se conoce como el _número de condición_ de $A$
($K(A)$).

\_ 

De lo anterior se desprende que 
$$
\frac{||\Delta x||}{||x + \Delta x||} \leq K(A) \frac{||\Delta A||}{||A||}
$$

\Lema $K(A) \geq 1$

\Demostracion $1 = ||I|| = ||AA^{-1}|| \leq ||A|| \cdot ||A^{-1}|| = K(A)$.

--------------------------------------------------------------------------------

Métodos Iterativos
------------------

+ Generan una sucesión $\{x^{(k)}\}$ que converge a la solución.
+ Para $n$ grande, la eliminación de Gauss requiere $\frac{2}{3}n^3$
  operaciones, mientras que los métodos iterativos requieren $\approx n^2$.

### Esquema general de los Métodos Iterativos

Sea $A \in \real^{n \times n}$, $Ax = b$ el sistema a resolver. Sea $N \in
\real^{n \times n}$ no singular. Luego $N x = N x - A x + b$, de donde obtenemos
un proceso iterativo de la forma $N x^{(k+1)} = (N - A) x^{(k)} + b$, de donde
obtenemos $x^{(k+1)} = (I - N^{-1} A) x^{(k)} + N^{-1} b$ y solución del
sistema cumple que $x = (I - N^{-1} A) x + N^{-1} b$.

\_ 

Si $A = L + D + U$, luego:

+ El _método de Jacobi_ utiliza $N = D$.
+ El _método de Gauss-Seidel_ utiliza $N = L + D$.

#### Error de aproximación:
$e^{(k)} = x - x^{(k)}$ y restando $x = I - N^{-1} A) x + N^{-1} b$ y $x^{(k+1)}
= I - N^{-1} A) x^{(k)} + N^{-1} b$ obtenemos $e^{(k+1)} = (I - N^{-1} A)
e^{(k)}$.

\Teorema si $||I - N^{-1} A|| < 1$ entonces la sucesión $\{x^{(k)}\}$ converge a
la solución del sistema $Ax = b$ para cualquier estimación inicial $x^{(0)}$.

\Demostracion

\begin{align*}
|| e^{(k+1)} || = || (I - N^{-1} A) e^{(k)} ||
& \leq || I - N^{-1} A || \cdot || e^{(k)} || \\
& \leq || I - N^{-1} A || \cdot || (I - N^{-1} A) e^{(k-1)} ||
= || I - N^{-1} A ||^2 \cdot || e^{(k-1)} || \\
& \leq \ \cdots\ \leq || I - N^{-1} A ||^{k+1} \cdot || e^{(0)} || \\
\end{align*}

Como además sabemos que $|| I - N^{-1} A || < 1$, luego $||I - N^{-1} A||^{k+1}
\rightarrow 0$ cuando $k \rightarrow \infty$. Finalmente
$\limtoinf{k}{||e^{(k+1)||}} = 0 \implica x^{(\infty)} \rightarrow x$.

### Estabilidad Asintótica de un Sistema Lineal Discreto

\Teorema sea $B \in \real^{n \times n}$. El proceso iterativo $x^{(k+1)} =
Bx^{(k)}$ converge a $\underline{x} = \underline{0}$ para todo valor inicial
$x^{(0)}$ \sii $\rho(B) < 1$, donde $\rho(B)$ es el _radio espectral_ de $B$
($max |\lambda_i|$).

\Corolario la fórmula de iteración $N x^{(k+1)} = (N-A)x^{(k)} + b$ dará lugar a
una sucesión que converge a la solución del sistema $Ax = b$ para cualquier
$x^{(0)}$ \sii $rho(I - N^{-1} A) < 1$.

\Teorema si la matriz $A$ es diagonal dominante, luego la sucesión $\{x^{(k)}\}$
generada por el método de Jacobi converge a la solución del sistema $Ax = b$
para todo $x^{(0)}$ inicial.

\Teorema si la matriz $A$ es diagonal dominante, luego la sucesión $\{x^{(k)}\}$
generada por el método de Gauss-Seidel converge a la solución del sistema $Ax =
b$ para todo $x^{(0)}$ inicial.

### Método de Sobrerelajación (SOR)

Este método permite mejorar la convergencia usando relajación. La relajación
representa una ligera modificación del método de Gauss-Seidel y ésta permite
mejorar la convergencia en algunos casos. Después de que se calcula cada nuevo
valor de x, ése valor se modifica mediante un promedio ponderado de los
resultados de las iteraciones anterior y actual.
$$
x_i^{(k+1)} = (1-\omega) x_i^{(k)} 
+ \frac{\omega}{a_{ii}}\left( b_i - \sum_{j=1}^{i-1} a_{ij} x_j^{(k+1)} -
  \sum_{j=i+1}^{i-1} a_{ij} x_j^{(k)} \right) 
$$

Donde $\omega$ es el factor de relajación:

+ Si $\omega = 1$, tenemos el método de Gauss-Seidel
+ Si $0 < \omega < 1$, tenemos el método de Subrelajación (útil cuando
  Gauss-Seidel no converge).
+ Si $\omega > 1$, tenemos el método de Sobrerelajación (acelera la velocidad de
  convergencia cuando Gauss-Seidel converge).
  
\_ 

Si reescribimos la ecuación anterior, obtenemos:
$$
a_{ii} x_i^{(k+1)} + \omega \sum_{j=1}^{i-1} a_{ij} x_j^{(k+1)} 
= (1-\omega) a_{ii} x_i^{(k)} - \omega \sum_{j=i+1}^{i-1} a_{ij} x_j^{(k)} 
+ \omega b_i
$$

En forma matricial:
$$
(D + \omega L)x^{(k+1)} = [(1-\omega) D - \omega U]x^{(k)} + \omega b
$$

Luego, si existe $(D + \omega L)^{-1}$, entonces $x^{(k+1)} = T_{\omega}
x^{(k)} + C_{\omega}, donde $T_{\omega} = (D + \omega L)^{-1}[(1 - \omega)D -
\omega U]$ y $C_{\omega} = \omega (D + \omega L)^{-1} b$. Luego el error está
dado por $e^{(k+1)} = T_{\omega} e^{(k)}$, de donde se desprende que el método
SOR converge a la solución del $Ax = b$ para todo valor inicial \sii
$\rho(T_{\omega}) < 1$.

\Teorema sea $A \in \real^{n \times n}$, luego $\rho(A) \leq ||A||$ para
cualquier norma matricial submultiplicativa.

\Demostracion sea $(\lambda, v)$ un par autovalor-autovector de $A$ y
$\underline{X} = [v\ |\ 0\ |\ ...\ |\ 0] \in \real^{n \times n}$. Luego $\lambda
\underline{X} = A \underline{X}$, de donde tenemos que
$|\lambda|\cdot||\underline{X}|| = ||\lambda \underline{X}|| = ||A
\underline{X}|| \leq ||A|| \cdot ||\underline{X}||$. Luego $|\lambda| \leq||A||$
para todo $\lambda \in \sigma(A)$ (espectro de $A$), por lo tanto $rho(A)\leq||
A ||$.

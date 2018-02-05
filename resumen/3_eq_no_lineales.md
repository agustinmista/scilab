Solución de Ecuaciones No Lineales
==================================

Algoritmo
---------

\Definicion dado un punto inicial $x_0 \in \real^n$, un _algoritmo_ genera la
secuencia $x_1, x_2, ...$ donde $x_{k+1} \in A(x_k)$ para cada $k$. La
transformación de $x_k$ a $x_{k+1}$ constituye una _iteración_ del algoritmo.

### Criterios de Terminación

\begin{align*}
(1) &\quad || x_{k+n} - x_k || < \epsilon \\
(2) &\quad \frac{|| x_{k+1} - x_k ||}{||x_k||} < \epsilon \\
(3) &\quad | f(x_{k+n}) - f(x_k) | < \epsilon
\end{align*}

### Orden de Convergencia

\Definicion el _orden de convergencia_ de una sucesión $x_k \rightarrow
\underline{x}$ es el mayor número $\rho > 0$ tal que
$$ 
\limtoinf{k}{\frac{|| x_{k+1} - \underline{x} ||}{||x_k - \underline{x}||^\rho}}
= \beta < \infty
$$

+ Si $\rho = 1$ y $\beta \in (0,1)$, la convergencia es _lineal_ y $\beta$ es la
  _velocidad de convergencia_.
+ Si $\rho = 2$ y $\beta < \infty$, la convergencia es _cuadrática_.
+ Si $\rho > 1$ ó $\rho = 1$ y $\beta = 0$, la convergencia es _superlineal_.

\Definicion la convergencia es superlineal si
$$
\limtoinf{k}{\frac{|| x_{k+1} - \underline{x} ||}{||x_k - \underline{x}||}} = 0
$$
Además, la _convergencia cuadrática es superlineal_.

\_

Por otro lado, suponemos que la convergencia es de orden $\rho$, y sea $\alpha > 0$ y $\beta$ tal que $0 < \beta < \infty$:
$$
\limtoinf{k}{\frac{|| x_{k+1} - \underline{x} ||}
  {||x_k - \underline{x}||^{\rho+\alpha}}}
= \frac{\beta}{\limtoinf{k}{|| x_k - \underline{x} ||^{\alpha}}}
\quad \longrightarrow \quad \infty
$$
Por lo tanto, si se tiene convergencia de orden $\rho$, no se tiene convergencia
de orden $\rho+\alpha$ con $\alpha>0$.

Solución de Ecuaciones No Lineales
----------------------------------

### Raíces o Ceros

\Definicion sea $f : \real \rightarrow \real$ una función no lineal. Se llama
_raíz o cero_ de la ecuación $f(x) = 0$ a todo valor $\alpha$ tal que
$f(\alpha) = 0$.

\Teorema (de Bolsano) sea $f$ una función continua en $[a,b] \subset \real$ tal
que $f(a)f(b) < 0$, luego existe un $c \in [a,b]$ tal que $f(c) = 0$.

### Método de la Bisección

Suponemos que $f(x)$ es continua en $[a,b]$ y que $f(a)f(b) < 0$, luego $f$
tiene al menos una raíz en el intervalo. Dada una tolerancia del error
$\epsilon>0$:

1. Defina $c = (a+b)/2$.
2. Si $b - c \leq \epsilon$, aceptar $c$ como raíz y detenerse. 
3. Si $b - c > \epsilon$, comparar el signo de $f(c)$ con el de $f(a)$ y $f(b)$.
   + Si $f(b)f(c) \leq 0$, reemplazar $a$ con $c$. 
   + En caso contrario, reemplazar $b$ con $c$. 
4. Regresar al paso 1.

#### Acotación del Error

Tenemos que $b_{k+1} - a_{k+1} = \frac{1}{2}(b_k - a_k)$, luego por inducción
tenemos que $b_k - a_k = (\frac{1}{2})^{k-1}(b_1 - a_1)$. Si $\alpha$ es una
solución del sistema, luego $|\alpha - c_k| \leq (\frac{1}{2})^{k-1}(b_1 - a_1)$
y $c_k$ converge a $\alpha$ cuando $k \rightarrow \infty$.

Si queremos obtener un error $|\alpha - c_k| \leq \epsilon$, esto se cumple
cuando:
$$
k \geq \frac{ln(\frac{b-a}{\epsilon})}{ln(2)}
$$

#### Ventajas

1. Siempre converge
2. Acotación de error garantizado
3. Velocidad de convergencia garantizada.

#### Desventaja

1. La convergencia es lenta en comparación con otros métodos.

### Método de Newton (Newton-Raphson)

Sea $\alpha$ una raíz de $f(x) = 0$. Supongamos que $f \in \mathbb{C}^2$ en
$[a,b]$ y sea $x_0 \in [a,b]$ una estimación "cercana" de $\alpha$. Consideramos
el polinomio de Taylor $f(x) = f(x_0) + (x - x_0)f'(x_0) + \frac{(x -
x_0)^2}{2}f''(cx)$ con $cx$ entre $x$ y $x_0$. Obtenemos una nueva estimación de
$\alpha$ haciendo $P_1(x) = 0 = f(x_0) + (x_1 - x_0)f'(x)$ de donde $x_1 = x_0 -
(f(x_0) / f'(x_0))$. Repitiendo el proceso obtenemos que $x_{n+1} = x_n -
(f(x_n) / f'(x_n))$.

#### Análisis del Error

\begin{align*}
0 = f(\alpha) 
&= f(x_n) + (\alpha - x_n)f'(x_n) + (\alpha - x_n)^2 \,\frac{f''(cx)}{2} \\
&= \frac{f(x_n)}{f'(x_n)} + (\alpha - x_n) 
+ (\alpha - x_n)^2 \,\frac{f''(cx)}{2f'(x_n)}\\
&= (x_n - x_{n+1}) + \alpha - x_n + (\alpha - x_n)^2 \,\frac{f''(cx)}{2f'(x_n)}\\
&\Rightarrow \alpha - x_{n+1} = (\alpha - x_n)^2 \frac{f''(cx)}{2f'(x_n)} 
\qquad \text{(Error)} \\
&\Rightarrow \frac{|\alpha - x_{n+1}|}{(\alpha - x_n)^2} 
=  \left|\frac{f''(cx)}{2f'(x_n)}\right|
\qquad \text{(Orden de convergencia)} \\
\end{align*}

Es decir, suponiendo que el método converge, éste lo hace de manera cuadrática.
Sin embargo, la convergencia no está garantizada a partir de cualquier valor
inicial $x_0$.

#### Ventajas

1. Converge rápidamente en la mayoría de los casos.
2. Formulación sencilla.

#### Desventajas

1. Puede no converger.
2. Puede ocurrir que $f'(\alpha) = 0$.
3. Necesitamos conocer tanto $f(x)$ como $f'(x)$.

### Método de la Secante

$$
x_{n+1} = x_n - f(x_n)\frac{x_n - x_{n-1}}{f(x_n) - f(x_{n-1})}
$$

Si $x_n$ converge a $\alpha$ entonces $\rho \approx 1.62$.

#### Ventajas

1. Converge más rápido que la convergencia lineal
2. No requiere $f'(x)$.
3. Requiere una única evaluación de $f(x)$ por iteración.

#### Desventajas

1. Puede no converger.
2. Puede tener dificultades si $f'(\alpha) = 0$.
3. El método de Newton se puede generalizar más fácilmente a sistemas de
   ecuaciones.
  
### Método de la Falsa Posición

Elegimos las aproximaciones iniciales $a_1$ y $b_1$ con $f(a_1)f(b_1) < 0$,
luego obtenemos $c_1$ aplicando el método de la secante sobre $a_1$ y $b_1$.

+ Si $f(a_1)f(c_1) < 0$, luego $a_2 = a_1$ y $b_2 = c_1$ 
+ Si $f(b_1)f(c_1) < 0$, luego $a_2 = c_1$ y $b_2 = b_1$
+ Si $f(c_1) = 0$, entonces $\alpha = c_1$

Luego $c_2$ aplicando el método de la secante a $a_2$ y $b_2$, y repetimos el
proceso.

#### Ventajas

1. La convergencia está garantizada.

#### Desventajas

1. Más lento que el método de la secante.

Métodos Iterativos de Punto Fijo
--------------------------------

#### Fórmula General
$x_{n+1} = g(x_n)$ donde $g(x)$ es una función apropiada.

### Punto fijo

\Definicion dada una función $g : \real \rightarrow \real$ continua diremos que
$\alpha$ es un punto fijo de $g$ si $g(\alpha) = \alpha$.

+ El método puede converger o diverger dependiendo de $x_0$.
+ El método puede converger a una raíz u otra dependiendo de la elección de
  $g(x)$.
+ La convergencia puede ser más rápida o más lenta dependiendo de $g(x)$.

\Ejemplo el método de Newton es un método iterativo de punto fijo con $g(x) = x
-(f(x) / f'(x))$.

### Existencia de Soluciones de $x = g(x)$

\Lema sea $g(x)$ una función continua en $[a,b)$ y suponga que $g$ satisface que
$a \leq x \leq b \implica a \leq g(x) \leq b$. Luego $x = g(x)$ tiene al menos
una solución en $[a,b]$.

\Demostracion consideremos la función continua $f(x) = x - g(x)$ con $a \leq x
\leq b$. Evaluando los puntos extremos, $f(a) \leq 0$ y $f(b) > 0$. Luego por
teorema de Bolsano existe $\alpha \in [a,b]$ tal que $f(\alpha) = 0$ y por ende
$\alpha = g(\alpha)$.

\Teorema sea $g : \real \rightarrow \real$ tal que $g \in \mathbb{C}^1$ en
$[a,b]$. Suponga que $g$ satisface $a \leq x \leq b \implica a \leq g(x) \leq
b$. Si $\lambda := sup |g'(x)| < 1$ con $x \in [a,b]$. Luego se cumplen:

1. Existe una solución única $\alpha$ de la ecuación $x = g(x)$ en $[a,b]$.
2. Para cualquier valor inicial $x_0 \in [a,b]$, la iteración $x_{n+1} = g(x_n)$
   converge a $\alpha$.
3. $|\alpha - x_n| \leq \lambda^n(x_0 - x_1) / (1-\lambda)$
4. $\limtoinf{n}{(\alpha - x_{n+1}) / (\alpha - x_n)} = g'(\alpha)$. Por lo
   tanto para $x_n$ cercano a $\alpha$ tenemos que $\alpha - x_{n+1} \approx
   g'(\alpha)(\alpha - x_n)$,

\Demostracion las hipótesis sobre $g$ permiten aplicar el lema anterior para
afirmar que existe al menos una solución de $x = g(x)$ en $[a,b]$. Luego por el
teorema del valor medio tenemos que para $w, z \in [a,b]$ se cumple $g(w) - g(z)
= g'(c)(w-z)$ para algún $c$ entre $w$ y $z$. Luego $|g(w) - g(z)| = |g'(c)|
|w-z| \leq \lambda |w - z|$.

\_

1. Por contradicción. Supongo que existen dos soluciones $\alpha$ y $\beta$.
   Luego $\alpha = g(\alpha)$ y $\beta = g(\beta)$. Restando miembro a miembro
   tengo que $\alpha - \beta = g(\alpha) - g(\beta)$ lo cual implica que
   $|\alpha - \beta| \leq \lambda |\alpha - \beta|$. Luego $(1 -
   \lambda)|\alpha - \beta| \leq 0$, y como $0 < \lambda < 1$ tenemos que
   $\alpha = \beta$ y $x = g(x)$ tiene única solución el $[a,b]$.

2. La propiedad $a \leq x \leq b \implica a \leq g(x) \leq b$ implica que dado
   $x_0 \in [a,b]$, las iteraciones $x_k \in [a,b]$. Luego para demostrar que
   las iteraciones convergen, restar $x_{n+1} = g(x_n)$ de $\alpha = g(\alpha)$,
   obteniendo $\alpha - x_{n+1} = g(\alpha) - g(x_{n+1}) = g'(cn)(\alpha - x_n)$
   para algún $cn$ entre $\alpha$ y $x_n$. Luego $|\alpha - x_{n+1}| \leq
   \lambda |\alpha - x_n|$ **(A)**. Por inducción obtenemos que $|\alpha - x_n|
   \leq \lambda^n |\alpha - x_0|$ **(B)**. Como $\alpha < 1$, $\alpha^n
   \rightarrow 0$ cuando $n \rightarrow \infty$, y tenemos que $x_n \rightarrow
   \alpha$ cuando $n \rightarrow \infty$.

3. Por desigualdad triangular tenemos que $|\alpha - x_0| \leq |\alpha - x_1| +
   |x_1 - x_0|$, luego aplicamos **(A)** con $n = 0$ obtenemos $|\alpha - x_0|
   \leq \lambda |\alpha - x_0| + |x_1 - x_0|$ de donde despejamos $|\alpha -
   x_0| \leq |x_1 - x_0| / (1 - \lambda)$. Multiplicando ambos lados por
   $\lambda^n$ obtenemos $|\alpha - x_0| \leq \lambda^n(x_0 - x_1) /
   (1-\lambda)$ y aplicando **(B)** obtenemos el resultado buscado.
   
4. Vimos que $\alpha - x_{n+1} = g'(cn)(\alpha - x_n)$ para algún $cn$ entre
   $\alpha$ y $x_n$. Luego $\limtoinf{n}{(\alpha - x_{n+1})/(\alpha - x_n)} =
   \limtoinf{n}{g'(cn)} = g'(\alpha)$ ya que $x_n \rightarrow \alpha$ cuando $n
   \rightarrow \infty$.

\Corolario suponga que $x = g(x)$ tiene una solución $\alpha$ y suponga que $g$
y $g'$ son continuas en un intervalo alrededor de $\alpha$. Luego:

1. Si $|g'(\alpha)| < 1$, entonces la iteración $x_{n+1} = g(x_n)$ converge a
   $\alpha$ para $x_0$ suficientemente cercano a $\alpha$.
2. Si $|g'(\alpha)| > 1$, entonces la iteración $x_{n+1} = g(x_n)$ no converge a
   $\alpha$.
3. Si $|g'(\alpha)| = 1$, no se pueden sacar conclusiones.

\Demostracion 
 
1. Vimos que $\alpha - x_{n+1} = g'(cn)(\alpha - x_n)$ para algún $cn$ entre
   $\alpha$ y $x_n$. Luego $|\alpha - x_{n+1}| = |g'(cn)| |\alpha - x_n|$.
   Siendo $g'(x)$ continua y $|g'(\alpha)| < 1$, existe $\epsilon > 0$ tal que
   $|g'(x)| < 1$ para todo $x \in [\alpha - \epsilon, \alpha + \epsilon]$. Luego
   $cn$ también pertenece a $[\alpha - \epsilon, \alpha + \epsilon]$ y $|g'(cn)|
   < 1$. Por lo tanto $x_{n+1}$ está más próximo a $\alpha$ que $x_n$, por lo
   que la iteración converge a $\alpha$.

2. Vimos que $\alpha - x_{n+1} = g'(cn)(\alpha - x_n)$ para algún $cn$ entre
   $\alpha$ y $x_n$. Luego $|\alpha - x_{n+1}| = |g'(cn)| |\alpha - x_n|$.
   Siendo $g'(x)$ continua y $|g'(\alpha)| > 1$, existe $\epsilon > 0$ tal que
   $|g'(x) > 1|$ para todo $x \in [\alpha - \epsilon, \alpha + \epsilon]$. Luego
   $cn$ también pertenece a $[\alpha - \epsilon, \alpha + \epsilon]$ y $|g'(cn)|
   > 1$. Por lo tanto $x_{n+1}$ está más alejado a $\alpha$ que $x_n$, por lo
   que la iteración no converge a $\alpha$.

### Sistemas de Ecuaciones No Lineales

$$
S = 
\begin{cases}
f_1(x_1, x_2) = 0 \\ 
f_2(x_1, x_2) = 0
\end{cases}
$$

En forma vectorial, $f(\underline{x}) = \underline{0}$ con $f = [f_1\ f_2]^T$,
$\underline{x} = [x_1\ x_2]^T$ y $\underline{0} = [0\ 0]^T$.

#### Punto Fijo:
reescribimos $S$ como
$$
S = 
\begin{cases}
x_1^{(n+1)} = g_1(x_1^{(n)}, x_2^{(n)}) \\ 
x_2^{(n+1)} = g_2(x_1^{(n)}, x_2^{(n)}) 
\end{cases}
$$

Usando el método de Newton tenemos:
\begin{align*}
0 &= f_1(x_1^{(0)}, x_2^{(0)}) 
+ (x_1^{(1)} - x_1^{(0)})\frac{\delta f_1}{\delta x_1} (x_1^{(0)}, x_2^{(0)})
+ (x_2^{(1)} - x_2^{(0)})\frac{\delta f_1}{\delta x_2} (x_1^{(0)}, x_2^{(0)}) \\
0 &= f_2(x_1^{(0)}, x_2^{(0)}) 
+ (x_1^{(1)} - x_1^{(0)})\frac{\delta f_2}{\delta x_1} (x_1^{(0)}, x_2^{(0)})
+ (x_2^{(1)} - x_2^{(0)})\frac{\delta f_2}{\delta x_2} (x_1^{(0)}, x_2^{(0)})
\end{align*}

Denotamos al Jacobiano de $f$ como
$$
J =
\begin{bmatrix}
\frac{\delta f_1}{\delta x_1} & \frac{\delta f_1}{\delta x_2} \\ 
\\
\frac{\delta f_2}{\delta x_1} & \frac{\delta f_2}{\delta x_2} 
\end{bmatrix}
$$

Luego, en forma matricial, $\underline{x_0} = [x_1^{(0)}\ x_2^{(0)}]^T$ y
$\underline{0} = f(\underline{x_0}) + J(\underline{x_0})(\underline{x_1} -
\underline{x_0})$, de donde obtenemos que $\underline{x_1} = \underline{x_0} -
[J(\underline{x_0})]^{-1} f(\underline{x_0})$ si $J(\underline{x_0})$ es no
singular. Finalmente, la iteración general del método resulta: 
$$
\underline{x_{n+1}} 
= \underline{x_n} - [J(\underline{x_n})]^{-1}f(\underline{x_n})
$$

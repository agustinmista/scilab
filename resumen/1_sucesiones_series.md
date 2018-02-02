Sucesiones y Series
===================

Sucesiones Numéricas
--------------------

\Definicion una sucesión es una función $f : \nat \rightarrow \mathbb{R}$. Una
sucesión genera una lista infinita de números $f(1), f(2), ..., f(n), ...$.
También puede notarse $f_1, f_2, ..., f_n, ...$ ó $\{f(n)\}$ ó $\{f_n\}$ ó
$\{f_n\}_{n=1}^\infty$.

### Sucesión Convergente

Una sucesión $f_n$ es _convergente_ si existe un número real $L$ tal que para
cada $\epsilon > 0$ se puede encontrar un número natural $N(\epsilon)$ tal que
$\forall n > N$ se verifique $|f_n - L| < \epsilon$. Se dice entonces que $L$ es
el _límite_ de la sucesión $f_n$, y se escribe $L = \limtoinf{n}{f_n}$ ó $f_n
\longrightarrow L$. Decimos entonces que $f_n$ _converge_ a $L$. Una sucesión no
convergente se llama _divergente_.

\Teorema (Unicidad del límite) una sucesión convergente tiene un único
límite.

### Sucesiones Acotadas

\Definicion una sucesión $f_n$ se dice que está _acotada superiormente_ si
existe un número $c \in \mathbb{R}$ tal que $\forall n \in \nat, f_n \leq c$. Se
dice que está _acotada inferiormente_ si existe un número $k \in \mathbb{R}$ tal
que $\forall n \in \nat, f_n \geq k$. Se dice que está _acotada_ si lo está
superior e inferiormente, es decir que existe $M > 0$ tal que $\forall n \in
\nat, |f_n| \leq M$.

### Monotonía

\Definicion una sucesión $f_n$ es:

+ _Monótona creciente_ si $\forall n \in \nat, f_n \leq f_{n+1}$.
+ _Monótona decreciente_ si $\forall n \in \nat, f_{n+1} \leq f_n$.
+ _Estrictamente creciente_ si $\forall n \in \nat, f_n < f_{n+1}$.
+ _Estrictamente decreciente_ si $\forall n \in \nat, f_{n+1} < f_n$.

\Teorema 

1. Toda sucesión monótona creciente y acotada superiormente converge.
2. Toda sucesión monótona decreciente y acotada inferiormente converge.

### Operaciones con Sucesiones

\Teorema sean $a_n$ y $b_n$ sucesiones convergentes con límites $a$ y $b$
respectivamente. Luego se cumplen las siguientes reglas:

1. $\limtoinf{n}{(a_n + b_n)} = a + b$
2. $\limtoinf{n}{(a_n - b_n)} = a - b$
3. $\limtoinf{n}{(a_n \cdot b_n)} = a \cdot b$
4. $\limtoinf{n}{(c \cdot a_n)} = c \cdot a$ ($c \in \mathbb{R}$)
5. $\limtoinf{n}{(a_n / b_n)} = a / b$ (si $b \neq 0$)

\Teorema (del Sándwich) sean $a_n$, $b_n$ y $c_n$ sucesiones. Si $a_n \leq b_n
\leq c_n$ para todo $n > N \in \nat$ y $\limtoinf{n}{a_n} = \limtoinf{n}{c_n} =
L$ entonces $\limtoinf{n}{b_n} = L$.

\Teorema suponga que $f(x)$ es una función definida para todo $x \geq N$ y que
$f_n$ es una sucesión de números reales tal que $f_n = f(n)$ para todo $n \geq
N$, entonces $\limtoinf{x}{f(x)} = L \Rightarrow \limtoinf{n}{f_n} = L$. Por lo
tanto podemos usar la regla de L'Hopital para calcular límites de sucesiones.

Series Numéricas
----------------

\Definicion dada una sucesión $a_n$ formamos otra $S_n$ para la cual $S_n =
a_1 + a_2 + \cdots + a_n = \serie{a_n}$. Luego la sucesión $S_n$ es llamada
_serie infinita_ o _serie_ y se indica como \serie{a_n}.

Una serie \serie{a_n} se dice:

+ _de términos positivos_ si $\forall n, a_n > 0$.
+ _alternada_ si $a_n = (-1)^n c_n$ para alguna sucesión $c_n$ tal que $\forall
  n, c_n > 0$.

\Ejemplo

+ Serie _armónica:_ \serie{1/n}
+ Serie _geométrica_ (de razón $r$): \serie{r^n}
  * Si $r > 0$ es una serie de términos positivos.
  * Si $r < 0$ es una serie alternada.
  * Si $r \neq 1$ entonces $\serie{r^n} = \frac{1 - r^{n+1}}{1 - r}$
  
### Convergencia y Divergencia de Series

\Definicion se dice que la serie \serie{a_n} es convergente cuando la sucesión
$S_n$ tiene límite finito, y notamos $\limtoinf{n}{(\serieidx{k}{a_k})} =
\limtoinf{n}{S_n} = S$.

\Ejemplo la serie armónica \serie{1/n} no converge.

Sabemos que $\frac{1}{2} \leq S_{2n} - S_n$, luego suponemos que existe $s$ tal
que $\limtoinf{n}{S_n} = s$:
$$ 
\frac{1}{2} \leq \limtoinf{n}{S_{2n}} - \limtoinf{n}{S_n} = s - s = 0
\qquad\text(ABS!) 
$$

### Condición Necesaria de Convergencia

\Teorema si la serie \serie{a_n} converge, entonces $\limtoinf{n}{a_n} = 0$. En
cambio, si $\limtoinf{n}{a_n} \neq 0$ entonces \serie{a_n} es divergente.

\Demostracion suponemos que la serie \serie{a_n} converge a $s$, luego: 
$$ 
a_k = S_k - S_{k-1} \Rightarrow \limtoinf{n}{S_k} - \limtoinf{n}{S_{k-1}}
= s - s = 0
$$

\Ejemplo Serie geométrica $\serieidx{0}{r^n} = \serie{r^{n-1}}$.

+ Si $|r| \geq 1$ entonces $\limtoinf{n}{r^n} \neq 0 \Rightarrow$ la serie
  diverge.
+ Si $|r| < 1$ entonces $\limtoinf{n}{r^n} = \limtoinf{n}{\frac{1-r^{n+1}}{1-r}}
  = \frac{1}{1-r}$.

### Reindexado de Términos

Si $a_n$ es una serie, entonces.
$$ 
\serie{a_n} = \seriefrom{n=1+h}{a_{n-h}} = \seriefrom{n=1-h}{a_{n+h}}
$$
Si \serie{a_n} converge, entonces \seriefrom{n=k}{a_n} converge para cualquier
$k > 1$. 
$$
\serie{a_n} = a_1 + a_2 + \cdots + a_{k-1} + \seriefrom{n=k}{a_n}
$$
En particular para la serie geométrica $\serie{r^n} = \frac{r}{1-r}$ si
$|r| < 1$.

### Propiedad de Linearidad

\Teorema sean \serie{a_n} y \serie{b_n} series convergentes con sumas $a$ y $b$
respectivamente. Si $\alpha$ y $\beta$ son constantes entonces \serie{\alpha
a_n + \beta b_n} es convergente con suma $\alpha a + \beta b$.

\Corolario si \serie{a_n} converge y \serie{b_n} diverge entonces \serie{a_n +
b_n} diverge.

\Demostracion si \serie{a_n + b_n} fuera convergente, entonces también lo sería
\serie{b_n} ya que $\serie{b_n} = \serie{a_n + b_n} + \serie{(-a_n)}$.

### Propiedad Telescópica

\Definicion una serie \serie{a_n} es _telescópica_ cuando se puede escribir como
\serie{b_n - b_{n+1}} para alguna sucesión $b_n$ tal que $a_n = b_n - b_{n+1}$.
Luego tenemos que $\seriefromto{k=1}{n}{b_k - b_{k+1}} = b_1 - b_{n+1}$.

\Teorema sean $a_n$ y $b_n$ sucesiones tales que $a_n = b_n - b_{n+1}$. Luego
\serie{a_n} converge \sii la **sucesión** $b_n$ converge. En cuyo caso
$\serie{a_n} = b_1 - \limtoinf{n}{b_n}$.

### Criterios de Convergencia de Series de Términos Positivos

+ **Criterio de Acotación:** si $\forall n \geq 1, a_n \geq 0$, entonces
  \serie{a_n} converge \implica la sucesión de sus sumas parciales está acotada
  superiormente.

+ **Criterio de Comparación:** si $a_n \geq 0$, $b_n \geq 0$ y existe $c > 0$
  tal que $a_n \leq c b_n$ si $n \geq N$ para algún $N$, entonces:
  * Si \serie{b_n} converge \implica \serie{a_n} converge.
  * Si \serie{a_n} diverge \implica \serie{b_n} diverge.

+ **Criterio del Límite:** sean $a_n$ y $b_n$ sucesiones tales que $a_n \geq 0$
  y $b_n \geq 0$ y sea $\lambda = \limtoinf{n}{\frac{a_n}{b_n}}$. Si $\lambda$
  es finito y $\lambda \neq 0$, entonces \serie{b_n} converge \sii \serie{a_n}
  converge.

+ **Criterio de la Raíz:** sea $a_n$ una sucesión tal que $a_n > 0$ y sea
  $\alpha = \limtoinf{n}{\sqrt[n]{a_n}}, entonces:
  * $\alpha < 1$ \implica \serie{a_n} converge. 
  * $\alpha > 1$ \implica \serie{a_n} diverge. 
  * $\alpha = 1$ \implica el criterio no decide. 

+ **Criterio del Cociente:** sea $a_n$ una sucesión tal que $a_n > 0$ y sea
  $\alpha = \limtoinf{n}{\frac{a_{n+1}}{a_n}}$, entonces:
  * $\alpha < 1$ \implica \serie{a_n} converge. 
  * $\alpha > 1$ \implica \serie{a_n} diverge. 
  * $\alpha = 1$ \implica el criterio no decide. 

+ **Criterio de la integral:** sea $f$ una función **positiva** y
  **estrictamente decreciente** definida en $[1, \infty)$ tal que $\forall n \in
  \nat, f(n) = a_n$. La serie \serie{a_n} converge \sii $\int_1^\infty f(x)dx$
  converge.

### Criterios de Convergencia de Series Alternadas

+ **Criterio de Leibniz:** si $a_n$ es una sucesión **monótona decreciente** con
  límite 0, entonces la serie alternada \serie{(-1)^{n-1}a_n} converge.

### Convergencia Condicional y Absoluta

\Teorema si \serie{|a_n|} converge, entonces \serie{a_n} converge y además
tenemos que $|\serie{a_n}| \leq \serie{|a_n|}$.

\Demostracion definimos la sucesión de términos positivos $b_n = a_n +|a_n|$.
Luego resulta $b_n = 0$ ó $b_n = 2 |a_n |$ y siempre vale que $0 \leq b_n \leq
2|a_n|$. Como además sabemos que \serie{|a_n|} converge y $2\serie{|a_n|}$
domina a \serie{b_n} luego \serie{b_n} converge. Como \serie{b_n} converge y
$\serie{a_n} = \serie{b_n} - \serie{|a_n|}$ entonces \serie{a_n} converge por el
teorema de linearidad.

\Definicion una serie \serie{a_n} es _absolutamente convergente_ si
\serie{|a_n|} es convergente.

\Definicion una serie \serie{a_n} es _condicionalmente convergente_ si
\serie{a_n} es convergente pero \serie{|a_n|} es divergente.

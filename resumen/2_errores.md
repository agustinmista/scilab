Errores
=======

Representación Computacional de Números
---------------------------------------

### Enteros Binarios

$$
x = (a_n a_{n-1} ... a_1 a_0)_2 \quad\text{con}\quad a_i \in \{0,1\}
$$

#### Binario $\rightarrow$ Decimal:
$$
x = a_n 2^n + a_{n-1} 2^{n-1} + \cdots + a_1 2^1 + a_0 = \sum_{n=0}^n a^n 2^n
$$

#### Decimal $\rightarrow$ Binario:
$$
\text{$x$ número decimal} \ \rightarrow \
\text{dividir x por 2} \ \rightarrow \
\text{llamar $x$ al cociente y $a_0$ al resto} \ \rightarrow \
\text{repetir}
$$

### Fracciones Binarias

$$
x = (.a_1 a_2 ... a_m ...)_2 \quad\text{con}\quad a_i \in \{0,1\}
$$

#### Binario $\rightarrow$ Decimal:
$$
x = a_1 2^{-1} + a_2 2^{-2} + \cdots + a_m 2^{-m} + \cdots 
= \sum_{n=0}^\infty a^n 2^{-n}
$$

#### Decimal $\rightarrow$ Binario:
$$
\text{$x$ número decimal} \ \rightarrow \
\text{multiplicar x por 2} \ \rightarrow \
\text{llamar $x$ a la parte decimal y $a_1$ a la parte entera} \ \rightarrow \
\text{repetir}
$$

Representación Computacional de Números en Punto Flotante
---------------------------------------------------------

Sea $x \in \real$, $x$ se representa en punto flotante ($fl(x)$) como:

$$ 
fl(x) = \delta(. a_1 a_2 ... a_n)_\beta \cdot \beta^E 
$$

Donde:

+ $\beta$: base de representación
+ $\delta$: signo (0 = positivo, 1 = negativo)
+ $E$: exponente ($E \in \integer$)

### Norma IEEE754 para Números en Punto Flotante

Sea $x \in \real$, $x$ se representa en punto flotante IEEE754 ($fl(x)$) como:

$$ 
fl(x) = \delta(\text{\textbf{1}}. a_1 a_2 ... a_n)_2 \cdot 2^E 
$$

#### Precisión Simple (32 bits) 
$\qquad\rightarrow\qquad\underbracket{\hbox{\qquad1\qquad}}_{\hbox{signo}}
\underbracket{\hbox{\quad\qquad8\quad\qquad}}_{\hbox{exponente}}
\underbracket{\hbox{\qquad\qquad23\qquad\qquad}}_{\hbox{mantisa}}$

#### Precisión Doble (64 bits)
$\;\, \qquad\rightarrow \qquad\underbracket{\hbox{\qquad1\qquad}}_{\hbox{signo}}
\underbracket{\hbox{\quad\qquad11\quad\qquad}}_{\hbox{exponente}}
\underbracket{\hbox{\qquad\qquad52\qquad\qquad}}_{\hbox{mantisa}}$

#### Máximo valor del exponente con precisión simple:
$\qquad (11111111)_2 = 2^8-1 = 255.\\$ En IEEE754 se representan del 1 al 254, 0
y 255 está reservados para casos especiales. Utilizando un sesgo de 127 se
pueden representar exponentes en el rango $-126 \leq E \leq 127$.

\_

_¿Cuál es el mayor entero $M$ tal que todo entero $x$ tal que $0 \leq x \leq M$
se puede representar en forma exacta en punto flotante?_

$$
(1.11...1)_2 \cdot 2^{23} = 2^{23} + 2^{22} + \cdots + 2^1 + 2^0 = 2^{24} + 1
$$

\_ 

_¿Cuál es el menor número $y$ representable que es mayor que 1?_

$$
(1.00...01)_2 \cdot 2^0 = 1 + 2^{-23}
$$

Luego el _epsilon de la máquina_ es $\epsilon = y - 1 = 2^{-23}$.

#### Corte o Truncamiento:
si $x$ tiene una mantisa $\underline{x}$ que no cabe en el espacio disponible de
$n$ bits, el _truncamiento_ consiste en cortar los dígitos $a_{n+1}, a_{n+2},
...$. Luego el error es $x - fl(x)$ y es siempre positivo, lo cual puede generar
propagación de errores.

#### Redondeo en Decimal: 

$$
fl(x)=
\begin{cases}
\delta(. a_1 a_2 ... a_n)_{10} \cdot 10^E, & a_{n+1} < 5 \quad(\text{truncar})\\ 
\delta [(. a_1 a_2 ... a_n)_{10} + (.0 0 ... 0 1)_{10} ] 
  \cdot 10^E, & a_{n+1} \geq 5 \quad(\text{redondear})
\end{cases}
$$

#### Redondeo en Binario:

$$
fl(x)=
\begin{cases}
\delta(1 . a_1 a_2 ... a_n)_2 \cdot 2^E, & a_{n+1} = 0\\ 
\delta [(1 . a_1 a_2 ... a_n)_2 + (.0 0 ... 0 1)_2 ] \cdot 2^E, & a_{n+1} = 1 
\end{cases}
$$

\_

Usando redondeo el mayor error posible es la mitad que usando truncamiento.
Tiene en promedio la mitad de las veces y la mitad el otro, por lo que *reduce
la propagación de errores*.

Error Absoluto y Relativo
-------------------------

#### Error Absoluto:

$|\text{valor verdadero} - \text{valor aproximado}| = |x_v - x_a|$

#### Error Relativo:

$\frac{\text{error absoluto}}{|\text{valor verdadero|}} = \frac{|x_v -
x_a|}{|x_v|}$

Cifras Significativas
---------------------

\Definicion se dice que $x_a$ tiene $m$ cifras significativas con respecto a
$x_v$ si $|error(x_a)| \leq 5$ unidades en el dígito $m+1$ de $x_v$, contando de
izquierda a derecha desde el primer dígito distinto de 0.

\Ejemplo $x_a = 0.02138$, $x_v = 0.02144$, luego $|x_v - x_a| = 0.0006$ y $x_a$
tiene 2 cifras significativas.

\_ 

Se puede demostrar que si el error relativo de $x_a$ respecto de $x_v$ es menor
a $5 \times 10 ^{-m-1}$ luego $x_a$ tiene $m$ cifras significativas respecto a
$x_v$.

### Fuentes de Errores en Problemas Matemáticos de Ingeniería

+ Errores de Modelado Matemático
+ Equivocaciones
+ Errores Observacionales
+ Errores de Redondeo/Truncamiento
+ Errores de Aproximación Matemática

Polinomio de Taylor
-------------------

\Definicion sea $f(x)$ una función derivable alrededor de $x = a$, con tantas
derivadas como sea necesario. Buscamos un polinomio $P(x)$ tal que:
\begin{align*}
P(a) &= f(a) \\
P'(a) &= f'(a) \\
&\vdots \\
P^{(n)}(a) &= f^{(n)}(a)
\end{align*}

La fórmula general para dicho polinomio es:
$$
P_n(x) 
= f(a) 
+ f'(a)(x-a) 
+ \frac{1}{2}f''(a)(x-a)^2 
+ \cdots + \frac{1}{n!} f^{(n)}(a)(x-a)^n
= \sum_{i=0}^n \frac{f^{(n)}(a)}{n!} (x-a)^n
$$
Luego $f(x) \approx P_n(x)$ alrededor de $a$.

### Error del Polinomio de Taylor

\Teorema suponga que $f(x)$ tiene $n+1$ derivadas continuas en un intervalo
$\alpha \leq x \leq \beta$ y que el punto $a$ pertenece a dicho intervalo. El
error del polinomio de Taylor está dado por
$$ 
R_n(x) = f(x) - P_n(x) = \frac{f^{(n+1)}(cx)}{(n+1)!} (x-a)^{n+1}  
$$
donde $cx$ pertenece al intervalo entre $x$ y $a$.

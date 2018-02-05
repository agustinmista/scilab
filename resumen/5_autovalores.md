Aproximación de Autovalores
===========================

\Definicion sea $A \in \real^{n \times n}$. Si existe un número $\lambda$ y un
vector $v \neq 0$ tales que $A v = \lambda v$ decimos que $\lambda$ es un
_autovalor_ de $A$ y que $v$ es un _autovector_ de $A$. Además, si $v$ es un
autovector de $A$, luego $\alpha v$ es un autovector de $A$ para cualquier
$\alpha \in \real \neq 0$.

#### ¿Cómo calcular $\lambda$ y $v$?
Sabemos que $A v = \lambda v$, luego $(\lambda I - A) v = 0$ (con $v \neq 0$).
Llamamos _polinomio característico de $A$_ a $f(\lambda) = det(\lambda I - A)$.
Además, si $A \in \real^{n \times n}$, luego $f(\lambda)$ es un polinomio de
grado $n$.

\Teorema sea $A \in \real^{n \times n}$ una matriz simétrica real. Luego existe
un conjunto de pares autovalor-autovector ${\lambda_i, v^{(i)}}, i=1,...,n$ que
satisfacen:

1. Los autovalores $\lambda_1, ..., \lambda_n$ son las raíces del polinomio
   característico de $A$. Todos son números reales.

2. Los autovectores $v{(1)}, ..., v^{(n)}$ _ortogonales_ entre si, y pueden
   elegirse de longitud 1. Es decir, $v^{(i)T} v^{(j)} = 0$ y $v^{(i)T} v^{(i)}
   = 1$.
3. Para cada vector $x = [x_1, x_2, ..., x_n]^T$ existe un único vector $c =
   [c_1, c_2, ..., c_n]$ tal que $x = c_1 v^{(1)} + \cdots + c_n v^{(n)}$. Las
   constantes están dadas por $c_i = \sum_{j=1}^n x_j v_j^{(i)} = x^T v^{(i)}$
   donde $long(v^{(i)}) = 1$.
4. Definir la matriz $U = [v^{(1)}\ v^{(2)}\ \cdots v^{(n)}]$. Luego $U^T A U =
   D$ matriz diagonal con $D_{ii} = \lambda_i$. Además $U U^T = U^T U = I$, y $A
   = U D U^T$.
   
### Círculos de Gerschgorín

\Definicion sea $A \in \real^{n \times n}$, luego para $i=1,...,n$ sean:
$$ 
r_i = \sum_{j=1\ j\neq i}^n |a_{ij}|,
\qquad \qquad c_i = \{z \in \mathbb{C} : |z - a_{ii}| \leq r_i\} 
$$

\Teorema sea $A \in \real^{n \times n}$ y sea $\lambda$ un autovalor de $A$.
Luego $\lambda \in C_i$ para algún $i=1,...,n$.

\Demostracion sea $\lambda$ un autovalor de $A$ y $v$ el autovector asociado.
Sea $k$ la componente de $v$ tal que $|v_k| = ||v||_{\infty}$. Luego:
\begin{align*}
A v = \lambda v 
& \implica \sum_{j=1}^n a_{kj} v_j 
= \lambda v_k \quad \text{(k-ésimo componente)} \\
& \implica \sum_{j=1\ j \neq k}^n a_{kj} v_j + a_{kk} v_k 
= \lambda v_k \\
& \implica (\lambda - a_{kk}) v_k 
= \sum_{j=1\ j\neq k}^n a_{kj} v_j \\
& \implica |\lambda - a_{kk}| \cdot |v_k| \leq
\sum_{j=1\ j\neq k}^n |a_{kj}| \cdot |v_j|
\leq r_k ||v||_{\infty} \\
& \implica |\lambda - a_{kk}| \leq r_k
\end{align*}


\_

### Método de la Potencia

Sea $A \in \real^{n \times n}$ una matriz simétrica y sean
$\lambda_1,...,\lambda_n$ sus autovalores tal que $|\lambda_1| > |\lambda_2|
\geq \cdots \geq |\lambda_n|$, es decir, suponemos que existe un único autovalor
de módulo máximo. Luego sea $\{v^{(1)},..,v^{(n)}\}$ la base de autovectores
correspondiente. Sea $z^{(1)}$ una estimación inicial de $v^{(1)}$. Definimos:
$$
\omega^{(n+1)} = A z^{(n)},
\qquad\qquad z^{(n+1)} = \frac{\omega^{(n+1)}}{|| \omega^{(n+1)} ||}
$$

Entonces resulta que $z^{(n)} \rightarrow v^{(1)} / ||v^{(1)}||_{\infty}$
cuando $n \rightarrow \infty$, y eligiendo una componente $k$ no nula de
$\omega^{(n-1)}$ luego $\lambda^{(n)} = \omega^{(n)} / z_k^{(n-1)} \rightarrow
\lambda_1$ cuando $n \rightarrow \infty$.

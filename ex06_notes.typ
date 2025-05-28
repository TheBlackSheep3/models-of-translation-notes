#import "notes_template.typ": template, exercise, Rat, Rec, dom, lecture_refs, lecture_ref, used_lecture_refs, dist
#show: template.with(
  sheet: 6
)

#exercise()
Let $A$ and $B$ be alphabets. Show that any partial function $f : A^* -> B^*$ with finite domain is subsequential.

#text(blue)[
  Let $dom(f) = {w_1, dots, w_n}$. Let $Q = {epsilon} union union.big_(i=1)^n "Pref"(w_i)$ be the set of prefixes of all words in the domain in $f$. We construct the subsequential transducer
  $
  cal(T) = (Q, A, B, epsilon, Delta, dom(f), f)
  $
  such that $Delta(q,a) = (epsilon,q q)$ for all $q in Q$ and $a in A$ such that $q a in Q$ and $Delta(q,a)$ is undefined for all remaining $q in Q$ and $a in A$. Thus, $Delta^*(epsilon, w) = (epsilon, w)$ for all words $w in A^*$ that are a prefix on an element of the domain of $f$. Obviously, $tau_cal(T) = f$.

  We remark that this statement also holds for 'sequential' instead of 'subsequential' if we work inthe free group $B^((*))$ instead of the free monoid $B^*$. In the free monoid $B^*$ the provided statement does #underline[not] hold for 'sequential' instead of 'subsequential'.
]

#exercise()
Let $A$ be an alphabet. Let $dist(w,w') = abs(w) + abs(w') - 2 abs(and.big{w, w'})$ for all $w,w' in A^*$, where $and.big L$ is the longest common prefix of the words of $L$.

Prove that '$"dist"$' is a metric on $A^*$.

#text(blue)[
  Let $w,w',w'' in A^*$.

  == Non-negativity
  Obviously, $abs(and.big{w,w'}) <= abs(w)$ as well as $abs(and.big{w,w'}) <= abs(w')$ because the longest common prefix is a prefix and thus at most as long as $w$ or $w'$. This yields $dist(w,w') >= 0$.

  == Identity
  Suppose that $w = w'$. Then $and.big{w,w'} = w$ and thus $dist(w,w') = 0$. On the other hand, let $dist(w,w') = 0$. Then $abs(w) = abs(and.big{w,w'}) = abs(w')$, which clearly yields $w = w'$ as desired.

  == Symmetry
  Obviously, $dist(w,w') = dist(w',w)$.

  == Triangle inequality
  We first observe that
  $
  abs(and.big{w,w'}) + abs(and.big{w',w''}) <= abs(w') + abs(and.big{w,w''})
  $
  because $v = and.big{w,w'}$ and $v'' = and.big{w',w''}$ are both prefixes of $w'$, which yield that one, say $v'$, must be a (not necessarily strict) prefix of the other, say $underline(v')$. Hence $abs(v') <= abs(and.big{w,w''})$ and $abs(underline(v')) <= abs(w')$. Using this inequality we arrive at
  $
  dist(w,w'') &= abs(w) + abs(w'') - 2 abs(and.big{w,w''}) \
              &<= abs(w) + abs(w'') - 2 (abs(and.big{w,w'}) + abs(and.big{w',w''}) - abs(w')) \
              &= (abs(w) + abs(w') - 2 abs(and.big{w,w'})) + (abs(w') + abs(w'') - 2 abs(and.big{w',w''})) \
              &= dist(w,w') + dist(w',w'').
  $

  We remark that $dist$ is not an ultrametric because
  $
  dist(epsilon,a a) = 2 lt.eq.not 1 = max(1,1) = max(dist(epsilon,a), dist(a,a a)).
  $
]

#exercise()
Let $A$ and $B$ be alphabets and $f : A^* -> B^*$ be a rational function.

Prove that $f^(-1)(L) in Rat(A^*)$ for all $L in Rat(B^*)$.

#text(blue)[
  According to #lecture_ref(use_alt: true, "the2_8") there exist an alphabet $C$, a regular language $L' in Rat(C^*)$, and two homomorphisms $h : C^* -> A^*$ and $h' : C^* -> B^*$ such that $f = {(h(w),h'(w)) | w in L'}$. Obviously,
  $
  {(h(w),h'(w)) | w in L' inter (h')^(-1)(L)} = f inter (A^* times L).
  $
  The previous relation is obviously rational, and the domain of the previous relation is obviously $f^(-1)(L)$. Since the domain of a rational relation is rational #emph[(#lecture_ref("the2_10"))], we proved the statement.
]

#exercise()
Let $A = {a}$ and $B = {b,c}$ with $b != c$.
Prove that the (total) function $tau : A^* -> B^*$ given every $n in NN$ by
$
tau(a^n) = cases(
                b^n quad "if" n "is even",
                c^n quad "otherwise"
          )
$
is rational, but not subsequential.

#text(blue)[
  Obviously, $tau = (a a,b b)^* union (a,c) dot.c (a a,c c)^*$, which proves that $tau$ is rational. Suppose that $tau$ is subsequential. Let $cal(T) = (Q, A, B, q_0, Delta, F, o)$ be a subsequential transducer such that $tau_(cal(T)) = tau$, and let $K = max{abs(o(q)) | q in F}$. Finally, let $n in NN$ be even. Then
  $
  tau(a^n)     &= w dot.c o(q) = b^n & "where" Delta^*(q_0,a^n) = (w,q) \
  tau(a^(n+1)) &= w w' dot.c o(q') = c^(n+1) & Delta(q,a) = (w',q').
  $
  Provided that $n > K$ we obtain $w != epsilon$, but $w in b^+ inter c^+$, which is impossible.

  Alternatively, we can immediately prove that $tau$ does not have bounded variation. For the sake of a contratdiction, suppose that $tau$ has bounded variation. Moreover, let $K$ be the bound such that $dist(f(v),f(w)) <= K$ for all $v,w in dom(f)$ with $dist(v,w) <= 1$. This bound $K$ necessarily exists since $tau$ has bounded variation. We consider $v = a^(2K)$ and $w = a^(2K+1)$, for which we have $dist(v,w) = 1$. However,
  $
  dist(f(v), f(w)) = dist(b^(2K), c^(2K+1)) = 2K + (2K + 1) = 4K + 1 lt.eq.not K,
  $
  which yields the desired contradiction.
]

#exercise()
Let $A$ and $B$ be alphabets. We call a function $f : A^* arrow.dashed B^*$ #emph[Lipschitz-continuous] if there exists $L > 0$ such that for all $x,y in A^*$ we have
$
dist(f(x),f(y)) <= L dot.c dist(x,y).
$
#set enum(numbering: "(a)", indent: 0.5cm)
+ Show that every Lipschitz-continuous function has bounded variation.
+ Show that every rational function with bounded variation is Lipschitz-continuous.
+ Show that $f = {(a^n b^n, a^n, b^(n^2)) | n >= 0}$ has bounded variation.
+ Find a function $f : A^* arrow.dashed B^*$ which has bounded variation, but is not Lipschitz-continuous.

#text(blue)[
  #set enum(indent: 0cm)
  + #text[
    Let $f : A^* arrow.dashed B^*$ with Lipschitz-constant $L$. Also let $k >= 0$, let $K = k L$ and $x,y in A^*$ with $dist(x,y) <= k$. Then $dist(f(x),f(y)) <= L dot.c dist(x,y) <= L k = K$. As $k$ was arbitrary, this shows that $f$ has bounded variation.
  ]
  + #text[
    Let $f : A^* arrow.dashed B^*$ be rational with bounded variation. Then the preimage of every rational set under $f$ is rational, so $f$ is subsequential. Let $cal(T) = (Q, A, B, q_0, Delta, F, o)$ be a subsequential transducer for $f$ and let $L_0 = max{abs(w) | q in Q, a in A, Delta(q,a) = (w,p)}$, $L_1 = 2 max{abs(o(q)) | q in Q}$ and $L = L_0 + L_1$. Let $x,y in A^*$ be distinct, let $v = and.big{x,y}$ and write $x = v x'$, $y = v y'$. We let $Delta^*(q_0,v) = (w_v,q_v)$, $Delta^*(q_v, x') = (w_x,q_x)$ and $Delta^*(q_v,y') = (w_y,q_y)$. Then
    $
    dist(f(x),f(y)) &= abs(w_v w_x o(q_x)) + abs(w_v w_y o(q_y)) - 2 abs(and.big{w_v w_x o(q_x), w_v w_y o(q_y)}) \
                    &= abs(w_x o(q_x)) + abs(w_y o(q_y)) - 2 abs(and.big{w_x o(q_x), w_y o(q_y)}) \
                    &<= abs(w_x o(q_x)) + abs(w_y o(q_y)) \
                    &<= L_0(abs(x') + abs(y')) + L_1 \
                    &<= L(abs(x') + abs(y')) quad "since" abs(x') + abs(y') >= 1 \
                    &= L dot.c dist(x,y)
    $
  ]
  + #text[
    Assume $m < n$, then $dist(a^m b^m, a^n b^n) = n - m + m + n = 2n$. Furthermore, $dist(f(a^m b^m), f(a^n b^n)) = n - m + n^2 + m^2$. For $k > 0$ and $x,y in dom(f)$ with $dist(x,y) <= k$, we thus have $dist(f(x), f(y)) <= 3k^2$, which shows bounded variation (choose $K = 3k^2$).
  ]
  + #text[
    The relation $R$ above is note Lipschitz-continuous. Assume there exists a Lipschitzconstant $L > 0$ for $f$. Let $m = 0$ and $n = 2L$, then $dist(a^m b^m, a^n b^n) = 2n$ and $dist(f(a^m b^m), f(a^n b^n)) = n + n^2 >= n + 2 n L > 2 n L = L dot.c dist(a^m b^m, a^n b^n)$.
  ]
]

#import "notes_template.typ": template, Rec, exercise
#show: template.with(
  sheet: 1
)

#exercise()
Consider the additive group $(ZZ, +, 0)$ of integers. Show that $L in Rec(ZZ)$ if and only if $L$ is a finite union of arithmetic progressions of the form $a + n ZZ$ with $a in NN$ and $n in NN$.

#text(blue)[
  To show $L in Rec(ZZ) <=> L = union.big_(i=1)^M a_i + d_i ZZ$ with $a_i, d_i in ZZ, quad d eq.not 0$. We define $L_i = a_i + d_i ZZ$.
  == $L in Rec(ZZ) arrow.l.double L = union.big_(i=1)^M a_i + d_i ZZ$
  Recognizable sets are closed under union. Now we define the homomorphism $h$ as follows.
  $ h:ZZ -> ZZ"/"d_i ZZ, quad z |-> [z]_(d_i) $
  We define $E = {[a_i]}$. Then $L_i = h^(-1)(E)$.

  == $L in Rec(ZZ) arrow.r.double L = union.big_(i=1)^M a_i + d_i ZZ$
  Let $L in Rec(ZZ)$. This implies there exists a finite monoid $(N, +, 0)$, a subset $E subset.eq N$ and a homomorphism $h: ZZ -> N$ with $L = h^(-1)(E)=union.big_(e in E) h^(-1)({e})$. Let $e in E$, focusing on $L_i = h^(-1)({e})$. Let $a_i in h^(-1)({e})$ and define $d_i = min h^(-1)({0}) inter NN_+$ (the smallest amout of repeated additions of $1$ to get back to $0$). 

  To show $L_i = a_i + d_i ZZ$.
  === $L_i supset.eq a_i + d_i ZZ$
  Let $z in a_i + d_i ZZ$, meaning $z = a_i + d_i z'$. This implies

  $ h(z) &= h(a_i) + h(d_i z') \
  &= h(e) + h underbrace((d_i + d_i + ... + d_i), z' "times") \
  &= h(e) + 0 $

  === $L_i subset.eq a_i + d_i ZZ$
  Let $z in L_i$, meaning $h(z) = e$. We have to show that $z - a_i in d_i ZZ$. The following statement applies.

  $ z - a_i = z' d_i + r quad r < d_i, z' > 0 $

  Applying the homomorphism $h$ to all components implies:

  $ underbrace(h(z - a_i), =0) = underbrace(h(z' d_i), =0) + underbrace(h(r), "has to be" 0 "as well, otherwise" d_i \ "would have been defined wrongly"). $

  From this statement follows $z - a_i in d_i ZZ$ which leads to $z in a_i + d_i ZZ$ completing the proof.
]

#exercise()
Show that the homomorpthic image of a recognizable set is not necessarily recognizable. \
_Hint:_ Consider the map $h: {a,b}^* arrow ZZ$ given by $h(w) = |w|_a - |w|_b$ for all $w in {a,b}^*$.

#text(blue)[
  First we show that $h$ is a homomorphism.
  $ h(epsilon) &= |epsilon|_a - |epsilon|_b \
  h(u v) &= |u v|_a - |u v|_b = |u|_a - |u|_b + |v|_a - |v|_b = h(u) + h(v) \
  h(underbrace({a}, in Rec({a,b}^*))) &= {1} in.not Rec(ZZ) $
]

#exercise()
Let $M$ be a monoid and $M'$ be a submonoid of $M$.
#set enum(numbering: "(a)", indent: 0.5cm)
+ Show that $L inter M' in Rec(M')$ for all $L in Rec(M)$.
+ Demonstrate that potentially $Rec(M') subset.eq.not Rec(M)$ despite $M' in Rec(M)$.

#set enum(start: 1, indent: 0cm)
#text(blue)[
  + #text[
    We will show that $L inter M' in Rec(M')$ for all $L in Rec(M)$. Be $L in Rec(M)$, so there exists a finite monoid $(N, dot, 1)$, a subset $E subset.eq N$ and a homomorphism $h: M -> N$ with $h^(-1)(E) = L$. We look at $h': h_(|M')$ (homomorphism $h$ but resticting its domain to $M'$). The following statement holds.

    $ (h')^(-1)(E) = h^(-1)(E) inter M' = L inter M' $
  ]

  + #text[
    We want to show there exists $M,M',L in Rec(M')$ with $L in.not Rec(M)$. Let $M = {a,b}^*$, let $M' = (a^+b^+)^*$ and let $K={a^n b^n | n in NN_0}$. We define the homomorphism $h: M' -> ({0,1}, and, 1)$ as follows:
    $ h(w) = cases(
      1 "if" w=w_1...w_n "with" w_1","...","w_n in K,
      0 "otherwise"
    ) $
    $h^(-1)(1) in Rec(M')$ and $a^*b^* in Rec(M)$ their intersection $h^(-1)(1) inter a^*b^* = K$, which is $K in Rec(M')$ but $K in.not Rec(M)$.
  ]
]

#import "notes_template.typ": template, exercise, lecture_ref, ran
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#show: template.with(
  sheet: 5
)

#exercise()
Let $h : C^* -> A^*$ be a homomorphism such that $h(c) in {epsilon} union A$ for all $c in C$. Prove that $h^(-1)(u u') = h^(-1)(u)h^(-1)(u')$ for all $u,u' in A^*$.

#text(blue)[
  Let $E = {c in C | h(c) = epsilon}$ be the letters yielding the empty word under $h$, and $E_a = {c in C | h(c) = a}$ be the letters yielding the letter $a$ for every $a in A$. Moreso, let $u = a_1 dots.c a_m$ and $u' = a'_1 dots.c a'_n$ for some $m,n in NN$ and $a_1 dots.c a_m a'_1 dots.c a'_n in A$. Then
  $
  h^(-1)(u) &= h^(-1)(a_1 dots.c a_m) = E^* dot.c E_(a_1) dot.c E^* dot.c E_(a_2) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a_m) dot.c E^* \
  h^(-1)(u') &= h^(-1)(a'_1 dots.c a'_n) = E^* dot.c E_(a'_1) dot.c E^* dot.c E_(a'_2) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a'_n) dot.c E^* \
  $
  and thus
  $
    &h^(-1)(u u')\
  = &E^* dot.c E_(a_1) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a_m) dot.c E^* dot.c E_(a'_1) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a'_n) dot.c E^* \
  = &E^* dot.c E_(a_1) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a_m) dot.c E^* dot.c E^* dot.c E_(a'_1) dot.c E^* dot.c dots.c dot.c E^* dot.c E_(a'_n) dot.c E^* \
  = &h^(-1)(u) h^(-1)(u').
  $
]

#exercise()
Show that it is decidable whether a rational function $f$ is recognizable.

#text(blue)[
  Let us consider a recognizable function $f$. Then $f = union.big_(i=1)^n I_i times O_i$ #emph[(#lecture_ref(use_alt: true, "the1_8"))] for some $n in NN$ and regular languages $I_1,dots,I_n,O_1,dots,O_n$. Without loss of generality, we can assume that $I_i != emptyset$ as well as $O_i != emptyset$ for all $1 <= i <= n$. Clearly, $|O_i| <= 1$ for all $1 <= i <= n$ because $f$ is a (partial) function. Thus, $ran(f) = union.big_(i=1)^n O_i$ is finite, so any recognizable function has finite range. To decide whether a rational function $f$ is recognizable, we thus chck whether $ran(f)$ is finite, which is decidable because $ran(f)$ is regular #emph[(#lecture_ref("the2_10"))]. We already proved that a recognizable function has finite range. On the other hand, let $f$ be a rational with finite range. Then $f = union.big_(o in ran(f))f^(-1)(o) times {o}$, of which $f^(-1)(o)$ is regular #emph[(use #lecture_ref(use_alt: true, "the2_8"))], which by #lecture_ref(use_alt: true, "the1_8") yields that $f$ is recognizable. Thus, a rational function $f$ is recognizable if and only if $f$ has finite range.
]

#exercise()
Determine the relation computed by the following transducer $cal(T)$. Is it a rational function?
#align(center)[
  #diagram(
    node-stroke: .1em,
    edge((-1,0), "r", "-|>"),
    node((0,0), $q_0$, radius: 1em, name: <q0>),
    edge($a"/"b$, "-|>"),
    node((1,-1), $q$, radius: 1em),
    edge($a"/"epsilon$, "-|>"),
    node((2,0), $q_f$, radius: 1.2em, extrude: (0,-2.5), name: <qf>),
    edge(<q0>, <qf>, $a"/"epsilon$, "-|>"),
    edge(<qf>, <qf>, $a"/"b$, "-|>", bend: 130deg, loop-angle: 0deg),
  )
]

#text(blue)[
  Let $A = {a}$ and $B = {b}$. Obviously, we have $(epsilon,v) in.not R(cal(T))$ for every $v in B^*$. Similarly, $(a,epsilon) in R(cal(T))$, but $(a,v) in.not R(cal(T))$ for all $v in B^+$. In the same spirit we have $(a^n,b^(n-1)) in R(cal(T))$ for all $n in NN_+$, but $(a^n, b^m) in.not R(cal(T))$ for all $m != n - 1$. Thus,
  $
  R(cal(T)) = {(a^n,b^(n-1) | n in NN_+},
  $
  which is a rational function.
]

#exercise()
Determine the relation computed by the following rational transducer $cal(T)$. Is it a rational function?
#align(center)[
  #diagram(
    node-stroke: .1em,
    edge((-1,0), "r", "-|>"),
    node((0,0), $q_0$, radius: 1.2em, extrude: (0, -2.5), name: <q0>),
    edge($a"/"b$, "-|>"),
    node((1,0), $q$, radius: 1em, name: <q>),
    edge($a"/"b^4$, "-|>"),
    node((2,0), $p$, radius: 1em, name: <p>),
    edge($a"/"b$, "-|>"),
    node((3,0), $r$, radius: 1em, name: <r>),
    edge(<q0>, <p>, $a"/"b^3$, "-|>", bend: 60deg),
    edge(<q>, <r>, $a"/"b^3$, "-|>", bend: -30deg),
    edge(<r>, <q0>, $a"/"b^2$, "-|>", bend: 60deg),
  )
]

#text(blue)[
  Let $A = {a}$ and $B = {b}$. Let us analyze the runs from $q_0$ to $q_0$ without visiting $q_0$ in between.
  $
  r_1 &= (q_0,a,b^3,p)(p,a,b,r)(r,a,b^2,q_0) \
  r_2 &= (q_0,a,b,q)(q,a,b^3,r)(r,a,b^2,q_0) \
  r_3 &= (q_0,a,b,q)(p,a,b^4,p)(p,a,b,r)(r,a,b^2,q_0)
  $
  Their input-output labels are $(a^3,b^6)$ and $(a^3,b^6)$ as well as $(a^4,b^8)$. Thus, the number of occurrences of letter $b$ doubles compared to the number of occurrences of the input letter $a$ in each run. We obtain the rational relation
  $
  R(cal(T)) = {(a^n, b^(2 n)) | n in NN \\ {1,2,5}}.
  $
  For the domain observe that $a^6 = a^3 a^3$, $a^7 = a^3 a^4$, and $a^8 = a^4 a^4$ are in the domain of $R(cal(T))$. Consequently, all $a^n$ with $n >= 9$ are also in the domain fo $R(cal(T))$ because $a^(n-3)$ is in the domain by the obvious induction hypothesis. Obviously, $R(cal(T))$ is a rational function.
]

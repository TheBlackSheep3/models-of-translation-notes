#import "notes_template.typ": template, Rec, Rat, exercise, lecture_ref
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#show: template.with(
  sheet: 3,
)

#exercise()
Let $A$ and $B$ be alphabets. Show that the following relations are rational. Decide for each relation whether it is, in general, also recognizable.
#set enum(numbering: "(a)", indent: 0.5cm)
+ $A^* times L$ for every $L in Rat(B^*)$
+ $h$ for any homomorphism $h: A^* -> B^*$
+ $g^(-1)$ for any homomorphism $g: B^* -> A^*$
+ rational substitution ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)}$ for any mapping $sigma : A -> Rat(B^*)$
+ ${(u,v) | u in A^*, v in {u} union L}$ for every rational $L in Rat(A^*)$
+ ${(u,v u) | u in A^*, v in L}$ for every rational $L in Rat(A^*)$
+ ${(u,v) | u in A^*, u v in L}$ for every rational $L in Rat(A^*)$
+ ${(u v u',v) | u,v,u' in A^*}$
+ $f : {a}^* -> {b,c}^*$ given for every $n in NN$ by 
$
f(a^n) = cases(
  b^n quad "if" n "is even",
  c^n quad "otherwise",
)
$

#let color = blue
#let e_stroke = stroke(color)
#let n_stroke = stroke(color + .1em)
#text(color)[
  #set enum(indent: 0cm)
  + #text[
    $A^* times L$ is obviously recognizable (by #lecture_ref(use_alt: true, "the1_8")) and thus rational.
  
    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q_0$, radius: 1em),
        edge($epsilon"/"epsilon$, "-|>"),
        node((1,0), text[DFA for $L$ on output], radius: 3em),
        edge((0,0), (0,0), [$a"/"epsilon$], "-|>", bend: 130deg),
        edge((0,0), (0,0), [$b"/"epsilon$], "-|>", bend: 130deg, loop-angle: 270deg),
      )
    ]
  ]
  + #text[
    $(union.big_(a in A){(a,h(a))})^*$. Obviously the identity is a homomorphism for $A = B$ and the identity is not recognizable provided that $A = B eq.not emptyset$.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q$, radius: 1.2em, extrude: (-2.5, 0)),
        edge((0,0), (0,0), [$a"/"h(a)$], "-|>", bend: 130deg),
        edge((0,0), (0,0), [$b"/"h(b)$], "-|>", bend: 130deg, loop-angle: 270deg),
      )
    ]
  ]
  + #text[
    $(union.big_(b in B){(g(b),b)})^*$. Obviously, the identity is an inverse homomorphism for $A = B$ and the identity is not recognizable provided that $A = B eq.not emptyset$.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q$, radius: 1.2em, extrude: (-2.5, 0)),
        edge((0,0), (0,0), [$g(a)"/"a$], "-|>", bend: 130deg),
        edge((0,0), (0,0), [$g(b)"/"b$], "-|>", bend: 130deg, loop-angle: 270deg),
      )
    ]
  ]
  + #text[
    $(union.big_(a in A)({a} times sigma(a)))^*$ where we note that ${a} times sigma(a)$ is recognizable and thus rational. Given a homomorphism $h : A^* -> B^*$, the mapping $sigma(a) = {h(a)}$ obviously has rational sets as images an the rational substitution coincides with $h$ and thus the arguments of the second item (b) apply. (not recognizable)

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q_0$, radius: 1.2em, extrude: (-2.5, 0)),
        edge($a"/"epsilon$, "-|>", bend: 30deg),
        node((0,-1), text[DFA for $sigma(a)$ on output], radius: 3.5em),
        edge((0,0), $epsilon"/"epsilon$, "-|>", bend: 30deg),
        edge((0,0), (0,1), $b"/"epsilon$, "-|>", bend: 30deg),
        node((0,1), text[DFA for $sigma(b)$ on output], radius: 3.5em),
        edge((0,0), $epsilon"/"epsilon$, "-|>", bend: 30deg),
      )
    ]
  ]
  + #text[
    $"id" union (A^* times L)$. For $L = emptyset$, which is rational, we obtain the identity, which is not recognizable under the standard assumptions.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q_0$, radius: 1em),
        edge($epsilon"/"epsilon$, "-|>"),
        node((0,-1), $i$, radius: 1.2em, extrude: (-2.5, 0)),
        edge((0,0), (0,1), $epsilon"/"epsilon$, "-|>"),
        node((0,1), $i$, radius: 1em),
        edge($epsilon"/"epsilon$, "-|>"),
        node((1,1), text[DFA for $L$ on output], radius: 3em),
        edge((0,-1), (0,-1), [$a"/"a$], "-|>", bend: 130deg, loop-angle: 180deg),
        edge((0,-1), (0,-1), [$b"/"b$], "-|>", bend: 130deg, loop-angle: 0deg),
        edge((0,1), (0,1), [$a"/"epsilon$], "-|>", bend: 130deg, loop-angle: 180deg),
        edge((0,1), (0,1), [$b"/"epsilon$], "-|>", bend: 130deg, loop-angle: 270deg),
      )
    ]
  ]
  + #text[
    $({epsilon} times L)"id"$. For $L = {epsilon}$, which is rational, we obtain the identity, which is in general, not recognizable.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node(text[DFA for $L$ on output], radius: 3em),
        edge($epsilon"/"epsilon$, "-|>"),
        node((1,0), $q$, radius: 1.2em, extrude: (-2.5,0)),
        edge((1,0), (1,0), [$a"/"a$], "-|>", bend: 130deg, loop-angle: 90deg),
        edge((1,0), (1,0), [$b"/"b$], "-|>", bend: 130deg, loop-angle: 270deg),
      )
    ]
  ]
  + #text[
    Let $underline(A) = {underline(a) | a in A}$ be a copy disjoint with $A$, and let $C = A union underline(A)$. Define the homomorphisms $f,g,h : C^* -> A^*$ for every $a in A$ by
    $
    f(a) &= a quad g(a) &= epsilon quad h(a) &= a \
    f(underline(a)) &= epsilon quad g(underline(a)) &= a quad h(underline(a)) &= a.
    $
    Consider the regular language $L' = h^(-1)(L) inter A^* underline(A)^* subset.eq C^*$. Clearly, $w in L'$ factorizes uniquely into $w = u underline(u)$ with $u in A^*$ and $underline(u) in underline(A)^*$. Then
    $
    {(u,v) | u v in L} = {(f(w), g(w)) | w in L'}
    $
    This relation $R$ is also recognizable. Consider a DFA $(Q,A,{q_0},delta,F)$ recognizing the rational language $L$. Then
    $
    R = union.big_(q in Q)({w in A^* | delta^*(q_0,w) = q} times {w in A^* | delta^*(q,w) in F})
    $
    of which the two languages in the Cartesian product are obviously regular. By #lecture_ref(use_alt: true, "the1_8") $R$ is thus recognizable.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        node((0,0), $q_1$, radius: 1em, name: <Q1>),
        node((3,0), $q'_1$, radius: 1em, name: <P1>),
        edge(<Q1>, <P1>, $epsilon"/"epsilon$, "-|>"),
        node((0,1), math.dots.c, radius: 1em, name: <Qdot>),
        node((3,1), math.dots.c, radius: 1em, name: <Pdot>),
        edge(<Qdot>, <Pdot>, $epsilon"/"epsilon$, "-|>"),
        node((0,2), $q_n$, radius: 1em, name: <Qn>),
        node((3,2), $q'_n$, radius: 1em, name: <Pn>),
        edge(<Qn>, <Pn>, $epsilon"/"epsilon$, "-|>"),
        node(align(top)[#v(4em) DFA for $L$], enclose: (<Q1>, <Qdot>, <Qn>), corner-radius: 5cm, name: <DFA1>),
        node(align(top)[#v(4em) same DFA for $L$], enclose: (<P1>, <Pdot>, <Pn>), corner-radius: 5cm, name: <DFA2>),
        edge((-1,1), <DFA1>, "-|>"),
        edge(<DFA2>, (4,1), "-|>"),
      )
    ]
  ]
  + #text[
    Reconsider the symbols from the previous item (g). Then
    $
    {(u v u',v) | u,v,u; in A^*} = {(h(w), f(w)) | w in underline(A)^* A^* underline(A)^*}.
    $
    Suppose that this relation $R$ is recognizable and $A = {a,b}$. Then there exists an integer $k in NN$ and regular languages $K_1,dots,K_k,L_1,dots,L_k in Rat(A^*)$ such that
    $
    R = union.big_(i=1)^k(K_i times L_i).
    $
    Obviously, $(b a^j b, a^j) in R$ for all $j in NN$. Consequently, there exists $m,n in NN$ with $m < n$ and $1 <= i <= k$ such that $(b a^m b, a^m), (b a^n b, a^n) in K_i times L_i$. It follows that $(b a^m b, a^m) in K_i times L_i subset.eq R$, which contradicts the definition of $R$ since $a^n$ is no factor of $b a^m b$. Thus $R$ is not recognizable.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q_0$, radius: 1em, name: <q0>),
        edge($epsilon"/"epsilon$, "-|>"),
        node((1,0), $q_1$, radius: 1em, name: <q1>),
        edge($epsilon"/"epsilon$, "-|>"),
        node((2,0), $q_f$, radius: 1.2em, extrude: (-2.5,0), name: <qf>),
        edge(<q0>, <q0>, $a"/"epsilon$, "-|>", bend: 130deg, loop-angle: 90deg),
        edge(<q0>, <q0>, $b"/"epsilon$, "-|>", bend: 130deg, loop-angle: -90deg),
        edge(<q1>, <q1>, $a"/"a$, "-|>", bend: 130deg, loop-angle: 90deg),
        edge(<q1>, <q1>, $b"/"b$, "-|>", bend: 130deg, loop-angle: -90deg),
        edge(<qf>, <qf>, $a"/"epsilon$, "-|>", bend: 130deg, loop-angle: 90deg),
        edge(<qf>, <qf>, $b"/"epsilon$, "-|>", bend: 130deg, loop-angle: -90deg),
      )
    ]
  ]
  + #text[
    $f = {(a^2,b^2)}^* union {(a,c)}{(a^2,c^2)}^*$. Suppose that this relation $R$ is recognizable and consider the homomorphisms $h,h' : {d}^* -> {a,b,c}^*$ given by $h(d) = a a$ and $h'(d) = b b$. Then $g(x,y) = (h(x), h'(y))$ is a homomorphism $g : {d}^* times {d}^* -> {a,b,c}^* times {a,b,c}^*$. Consider
    $
    g^(-1)(R) = {(d^i,d^i) | i in NN} = "id"_({d}^*)
    $
    which we know is not recognizable. However, recognizable relations are closed under inverse homomorphism, so $R$ cannot be recognizable.

    == Transducer
    #align(center)[
      #diagram(
        node-stroke: n_stroke,
        edge-stroke: e_stroke,
        edge((-1,0), "r", "-|>"),
        node((0,0), $q_0$, radius: 1.2em, extrude: (-2.5,0), name: <q0>),
        node((1,0), $q_1$, radius: 1em, name: <q1>),
        edge(<q0>, <q1>, $a"/"b$, "-|>", bend: 30deg),
        edge(<q1>, <q0>, $a"/"b$, "-|>", bend: 30deg),
        edge((-1,2), "r", "-|>"),
        node((0,2), $q_2$, radius: 1em, name: <q2>),
        node((1,2), $q_3$, radius: 1.2em, extrude: (-2.5,0), name: <q3>),
        edge(<q2>, <q3>, $a"/"c$, "-|>", bend: 30deg),
        edge(<q3>, <q2>, $a"/"c$, "-|>", bend: 30deg),
      )
    ]
  ]
]

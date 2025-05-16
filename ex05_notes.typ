#import "notes_template.typ": template, exercise
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge
#show: template.with(
  sheet: 5
)

#exercise()
Let $h : C^* -> A^*$ be a homomorphism such that $h(c) in {epsilon} union A$ for all $c in C$. Prove that $h^(-1)(u u') = h^(-1)(u)h^(-1)(u')$ for all $u,u' in A^*$.

#exercise()
Show that it is decidable whether a rational function $f$ is recognizable.

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

#import "notes_template.typ": template, Rec, Rat, exercise
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

#text(blue)[
  #set enum(indent: 0cm)
  + #text[$A^* times L$ for every $L in Rat(B^*)$
  == $A^* times L in Rat(A^* times B^*)$

  == $A^* times L in Rec(A^* times B^*)$
  ]
  + #text[$h$ for any homomorphism $h : A^* -> B^*$
  == $h in Rat(A^* times B^*)$

  == $h in Rec(A^* times B^*)$
  ]
  + #text[$g^(-1)$ for any homomorphism $g : B^* -> A^*$
  == $g^(-1) in Rat(A^* times B^*)$

  == $g^(-1) in Rec(A^* times B^*)$
  ]
  + #text[rational substitution ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)}$ for any mapping $sigma : A -> Rat(B^*)$
  == ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in Rat(A^* times B^*)$

  == ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in Rec(A^* times B^*)$
  ]
  + #text[${(u,v) | u in A^*, v in {u} union L}$ for every rational $L in Rat(A^*)$
  == ${(u,v) | u in A^*, v in {u} union L} in Rat(A^* times B^*)$

  == ${(u,v) | u in A^*, v in {u} union L} in Rec(A^* times B^*)$
  ]
  + #text[${(u,v u) | u in A^*, v in L}$ for every rational $L in Rat(A^*)$
  == ${(u,v u) | u in A^*, v in L} in Rat(A^* times B^*)$

  == ${(u,v u) | u in A^*, v in L} in Rec(A^* times B^*)$
  ]
  + #text[${(u,v) | u in A^*, u v in L}$ for every rational $L in Rat(A^*)$
  == ${(u,v) | u in A^*, u v in L} in Rat(A^* times B^*)$

  == ${(u,v) | u in A^*, u v in L} in Rec(A^* times B^*)$
  ]
  + #text[${(u v u',v) | u,v,u' in A^*}$
  == ${(u v u',v) | u,v,u' in A^*} in Rat(A^* times B^*)$

  == ${(u v u',v) | u,v,u' in A^*} in Rec(A^* times B^*)$
  ]
  + #text[$f : {a}^* -> {b,c}^*$ given for every $n in NN$ by 
  $
  f(a^n) = cases(
    b^n quad "if" n "is even",
    c^n quad "otherwise",
  )
  $
  == $f in Rat(A^* times B^*)$

  == $f in Rec(A^* times B^*)$
  ]
]

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
  $
  L in Rec(A^* times B^*) <=> L = union.big_(i=1)^n L_i^((1)) times L_i^((2)) quad L_i^((1)) in Rec(A^*), L_i^((2)) in Rec(B^*) \
  $
  #align(right)[$square.stroked$]

  == $A^* times L in Rec(A^* times B^*)$
  $
  Rec(A^* times B^*) subset.eq Rat(A^* times B^*) quad "which is true for every finitely generated Monoid"
  $
  #align(right)[$square.stroked$]
  
  == Transducer
  ]
  + #text[$h$ for any homomorphism $h : A^* -> B^*$\
  The relation $h$ is expressed by $h = {(w, h(w)) | w in A^*}$.
  == $h in Rat(A^* times B^*)$
  Let $L = A^*$. Now consider the identity function $"id" : A^* -> A^*$ and the given homomorphism $h$. We define the function $"id" times h : A^* -> A^* times B^*$ with $w |-> ("id"(w), h(w))$. Now we can deduce that $h = "id" times h(A^*)$ which is rational according to Nivat.
  #align(right)[$square.stroked$]
  == $h in Rec(A^* times B^*)$
  Let $A=B$ and $h = "id"$. So we consider the relation $h = {(w, "id"(w)) | w in A^*}$ which is equal to the identity $"id"$. $"id" in.not Rec(A^* times A^*)$ implying that $h in.not Rec(A^* times B^*)$.
  #align(right)[$square.stroked$]

  == Transducer
  ]
  + #text[$g^(-1)$ for any homomorphism $g : B^* -> A^*$
  == $g^(-1) in Rat(A^* times B^*)$

  == $g^(-1) in Rec(A^* times B^*)$
  
  == Transducer
  ]
  + #text[rational substitution ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)}$ for any mapping $sigma : A -> Rat(B^*)$
  == ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in Rat(A^* times B^*)$
  The relation is equal to $(union.big_(a in A){a} times sigma (a))^*$ which is a rational representation. Therefore ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in Rat(A^* times B^*)$.
  #align(right)[$square.stroked$]

  == ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in Rec(A^* times B^*)$
  Let us define $sigma (a) := {a}$. Now the relation is the identity relation $"id"$ which is is not recognizable. Therefore ${(a_1 dots.c a_n, v) | n in NN, a_1,...,a_n in A, v in sigma (a_1) dots.c sigma (a_n)} in.not Rec(A^* times B^*)$.
  #align(right)[$square.stroked$]
  
  == Transducer
  ]
  + #text[${(u,v) | u in A^*, v in {u} union L}$ for every rational $L in Rat(A^*)$
  == ${(u,v) | u in A^*, v in {u} union L} in Rat(A^* times B^*)$
  $
  {(u,v) | u in A^*, v in {u} union L} = underbrace("id", in Rat(A^*)) union underbrace(A^* times L, in Rat(A^*))
  $

  == ${(u,v) | u in A^*, v in {u} union L} in Rec(A^* times B^*)$
  
  == Transducer
  ]
  + #text[${(u,v u) | u in A^*, v in L}$ for every rational $L in Rat(A^*)$
  == ${(u,v u) | u in A^*, v in L} in Rat(A^* times B^*)$

  == ${(u,v u) | u in A^*, v in L} in Rec(A^* times B^*)$
  
  == Transducer
  ]
  + #text[${(u,v) | u in A^*, u v in L}$ for every rational $L in Rat(A^*)$
  == ${(u,v) | u in A^*, u v in L} in Rat(A^* times B^*)$

  == ${(u,v) | u in A^*, u v in L} in Rec(A^* times B^*)$
  
  == Transducer
  ]
  + #text[${(u v u',v) | u,v,u' in A^*}$
  == ${(u v u',v) | u,v,u' in A^*} in Rat(A^* times B^*)$

  == ${(u v u',v) | u,v,u' in A^*} in Rec(A^* times B^*)$
  
  == Transducer
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
  
  == Transducer
  ]
]

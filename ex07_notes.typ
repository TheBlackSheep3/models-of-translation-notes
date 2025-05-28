#import "notes_template.typ": template, exercise, Rat
#show: template.with(
  sheet: 7
)

#exercise()
Consider the following functions $d: D^2 -> RR_(>=0)$ and decide for each, whether it is and ultra metric or at least a metric.
#set enum(numbering: "(a)", indent: 0.5cm)
+ #text[
  $D = A^*$ for some alphabet $A$ and for all $v,w in D$
  $
  d(v,w) = cases(0 & "if" v = w, 2^(-abs(and.big{v,w})) & "otherwise").
  $
]
+ #text[
  $D$ is the set of all animal species and $d(x,y)$ is the difference between now and the last time a common (biological) ancestor of $x$ and $y$ lived #text(gray)[(supposing that evolutionary descent is tree-like; i.e., the phylogeny is a tree)].
]
+ #text[
  $D = RR^2$ and for all $angle.l x_1,y_1 angle.r, angle.l x_2,y_2 angle.r in D$
  $
  d(angle.l x_1, y_1 angle.r, angle.l x_2, y_2 angle.r) = max(abs(x_2 - x_1), abs(y_2 - y_1)).
  $
]
+ #text[
  $D = RR^2$ and for all $angle.l x_1,y_1 angle.r, angle.l x_2,y_2 angle.r in D$
  $
  d(angle.l x_1, y_1 angle.r, angle.l x_2, y_2 angle.r) = abs(x_2 - x_1) + abs(y_2 - y_1).
  $
]

#exercise()
Let $A$ and $B$ be alphabets, $f : A^* -> B^*$ is a subsequential function, and $L in Rat(A^*)$. Show that the function $f inter (L times B^*)$ is subsequential as well.

#exercise()
Let $A$ be an alphabet and $Pi$ a finite partition of $A^*$ such that $L in Rat(A^*)$ for all $L in Pi$. Show that there exists a DFA $(Q, A, q_0, delta, F)$ and a total function $pi : Q -> Pi$ such that for all $L in Pi$
$
w in L <==> pi(delta^*(q_0,w)) = L
$

#exercise()
Let $A$ and $B$ be alphabets and $f,g : A^* -> B^*$ be subsequential. Show that even if $f union g$ is a function it is not necessarily subsequential.

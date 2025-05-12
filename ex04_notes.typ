#import "notes_template.typ": template, exercise, Rat, Rec
#show: template.with(
  sheet: 4
)

#exercise()
Let $A$ be an alphabet with $|A| >= 2|$. Prove that $R = {(w,w^arrow.l) | w in A^*}$ is #underline[not] rational, where $w^arrow.l$ is the reversal of $w$.

#exercise()
Let $R subset.eq A^* times B^*$ be rations alphabests $A$ and $B$. Then $R = R_0 union R_oo$ with
$
R_0 &= {(u,v) in R | |R({u})| in NN} \
R_oo &= {(u,v) in R | |R({u})| = |NN|}.
$
Show that both $R_0$ and $R_oo$ are rational.

#exercise()
Let $R in Rat(A^* times B^*)$ with $(epsilon, epsilon) in.not R$. Show that there exists a rational transducer
$
cal(T) = (Q,A,B,q_0,Delta,{q_f})
$
such that $R(cal(T)) = R$ and $Delta subset.eq (Q times A times {epsilon} times Q) union (Q times {epsilon} times B times Q)$ as well as $q_0 eq.not q_f$ and $(q,u,v,q') in Delta$ implies $q eq.not q_f$ and $q' eq.not q_0$.

#exercise()
Show that all properties of Theorem §3.5 are decidable for recogniable relations $R,S in Rec(A^* times B^*)$.

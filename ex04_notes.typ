#import "notes_template.typ": template, exercise, Rat, Rec, dom, lecture_refs, lecture_ref, used_lecture_refs
#show: template.with(
  sheet: 4
)

#exercise()
Let $A$ be an alphabet with $|A| >= 2|$. Prove that $R = {(w,limits(w)^arrow.l) | w in A^*}$ is #underline[not] rational, where $limits(w)^arrow.l$ is the reversal of $w$.

#text(blue)[
  Show that $R$ is rational. Then by Nivat's theorem there exists a regular language $L subset.eq (A union A')^*$, where $A' = {a' | a in A}$ is a copy of $A$ disjoint to $A$, and two natural projections $pi, pi' : (A union A')^* -> A$ such that $R = {(pi(w), pi'(w)) | w in L}$. Thus $pi(a) = a$, $pi(b) = b$, and $pi(a') = pi(b') = epsilon$ as well as $pi'(a') = a$, $pi'(b') = b$, and $pi'(a) = pi'(b) = epsilon$. Using the pumping lemma on $L$, we obtain that there exists $n in NN$ and a decomposition of $w = w_1 w_2 w_3$, where $pi(w) = a^n b^n$ and $pi'(w) = b^n a^n$, such that $|w_1 w_2| <= n$ and $|w_2| >= 1$ and $w_1 w_2^* w_3 subset.eq L$. Obviously, $pi(w_1 w_2)$ is a prefix of $a^n$ and $pi'(w_1 w_2)$ is a prefix of $b^n$. Consequently, $w_2$ does only contain the letters $a$ and $b'$ and removing $w_2$ decreases the number of letters $a$ or $b'$ because $|w_2| >= 1|$. However $w_1 w_3 in L$ and thus $pi(w_1 w_3)$ contains fewer $a$ or $pi'(w_1 w_3)$ contains fewer $b$. On the other hand, $(pi(w), pi'(w)) in R$, which yields the number of occurences of letters need to coincide in $pi(w)$ and $pi'(w)$. We arrived at the desired contratdiction, which proves that $R$ is not rational.
]

#exercise()
Let $R subset.eq A^* times B^*$ be rations alphabests $A$ and $B$. Then $R = R_0 union R_oo$ with
$
R_0 &= {(u,v) in R | |R({u})| in NN} \
R_oo &= {(u,v) in R | |R({u})| = |NN|}.
$
Show that both $R_0$ and $R_oo$ are rational.

#text(blue)[
  We first prove that $dom(R_oo) subset.eq A^*$ is regular. Since
  $
  dom(R) = dom(R_oo) union dom(R_0)
  $
  and $dom(R)$ is regular, this will also prove that $dom(R_0)$ is regular. Let
  $
  cal(R) = {S in Rat(A^* times B^*) | dom(S_oo) in Rat(A^*)}.
  $
  We use the property that the domain of a rational relation is rational without explicit mention. Next we prove that $cal(R)$ has the rational closures.
  #set enum(numbering: "(a)", indent: 0.5cm)
  + #text[
    For $S = emptyset$ or $S = {(u,v)}$, we have $dom(S_oo) = emptyset$, which is clearly rational and thus $S in cal(R)$.
  ]
  + #text[
    Let $S,S' in cal(R)$. Then $dom((S union S')_oo) = dom(S_oo) union dom(S'_oo)$, which are rational by assumption, so their union is also rationa and $S union S' in cal(R)$. In addition,
    $
    dom((S S')_oo) = (dom(S_oo) dot.c dom(S')) union (dom(S) dot.c dom(S'_oo))
    $
    which is also rational by the induction hypothesis and thus $S S' in cal(R)$.
  ]
  + #text[
    Let $S in cal(R)$. Now we need to distinguish two cases.
    #set enum(numbering: "(i)")
    + If there exists $(epsilon, v) in S$ with $v != epsilon$, then $dom(S^*_oo) = dom(S^*)$, which is rational and thus $S^* in cal(R)$ in this case.
    + Otherwise $dom(S^*_oo) = dom(S^*) dot.c dom(S_oo) dot.c dom(S^*)$, which is also rational by the induction hypothesis.
  ]
  Hence $Rat(A^* times B^*) = cal(R)$, which proves that $dom(R_oo)$ is regular.

  Finally, we need to prove that the regualr input restriction of a rational relation is again a rational relation. More specifically, given $S in Rat(A^* times B^*)$ and $I in Rat(A^*)$, we claim that $S' = {(u,v) in S | u in I}$ is again rational. By Nivat let $L subset.eq C^*$ be a regular center language and two homomorphisms $pi$ and $pi'$ such that $S = {(pi(w),pi'(w)) | w in L}$. Then $S' = {(pi(w), pi'(w)) | w in L inter pi^(-1)(I)}$ and obviously $pi^(-1)(I)$ is again regular, so also $L inter pi^(-1)(I)$ is regular. Thus $S'$ is rational by Nivat's theorem. Putting the pieces together we obtain that
  $
  R_oo = {(u,v) in R | u in dom(R_oo)}
  $
  is the restriction of $R$ to the rational language $dom(R_oo)$, so $R_oo$ is rational. Obviously, the same argument proves that also $R_0$ is rational.
]

#exercise()
Let $R in Rat(A^* times B^*)$ with $(epsilon, epsilon) in.not R$. Show that there exists a rational transducer
$
cal(T) = (Q,A,B,q_0,Delta,{q_f})
$
such that $R(cal(T)) = R$ and $Delta subset.eq (Q times A times {epsilon} times Q) union (Q times {epsilon} times B times Q)$ as well as $q_0 eq.not q_f$ and $(q,u,v,q') in Delta$ implies $q eq.not q_f$ and $q' eq.not q_0$.

#text(blue)[
  By #lecture_ref("lem7_1") there exists a normalized transducer
  $
  cal(T)'= (Q', A, B, q_0, Delta', {q_f})
  $
  such that $R(cal(T)') = R$. This transducer already fulfills the requirements except for transitions having both an input as well as an output letter and transitions having neither. Clearly, we can replace every transition $(q,a,b,q') in Delta'$ by transitions $(q,a,epsilon,p)$ and $(p,epsilon,b,q')$ for a fresh state $p$. These new transitions still obey all the mentioned restrictions. Let $cal(T)'' = (Q,A,B,q_0,Delta'',{q_f})$ be the normalized transducer obtained after all those replacements. Obviously, $R(cal(T)'') = R$. Finally, we need to remove transitions of the form $(q,epsilon,epsilon,q') in Delta''$. To this end, let
  $
  cal(E) = {(q,q') in Q times Q | (q,epsilon,epsilon,q') in Delta''}.
  $
  We construct the transducer $cal(T) = (Q, A, B, q_0, Delta, {q_f})$ such that
  $
  Delta = {(p,u,v,p') | (q,u,v,q') in Delta'', (p,q), (q',p') in cal(E)^*, u != epsilon != v }.
  $
  Then any accepting run of $cal(T)''$ translates into an accepting run of $cal(T)$ by attaching pure $epsilon$-transitions into the previous or next non-pure $epsilon$ transition, which is always possible as long as ther is at least a single non-pure $epsilon$-transition. Since $(epsilon, epsilon) in.not R$, any accepting run of $cal(T)''$ contains at least one non-pure $epsilon$-transition. Conversely, any accepting run of $cal(T)$ yields an accepting rung of $cal(T)''$.
]

#exercise()
Show that all properties of #lecture_ref("the3_5") are decidable for recogniable relations $R,S in Rec(A^* times B^*)$.

#text(blue)[
  == $R inter S = emptyset$
  We have that $R inter S in Rec(A^* times B^*) subset.eq Rat(A^* times B^*)$ by #lecture_ref("the1_6") and #lecture_ref("the2_4")
]


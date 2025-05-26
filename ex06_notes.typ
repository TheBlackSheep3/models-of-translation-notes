#import "notes_template.typ": template, exercise, Rat, Rec, dom, lecture_refs, lecture_ref, used_lecture_refs
#show: template.with(
  sheet: 6
)

#exercise()
Let $A$ and $B$ be alphabets. Show that any partial function $f : A^* -> B^*$ with finite domain is subsequential.

#exercise()
Let $A$ be an alphabet. Let $"dist"(w,w') = |w| + |w'| - 2 |and.big{w, w'}|$ for all $w,w' in A^*$, where $and.big L$ is the longest common prefix of the words of $L$.

Prove the '$"dist"$' is a metric on $A^*$.

#exercise()
Let $A$ and $B$ be alphabets and $f : A^* -> B^*$ be a rational function.

Prove that $f^(-1)(L) in Rat(A^*)$ for all $L in Rat(B^*)$.

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

#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

#let Rec = "Rec"
#let Rat = "Rat"
#let dom = "dom"
#let ran = "ran"

#let exercise(sheet: 1, exercise: 1) = {
  let c = counter("exercise")
  c.step()
  [= Exercise #context{counter("sheet").display()}.#context{c.display()}]
}

#let ref_type = (definition: "Definition", theorem: "Theorem", lemma: "Lemma")
#let lecture_refs = (
  def1_1: (
    lecture: 1,
    index: 1,
    type: ref_type.definition,
    description: "monoid",
    content: [
      Algebraic structure $(M, dot.c, 1)$ is *monoid* if
      - $dot.c : M times M -> M$ associative
      - $1 dot.c m = m = m dot.c 1$ #text(gray)[_for all $m in M$_]
    ],
  ),
  def1_2: (
    lecture: 1,
    index: 2,
    type: ref_type.definition,
    description: "finitely generated monoid",
    content: [
      Monoid $(M, dot.c, 1)$ is *finitely generated* if there exists finite set $G subset.eq M$ with
      $
      M = {product_(i=1)^n g_i | n in NN, g_1, dots, g_n in G}
      $
    ],
  ),
  the1_6: (
    lecture: 1,
    index: 6,
    type: ref_type.theorem,
    description: "closure properties",
    content: [
      $(Rec(M),union,inter,overline(dot.c),emptyset,M)$ is Boolean algebra for any monoid $(M, dot.c,1)$
    ],
  ),
  the1_8: (
    lecture: 1,
    index: 8,
    type: ref_type.theorem,
    description: "Mezei's theorem",
    alternative_text: "Mezei's theorem",
    content: [
      Let $M, M'$ be monoids. Then $R in Rec(M times M')$ if and only if $R$ is finite union of sets $L times L'$ with $L in Rec(M)$ and $L' in Rec(M')$
    ],
  ),
  the2_4: (
    lecture: 2,
    index: 4,
    type: ref_type.theorem,
    description: "McKnight 1964",
    content: [
      $Rec(M) subset.eq Rat(M)$ for every finitely generated monoid $M$
    ],
  ),
  the2_8: (
    lecture: 2,
    index: 8,
    type: ref_type.theorem,
    description: "Nivat 1968",
    alternative_text: "Nivat's theorem",
    content: [
      Let $A, B$ alphabets. Then $R in Rat(A^* times B^*)$ iff there exists alphabet $C$, homomorphisms $h : C^* -> A^*$ and $h' : C^* -> B^*$, and regular language $L subset.eq C^*$ such that $R = {(h(w), h'(w)) | w in L}$
      #align(center)[
        #diagram(
          node((1,0), $C^*$, name: <left-c>),
          node((3,0), $C^*$, name: <right-c>),
          node((0,1), $A^*$, name: <a>),
          node((4,1), $B^*$, name: <b>),
          edge(<left-c>, <right-c>, $inter L$, "-"),
          edge(<a>, <b>, $R$, "-"),
          edge(<left-c>, <a>, $h$, "->"),
          edge(<right-c>, <b>, $h'$, "->"),
        )
      ]
    ],
  ),
  the2_10: (
    lecture: 2,
    index: 10,
    type: ref_type.theorem,
    description: "inverse, domain & range",
    content: [
      Let $R in Rat(A^* times B^*)$ for alphabets $A,B$. Then $R^(-1) in Rat(B^* times A^*)$ and domain $dom(R)$ and range $ran(R)$ are rational
      $
      dom(R) &= {v in A^* | exists w in B^* : (v,w) in R} \
      ran(R) &= {w in B^* | exists v in A^* : (v,w) in R}
      $
    ],
  ),
  the3_5: (
    lecture: 3,
    index: 5,
    type: ref_type.theorem,
    description: "",
    content: [
      Let $A, B$ alphabets with $|A| >= 2 <= |B|$. Given $R,S in Rat(A^* times B^*)$ it is #underline[undecidable] whether
      - $R inter S = emptyset$ #text(gray)[intersection emptiness]
      - $R subset.eq S$ #text(gray)[inclusion]
      - $R = S$ #text(gray)[equality]
      - $R = A^* times B^*$ #text(gray)[universality]
      - $R$ is co-finite #text(gray)[finiteness of complement]
      - $R in Rec(A^* times B^*)$ #text(gray)[recognizability]
    ],
  ),
  the3_6: (
    lecture: 3,
    index: 6,
    type: ref_type.theorem,
    description: "emptiness and finiteness",
    content: [
      Emptiness and finiteness of $R$ are decidable for rational $R subset.eq A^* times B^*$
    ],
  ),
  lem7_1: (
    lecture: 7,
    index: 1,
    type: ref_type.lemma,
    description: "",
    content: [
      Let $A,B$ alphabets with total order on $A$ extending to lexicographic order <= on $A^*$. Let $h : A^* -> B^*$ homomorphism with $h(a) = {epsilon} union B$ for all $a in A$. Then relation $R$ rational for
      $
      R = {(u,v) in A^* times A^* | u <= v, h(u) = h(v)}
      $
    ],
  ),
)

#let lecture_ref(use_alt: false, short: false, def) = context {
  let state = state("used_literature_refs", ())
  let array = state.get()
  if not array.contains(def) {
    state.update(array => array + (def,))
  }
  if use_alt {
    link(label(def), lecture_refs.at(def).alternative_text)
  } else {
    if short {
      let ref = lecture_refs.at(def)
      link(label(def), [#ref.lecture.#ref.index])
    } else {
      ref(label(def))
    }
  }
}

#let used_lecture_refs() = context {
  let used = state("used_literature_refs").final()
  if used == none or used.len() == 0 { return }
  pagebreak()
  text[= Lecture References]
  set heading(numbering: "1.1")
  for (key, value) in lecture_refs {
    if key in used {
      counter(heading).update((value.lecture, value.index - 1))
      text[
        #if "" == value.description {
          text[#heading(depth: 2, supplement: value.type)[#value.type]#label(key)]
        } else {
          text[#heading(depth: 2, supplement: value.type)[#value.type (#value.description)]#label(key)]
        }
        #value.content
      ]
    }
  }
}

#let template(
  sheet: 1,
  doc
) = {
  let sheet_counter = counter("sheet")
  sheet_counter.update(x => sheet)
  set document(
    title: [Models of Translation -- Sheet #sheet],
    author: "Niklas Dießner",
  )
  set page(
    paper: "a4",
    margin: (x: 3.5cm, y: 3.5cm),
  )
  set par(
    justify: true,
  )

  set align(center)
  text(weight: "bold", 18pt, context{document.title})
  set align(left)
  show math.equation: eq => box[#eq]

  doc
  used_lecture_refs()
}

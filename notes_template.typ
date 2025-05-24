#let Rec = "Rec"
#let Rat = "Rat"
#let dom = "dom"

#let exercise(sheet: 1, exercise: 1) = {
  let c = counter("exercise")
  c.step()
  [= Exercise #context{counter("sheet").display()}.#context{c.display()}]
}

#let lecture_refs = (
  def1_1: (
    lecture: 1,
    index: 1,
    type: "Definition",
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
    type: "Definition",
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
    type: "Theorem",
    description: "closure properties",
    content: [
      $(Rec(M),union,inter,overline(dot.c),emptyset,M)$ is Boolean algebra for any monoid $(M, dot.c,1)$
    ],
  ),
  the2_4: (
    lecture: 2,
    index: 4,
    type: "Theorem",
    description: "McKnight 1964",
    content: [
      $Rec(M) subset.eq Rat(M)$ for every finitely generated monoid $M$
    ],
  ),
  the3_5: (
    lecture: 3,
    index: 5,
    type: "Theorem",
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
  lem7_1: (
    lecture: 7,
    index: 1,
    type: "Lemma",
    description: "",
    content: [
      Let $A,B$ alphabets with total order on $A$ extending to lexicographic order <= on $A^*$. Let $h : A^* -> B^*$ homomorphism with $h(a) = {epsilon} union B$ for all $a in A$. Then relation $R$ rational for
      $
      R = {(u,v) in A^* times A^* | u <= v, h(u) = h(v)}
      $
    ],
  ),
)

#let lecture_ref(use: false, def) = context {
    let state = state("used_literature_refs")
    let array = state.get()
    if array == none {
      state.update((def,))
    }
    else if not array.contains(def) {
      state.update((..array,def))
    }
  if use {
    ref(label(def))
  }
  def
}

#let used_lecture_refs() = context {
  let used = state("used_literature_refs").final()
  if (used != none and used.len() > 0) {
    text[= Lecture References]
    text[#used]
    set heading(numbering: "§1.1")
    for (key, value) in lecture_refs {
      if key in used {
        // text[
        //   == #key
        //
        //   #value.lecture
        //   #value.index
        //   #value.type
        //   #value.description
        // ]
        counter(heading).update((value.lecture, value.index - 1))
        text[
          #if "" == value.description {
            text[#heading(depth: 2, supplement: value.type)[#value.type]#label(key)]
          } else {
            text[#heading(depth: 2, supplement: value.type)[#value.type (#value.description)]#label(key)]
          }
          #key
          #value.content
        ]
      }
    }
    // for key in used {
    //   let value = lecture_refs.at(key)
    //   counter(heading).update((value.lecture, value.index - 1))
    //   text[
    //     #if "" == value.description {
    //       text[#heading(depth: 2, supplement: value.type)[#value.type]#label(key)]
    //     } else {
    //       text[#heading(depth: 2, supplement: value.type)[#value.type (#value.description)]#label(key)]
    //     }
    //     #key
    //     #value.content
    //   ]
    // }
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

#let lecture_refs = (
  def1_1: (
    lecture: 1,
    index: 1,
    type: "Definition",
    content: [This is my first definition.],
  ),
  the1_2: (
    lecture: 1,
    index: 2,
    type: "Theorem",
    content: [This is the second entry but its a theorem.],
  ),
  the2_1: (
    lecture: 2,
    index: 1,
    type: "Theorem",
    content: [This theorem is relevant but I won't need it for the notes.],
  ),
  def2_2: (
    lecture: 2,
    index: 2,
    type: "Definition",
    content: [Let's define some more items.],
  ),
  lem3_1: (
    lecture: 3,
    index: 1,
    type: "Lemma",
    content: [Now we add a lemma for a change.],
  ),
)

#let lecture_ref(def) = context {
  let state = state("used_literature_refs", ())
  let array = state.get()
  if not array.contains(def) {
    state.update(array => array + (def,))
  }
  ref(label(def))
}

#let used_lecture_refs() = context {
  let used = state("used_literature_refs").final()
  if used.len() == 0 { return }
  text[= Lecture References]
  set heading(numbering: "1.1")
  for (key, value) in used.map(key => (key, lecture_refs.at(key))) {
    counter(heading).update((value.lecture, value.index - 1))
    text[
      #heading(depth: 2, supplement: value.type)[#value.type]#label(key)
      #value.content
    ]
  }
}

#let template(doc) = {
  doc
  used_lecture_refs()
}

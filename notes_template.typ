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
  doc
}

#let Rec = "Rec"
#let Rat = "Rat"

#let exercise(sheet: 1, exercise: 1) = {
  let c = counter("exercise")
  c.step()
  [= Exercise #context{counter("sheet").display()}.#context{c.display()}]
}

#let vub-blue = rgb("#003399")
#let vub-orange = rgb("#FF6600")
#let vub-black = rgb("#000000")

#let article(
  title: none,
  author: (),
  date: none,
  student: "",
  paper: "a4",
  logo-path: "_xtra/_hdr_logo.png",  // Match your LaTeX path
  email: "",
  website: "square.research.vub.be",
  body
) = {
  set document(title: title, author: author) 
  set page(
    paper: paper,
    margin: (bottom: 2cm, top: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: align(right)[
      #place(
        top + right,
        dx: 1.8cm,
        dy: 0.4cm,
        image(logo-path, height: 1.2cm)
      )
    ],
    footer: [
      #line(length: 100%, stroke: 0.5pt + gray)
      #grid(
        columns: (1fr, 1fr),
        text(fill: vub-blue, size: 9pt)[#email],
        align(right, text(fill: vub-blue, size: 9pt)[#website])
      )
    ],
    background: place(
      top + left,
      dx: 1.2cm,
      line(
        length: 100%,
        stroke: .5pt + vub-blue,
        angle: 90deg,
      )
    ),
  )
    
  if title != none {
    v(0.7cm)
    align(center)[
      #block(
        width: 100%,
        inset: (top: 0.3cm, bottom: 1cm, left: 1.5em, right: 1.5em),
      )[
        #text(size: 2em, weight: "bold", fill: vub-black)[#title]
        #v(0.25em)
        #text(size: 1.2em, fill: vub-black)[#student #author #h(1em) #date]
      ]
    ]
    // HERE: add space between author line and body
    v(2cm)
  }

    
  body  // Your document body follows title
}

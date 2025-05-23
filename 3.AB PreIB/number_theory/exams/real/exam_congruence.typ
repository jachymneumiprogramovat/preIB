// Package imports
#import "@preview/cheq:0.2.2": checklist
#import "@preview/cetz:0.3.1"
#import "@preview/oxifmt:0.2.1": strfmt

// Define custom colors
#let crimson = rgb("#B80F0A")
#let airblue = rgb("#00308F")
#let raingreen = rgb("#00755E")
#let ashgray = rgb("#B2BEB5")

// Helpful shortcuts
#let rleq = text(crimson)[$<=$]
#let gcd = text(crimson)[#math.op("gcd")]
#let succ = text(raingreen)[#math.op("succ")]

// Set page and fonts
#let page-counter(cur, last) = {
  strfmt("Page {} of {}", cur, last)
}
#set page(
  paper: "a4",
  margin: (x: 1in, y: 1in),
  header: context {
    let current-page = counter(page).get().first()
    if current-page > 1 [
      Exam A
      #h(1fr)
      #counter(page).display(
        page-counter,
        both: true
      )
      #h(1fr)
      #datetime.today().display("[month repr:long] [day], [year]")
      #v(-8pt)
      #line(length: 100%, stroke: .5pt + ashgray)
    ]
  }
)
#show heading.where(
  level: 1
): it => block(width: 100%)[
  #set text(14pt)
  #it.body
]
#show math.equation: set text(
  font: "Tex Gyre Schola Math",
  size: 12pt
)
#show raw: set text(
  font: "TeX Gyre Cursor",
  size: 12pt
)
#set par(
  justify: true
)

// Points function
#let points(number) = {
    place(
      top + right,
      dx: 1in - 18pt,
    )[#text(airblue)[[#number %]]]
}

// Blank box
#let blank(width: 12pt) = {
  box(
    fill: ashgray.transparentize(50%),
    width: width,
    height: 12pt,
    baseline: 3pt
  )
}

// Congruence modulus
#let pmod(expr) = [
  #h(1em) (mod #expr)
]

// Title
#set text(
  font: "TeX Gyre Adventor",
  size: 24pt
)
#align(center)[
  Congruences & CRT
]
#v(-12pt)
#align(center)[
  #text(size: 18pt)[3.AB PreIB Maths -- Exam A]
]
#set text(
  font: "TeX Gyre Schola",
  size: 12pt
)

// Warning
#align(center)[
  #box(
    stroke: 1pt + ashgray,
    radius: 10%,
    width: 80%,
    inset: 12pt,
    fill: ashgray.transparentize(80%)
  )[
    Unless specified otherwise, you are to #text(crimson)[*always*] (at least
    briefly) explain your reasoning. Even in closed questions.
  ]
]
#v(12pt)

// First page
= Congruences
#v(6pt)
#enum(numbering: "a)")[
  #block(width: 100%)[
    #points(35)

    For which values of $k in ZZ$ with $1 <= k <= 7$ does there exist a solution
    to the congruence
    #align(center)[
      $k dot.c x eq.triple 4 pmod(8)$?
    ] 
    Write those down and *state how you found them*.
 ]
]
#v(25%)
#enum(numbering: "a)", start: 2)[
    #block(width: 100%)[
    #points(20)
    Three mathematicians are walking up a tower and wish to count the number of
    stairs leading to the top. They sit down and try to think of a plan.

    As is universally the case, the mathematicians can't count up to more than
    ten. Knowing that there are likely at most five hundred stairs, devise a way
    for the mathematicians to determine the number of stairs.

    *Explain thoroughly how you arrived at your method and make sure to explain
    why it works.*
  ]
]
#pagebreak()

// Second page
= Chinese Remainder Theorem
#v(6pt)
#block(width: 100%)[
  #points(45)
  Solve the following system of congruences.
  #align(center)[
   $x &eq.triple 0 pmod(7)\
    x &eq.triple 2 pmod(11)\
    x &eq.triple 4 pmod(13)$
  ]
  *Explain briefly* why there is only one solution smaller than $7 dot 11 dot
  13$.
]


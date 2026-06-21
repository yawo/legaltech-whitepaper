#let part(title) = heading(level: 1, numbering: none, title)

#let promptbox(body) = {
  block(
    fill: rgb("#f2f2f2"),
    radius: 8pt,
    inset: (x: 12pt, y: 10pt),
    width: 100%,
    breakable: true,
  )[
    #set text(size: 9pt, font: "Liberation Mono")
    #body
  ]
}

#let chapter-image(path) = {
  block(
    width: 100%,
    height: 200pt,
    clip: true,
  )[
    #image(path, width: 100%, fit: "cover")
  ]
  v(0.5em)
}

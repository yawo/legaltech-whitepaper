#import "@preview/orange-book:0.7.1": book

#show: book.with(
  title: "Vibe coding for Lawyers",
  author: "",
  copyright: [
  Copyright © Yawo Kpotufe, fractional CTO,
  yawo.kpotufe\@hotepconseil.com",

  All rights reserved.
  ],
  date: datetime.today(),
  lang: "en",
  main-color: rgb("#434689"),
  lowercase-references: false,
  cover: image("./images/cover-ai-brain.jpg"),
  width: 6in,
  height: 9in,
  margin: (x: 2.4cm, top: 2.4cm, bottom: 2.2cm),
  font-size: 10pt,
  heading-style: 2,
  part-style: 1,
  part-font-size:5em,
  outline-depth: 2,
  outline-font-size: 10pt,
  outline-small-depth: 2,
  outline-small-width: 11cm,
  supplement-chapter: "",
  supplement-part: "Part",
  first-line-indent: true,

)

#set heading(
  numbering:none
)
// Removes numbering for sections (level 2)
#show heading.where(level: 1): set heading(numbering: "1")
#show heading.where(level: 2): set heading(numbering: none)

// Optional: Do the same for sub-sections (level 3) if you use them
#show heading.where(level: 3): set heading(numbering: none)



#include "part0.typ"
#include "part1.typ"
#include "part2.typ"
#include "part3.typ"
#include "part4.typ"
#include "part5.typ"
#include "part6.typ"

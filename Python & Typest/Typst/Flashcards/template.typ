// template.typ — flashcards de formules (grille 2 x 3 par page A4)
// Champs d'une carte : id, topic, included, formule, explication (+ taille, optionnelle : taille des formules)
// Le domaine (couleur + bandeau) est déduit du préfixe de l'id (ST, CI, DY...).

#let domains = (
  AM: (name: "Actions mécaniques", color: rgb("#1d5fa8")),
  ST: (name: "Statique et frottement", color: rgb("#0b7a75")),
  TM: (name: "Théorie des mécanismes", color: rgb("#6d3fa0")),
  LI: (name: "Liaisons normalisées", color: rgb("#8e44ad")),
  CI: (name: "Cinématique", color: rgb("#c2185b")),
  PU: (name: "Puissance et énergie", color: rgb("#c62828")),
  RM: (name: "RDM", color: rgb("#d9700a")),
  EN: (name: "Engrenages", color: rgb("#8d6a00")),
  RL: (name: "Roulements", color: rgb("#2e7d32")),
  CL: (name: "Clavettes et assemblages", color: rgb("#4b6584")),
  GP: (name: "Cotation", color: rgb("#455a64")),
)

// Réduit automatiquement une formule trop large pour tenir dans la carte
#let fit-eq(it) = layout(size => {
  let flat = box(math.equation(math.display(it.body), block: false))
  let w = measure(flat).width
  let body = if w > size.width * 0.96 {
    scale(size.width * 0.96 / w * 100%, reflow: true, flat)
  } else {
    flat
  }
  block(width: 100%, above: 0.55em, below: 0.55em, align(center, body))
})

#let card(c, bw) = {
  let key = c.id.slice(0, 2)
  let d = domains.at(key, default: (name: key, color: gray))
  let col = if bw { black } else { d.color }
  block(
    width: 100%, height: 100%, fill: white,
    stroke: 1.2pt + col, radius: 7pt, clip: true, breakable: false,
  )[
    #grid(
      rows: (auto, auto, 1fr, auto),
      // bandeau du domaine
      block(width: 100%, fill: if bw { luma(215) } else { col }, inset: (x: 11pt, y: 7pt))[
        #set text(size: 10.5pt, weight: "bold", fill: if bw { black } else { white }, tracking: 0.6pt)
        #upper(d.name) #h(1fr) #c.id
      ],
      // titre
      block(width: 100%, inset: (x: 11pt, top: 9pt, bottom: 2pt))[
        #text(size: 15pt, weight: "bold", fill: col)[#c.topic]
      ],
      // formules
      grid.cell(align: center + horizon, inset: (x: 8pt, y: 4pt))[
        #block(
          width: 100%, radius: 6pt, inset: (x: 6pt, y: 6pt),
          fill: if bw { luma(242) } else { col.lighten(90%) },
        )[
          #set text(size: c.at("taille", default: 20pt))
          #show math.equation.where(block: true): fit-eq
          #c.formule
        ]
      ],
      // explication
      block(width: 100%, inset: (x: 11pt, top: 2pt, bottom: 10pt))[
        #set text(size: 12pt)
        #set par(leading: 0.55em)
        #c.explication
      ],
    )
  ]
}

#let flashcards(cards, black-and-white: false) = {
  set page(paper: "a4", margin: 1cm)
  set text(lang: "fr", size: 11pt, font: "New Computer Modern")
  let shown = cards.filter(c => c.at("included", default: true))
  let per-page = 6
  let n = calc.ceil(shown.len() / per-page)
  for p in range(n) {
    let chunk = shown.slice(p * per-page, calc.min((p + 1) * per-page, shown.len()))
    grid(
      columns: (1fr, 1fr),
      rows: (8.75cm,) * 3,
      gutter: 8pt,
      ..chunk.map(c => card(c, black-and-white)),
    )
    if p < n - 1 { pagebreak() }
  }
}

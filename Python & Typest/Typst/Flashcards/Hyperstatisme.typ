// ======================================================================
//  Étude des mécanismes — fiches de révision (BTS CPI)
//  Fichier autonome : aucun package, aucune image externe.
//  Tous les schémas sont dessinés en Typst (voir les fonctions fig-...).
// ======================================================================

// ---------- Palette sobre ----------
#let ink = rgb("#1f2933")
#let muted = rgb("#5b6770")
#let accent = rgb("#1f4e79")
#let soft = rgb("#eaf0f7")
#let hair = rgb("#c5ced8")
#let amber = rgb("#9a5b00")
#let amber-soft = rgb("#fdf3e3")
#let forest = rgb("#2f6b4f")
#let forest-soft = rgb("#e9f4ee")
#let brick = rgb("#a12a2a")

// ---------- Réglages généraux ----------
#set document(title: "Étude des mécanismes — fiches de révision")
#set page(
  paper: "a4",
  margin: (x: 1.9cm, top: 2.4cm, bottom: 2.1cm),
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: muted)
      grid(columns: (1fr, auto), [BTS CPI · Étude des mécanismes], [Fiches de révision])
      v(-5pt)
      line(length: 100%, stroke: 0.5pt + hair)
    }
  },
  footer: context {
    set text(size: 8.5pt, fill: muted)
    align(center, counter(page).display("1 / 1", both: true))
  },
)
#set text(font: "New Computer Modern", size: 10.5pt, lang: "fr", fill: ink)
#set par(justify: true, leading: 0.62em)
#set list(marker: [–], indent: 4pt, body-indent: 5pt)
#set enum(indent: 4pt, body-indent: 5pt)
#set table(stroke: 0.5pt + hair, inset: 6pt)
#show table: set par(justify: false)
#show table: it => block(breakable: false, it)
#show table: set text(hyphenate: false)

#set heading(numbering: (..n) => if n.pos().len() == 1 { [Fiche #n.pos().first()] } else { none })

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  block(width: 100%, fill: accent, inset: (x: 13pt, y: 10pt), radius: 3pt, above: 0pt, below: 12pt, breakable: false)[
    #set text(fill: white)
    #text(size: 8.5pt, weight: "bold", tracking: 1.4pt)[FICHE #context counter(heading).at(it.location()).first()]
    #v(1pt)
    #text(size: 18pt, weight: "bold")[#it.body]
  ]
}
#show heading.where(level: 2): it => block(above: 13pt, below: 7pt, breakable: false, sticky: true)[
  #text(size: 12pt, weight: "bold", fill: accent)[#it.body]
  #v(-6pt)
  #line(length: 100%, stroke: 0.6pt + accent)
]

// ---------- Blocs de mise en page ----------
#let source(body) = {
  text(size: 9pt, fill: muted, style: "italic", body)
  v(2pt)
}

#let callout(title, body, tone: "info") = {
  let (c, f) = if tone == "warn" { (amber, amber-soft) } else if tone == "ok" { (forest, forest-soft) } else { (accent, soft) }
  block(width: 100%, breakable: false, fill: f, stroke: (left: 2.5pt + c), inset: (x: 10pt, y: 8pt), radius: (right: 3pt), above: 8pt, below: 8pt)[
    #text(size: 8.5pt, weight: "bold", fill: c, tracking: 0.8pt)[#upper(title)]
    #v(2pt)
    #body
  ]
}

#let formula(body) = block(width: 100%, breakable: false, fill: white, stroke: 0.9pt + accent, radius: 3pt, inset: (x: 10pt, y: 8pt), above: 8pt, below: 8pt, align(center, body))

#let example(title, body, breakable: false) = block(width: 100%, stroke: 0.6pt + hair, radius: 3pt, above: 8pt, below: 8pt, clip: true, breakable: breakable)[
  #block(width: 100%, fill: luma(244), inset: (x: 10pt, y: 5pt))[
    #text(size: 8.5pt, weight: "bold", fill: muted, tracking: 0.8pt)[EXEMPLE · #upper(title)]
  ]
  #block(inset: (x: 10pt, y: 8pt))[#body]
]

// ---------- Outils de dessin (coordonnées en pt depuis le coin haut-gauche) ----------
#let gs = (paint: ink, thickness: 1pt, cap: "round")
#let gs-thin = (paint: muted, thickness: 0.7pt, cap: "round")
#let gs-dash = (paint: muted, thickness: 0.9pt, dash: "dashed", cap: "round")
#let gs-red = (paint: brick, thickness: 2.4pt, cap: "round")
#let gs-blue = (paint: accent, thickness: 1.4pt, cap: "round")

#let cv(w, h, body) = block(width: w * 1pt, height: h * 1pt, breakable: false, body)

#let seg(a, b, st: gs) = {
  let x0 = calc.min(a.at(0), b.at(0))
  let y0 = calc.min(a.at(1), b.at(1))
  place(top + left, dx: x0 * 1pt, dy: y0 * 1pt,
    line(start: ((a.at(0) - x0) * 1pt, (a.at(1) - y0) * 1pt),
         end: ((b.at(0) - x0) * 1pt, (b.at(1) - y0) * 1pt), stroke: st))
}

#let poly(pts, fill: none, st: none) = {
  let x0 = calc.min(..pts.map(p => p.at(0)))
  let y0 = calc.min(..pts.map(p => p.at(1)))
  place(top + left, dx: x0 * 1pt, dy: y0 * 1pt,
    polygon(fill: fill, stroke: st, ..pts.map(p => ((p.at(0) - x0) * 1pt, (p.at(1) - y0) * 1pt))))
}

#let arw(a, b, st: gs, size: 6) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / d
  let uy = dy / d
  seg(a, (b.at(0) - ux * size * 0.7, b.at(1) - uy * size * 0.7), st: st)
  poly((b,
        (b.at(0) - ux * size - uy * size * 0.38, b.at(1) - uy * size + ux * size * 0.38),
        (b.at(0) - ux * size + uy * size * 0.38, b.at(1) - uy * size - ux * size * 0.38)),
       fill: st.at("paint"))
}

#let lab(c, body, w: 40, h: 12, size: 8pt, col: ink, weight: "regular") = place(top + left,
  dx: (c.at(0) - w / 2) * 1pt, dy: (c.at(1) - h / 2) * 1pt,
  box(width: w * 1pt, height: h * 1pt, align(center + horizon, text(size: size, fill: col, weight: weight, body))))

#let node(c, body, r: 13, fill: white, col: ink, size: 9pt) = place(top + left,
  dx: (c.at(0) - r) * 1pt, dy: (c.at(1) - r) * 1pt,
  circle(radius: r * 1pt, fill: fill, stroke: 1.1pt + col, inset: 0pt,
    align(center + horizon, text(size: size, fill: col, weight: "bold", body))))

#let dimline(a, b, body, off: (0, -8), size: 8pt) = {
  arw(a, b, st: gs-thin, size: 5)
  arw(b, a, st: gs-thin, size: 5)
  lab(((a.at(0) + b.at(0)) / 2 + off.at(0), (a.at(1) + b.at(1)) / 2 + off.at(1)), body, size: size)
}

// lien droit entre deux nœuds (s'arrête au bord des cercles)
#let edge(a, b, r: 13, st: gs) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / d
  let uy = dy / d
  seg((a.at(0) + ux * r, a.at(1) + uy * r), (b.at(0) - ux * r, b.at(1) - uy * r), st: st)
}

// courbe de Bézier quadratique tracée en petits segments
#let qcurve(a, c, b, st: gs, n: 26) = {
  let pts = range(n + 1).map(i => {
    let t = i / n
    ((1 - t) * (1 - t) * a.at(0) + 2 * (1 - t) * t * c.at(0) + t * t * b.at(0),
     (1 - t) * (1 - t) * a.at(1) + 2 * (1 - t) * t * c.at(1) + t * t * b.at(1))
  })
  for i in range(n) { seg(pts.at(i), pts.at(i + 1), st: st) }
}

// lien courbe : bulge > 0 vers la droite du sens a -> b (en bas si a est à gauche de b)
#let alink(a, b, bulge, r: 13, st: gs) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / d
  let uy = dy / d
  let nx = -uy
  let ny = ux
  let s = if bulge >= 0 { 1 } else { -1 }
  let p0 = (a.at(0) + r * (ux * 0.82 + nx * 0.57 * s), a.at(1) + r * (uy * 0.82 + ny * 0.57 * s))
  let p2 = (b.at(0) - r * (ux * 0.82 - nx * 0.57 * s), b.at(1) - r * (uy * 0.82 - ny * 0.57 * s))
  let mx = (a.at(0) + b.at(0)) / 2
  let my = (a.at(1) + b.at(1)) / 2
  qcurve(p0, (mx + nx * 2 * bulge, my + ny * 2 * bulge), p2, st: st)
}

// point au milieu de a-b décalé de bulge le long de la normale (pour placer une étiquette)
#let apex(a, b, bulge) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  ((a.at(0) + b.at(0)) / 2 - dy / d * bulge, (a.at(1) + b.at(1)) / 2 + dx / d * bulge)
}

#let ground(x0, x1, y, n: 6) = {
  seg((x0, y), (x1, y), st: gs)
  let step = (x1 - x0) / n
  for i in range(n + 1) {
    seg((x0 + i * step, y), (x0 + i * step - 5, y + 6), st: gs-thin)
  }
}

#let bx(x, y, w, h, body, fill: soft, st: accent) = place(top + left, dx: x * 1pt, dy: y * 1pt,
  block(width: w * 1pt, height: h * 1pt, fill: fill, stroke: 0.9pt + st, radius: 3pt, inset: 4pt, align(center + horizon, { set par(justify: false); set text(hyphenate: false); body })))

#let ring(c, r, st: gs, n: 28, a0: 0, a1: 360) = {
  let pts = range(n + 1).map(i => {
    let a = (a0 + (a1 - a0) * i / n) * 1deg
    (c.at(0) + r * calc.cos(a), c.at(1) + r * calc.sin(a))
  })
  for i in range(n) { seg(pts.at(i), pts.at(i + 1), st: st) }
}

// ======================================================================
//  SCHÉMAS
// ======================================================================

// Vue d'ensemble du cours
#let fig-overview() = cv(480, 70, {
  let w = 108
  let ys = 6
  let xs = (0, 124, 248, 372)
  bx(xs.at(0), ys, w, 58)[#text(weight: "bold", size: 9.5pt)[Liaison] \ #text(size: 8.5pt)[$arrow(R)$ · $arrow(M)$ · $N_s + N_c = 6$]]
  bx(xs.at(1), ys, w, 58)[#text(weight: "bold", size: 9.5pt)[Liaison équivalente] \ #text(size: 8.5pt)[parallèle · série]]
  bx(xs.at(2), ys, w, 58)[#text(weight: "bold", size: 9.5pt)[Chaîne de solides] \ #text(size: 8.5pt)[ouverte · fermée · complexe]]
  bx(xs.at(3), ys, w, 58, fill: accent)[#text(weight: "bold", size: 9.5pt, fill: white)[Résultats] \ #text(size: 8.5pt, fill: white)[$h$ (hyperstatisme) · $m$ (mobilité)]]
  for i in range(3) {
    arw((xs.at(i) + w + 2, 35), (xs.at(i + 1) - 2, 35), st: gs-blue, size: 6)
  }
})

// Notation S1 - Li - S2
#let fig-notation() = cv(170, 38, {
  edge((24, 20), (146, 20))
  node((24, 20), $S_1$)
  node((146, 20), $S_2$)
  lab((85, 9), $L_i$, size: 9pt)
})

// Déplacement d'un torseur : pivot glissant d'axe (A, y) et point C
#let fig-3d() = cv(205, 178, {
  let iso(x, y, z) = (96 + (x - z) * 20.8, 108 + (x + z) * 12 - y * 24)
  let lx = 3.2
  let ly = 2
  let lz = 1
  let A = iso(0, 0, 0)
  let C = iso(lx, ly, lz)
  let P1 = iso(lx, 0, 0)
  let P2 = iso(lx, 0, lz)
  // cylindre de la liaison (axe y)
  place(top + left, dx: 88pt, dy: 66pt, rect(width: 16pt, height: 84pt, fill: soft, stroke: 0.9pt + accent))
  // construction en pointillés
  seg(A, P1, st: gs-dash)
  seg(P1, P2, st: gs-dash)
  seg(P2, C, st: gs-dash)
  seg(A, C, st: (paint: brick, thickness: 1pt, dash: "dotted", cap: "round"))
  // axes
  arw(A, iso(4.3, 0, 0), st: gs, size: 6)
  arw(A, iso(0, 3.7, 0), st: gs, size: 6)
  arw(A, iso(0, 0, 3.2), st: gs, size: 6)
  lab((iso(4.3, 0, 0).at(0) + 8, iso(4.3, 0, 0).at(1) + 4), $x$, w: 14, size: 10pt)
  lab((iso(0, 3.7, 0).at(0) + 9, iso(0, 3.7, 0).at(1)), $y$, w: 14, size: 10pt)
  lab((iso(0, 0, 3.2).at(0) - 9, iso(0, 0, 3.2).at(1) + 4), $z$, w: 14, size: 10pt)
  // points
  place(top + left, dx: (A.at(0) - 3) * 1pt, dy: (A.at(1) - 3) * 1pt, circle(radius: 3pt, fill: ink, stroke: none))
  place(top + left, dx: (C.at(0) - 3) * 1pt, dy: (C.at(1) - 3) * 1pt, circle(radius: 3pt, fill: brick, stroke: none))
  lab((A.at(0) - 12, A.at(1) - 4), $A$, w: 14, size: 10pt, weight: "bold")
  // cotes
  lab(((A.at(0) + P1.at(0)) / 2 - 4, (A.at(1) + P1.at(1)) / 2 + 12), $l_x$, w: 18, size: 9.5pt)
  lab(((P1.at(0) + P2.at(0)) / 2 + 13, (P1.at(1) + P2.at(1)) / 2 + 6), $l_z$, w: 18, size: 9.5pt)
  lab((C.at(0) + 12, C.at(1) + 11), $l_y$, w: 18, size: 9.5pt)
  lab((C.at(0) + 13, C.at(1) - 7), $C$, w: 14, size: 10pt, weight: "bold", col: brick)
})

// Liaison équivalente (cours 1.4)
#let fig-eq() = cv(345, 112, {
  let s1 = (30, 34)
  let s2 = (140, 34)
  let s3 = (85, 92)
  edge(s1, s2)
  alink(s1, s3, 9)
  alink(s1, s3, -9)
  edge(s2, s3)
  node(s1, $S_1$)
  node(s2, $S_2$)
  node(s3, $S_3$)
  lab((85, 22), $L_1$, size: 9pt)
  lab((34, 72), $L_3$, size: 9pt)
  lab((80, 54), $L_2$, size: 9pt)
  lab((124, 68), $L_4$, size: 9pt)
  lab((185, 56), text(size: 18pt)[$arrow.l.r.double$], w: 40, h: 22)
  edge((235, 56), (322, 56))
  node((235, 56), $S_1$)
  node((322, 56), $S_2$)
  lab((278, 44), $L_"eq"$, size: 9pt)
})

// Liaisons en parallèle (cours 2)
#let fig-par() = cv(345, 100, {
  let s1 = (32, 50)
  let s2 = (140, 50)
  alink(s1, s2, -24)
  edge(s1, s2)
  alink(s1, s2, 24, st: gs-dash)
  node(s1, $S_1$)
  node(s2, $S_2$)
  lab(apex(s1, s2, -36), $L_1$, size: 9pt)
  lab((86, 41), $L_i$, size: 9pt)
  lab(apex(s1, s2, 36), $L_n$, size: 9pt)
  lab((190, 50), text(size: 18pt)[$arrow.l.r.double$], w: 40, h: 22)
  edge((240, 50), (322, 50))
  node((240, 50), $S_1$)
  node((322, 50), $S_2$)
  lab((281, 38), $L_"eq"$, size: 9pt)
})

// Exemple : rotule + linéaire annulaire = pivot
#let fig-guidage() = cv(260, 124, {
  let y = 54
  // appuis
  place(top + left, dx: 54pt, dy: (y + 8) * 1pt, rect(width: 38pt, height: 16pt, fill: soft, stroke: 1.2pt + accent))
  seg((73, y + 24), (73, 94), st: gs-blue)
  ground(53, 93, 94)
  ring((170, y), 13, st: gs-blue, a0: 0, a1: 180)
  seg((170, y + 13), (170, 94), st: gs-blue)
  ground(150, 190, 94)
  // arbre
  arw((12, y), (242, y), st: gs-red, size: 8)
  place(top + left, dx: 66pt, dy: (y - 7) * 1pt, circle(radius: 7pt, fill: white, stroke: 1.6pt + brick))
  place(top + left, dx: 163pt, dy: (y - 7) * 1pt, circle(radius: 7pt, fill: white, stroke: 1.6pt + brick))
  lab((250, y - 10), $x$, w: 14, size: 10pt)
  lab((73, 34), $A$, w: 14, size: 10pt, weight: "bold")
  lab((170, 34), $B$, w: 14, size: 10pt, weight: "bold")
  dimline((73, 16), (170, 16), $l$, off: (0, -7), size: 10pt)
  lab((73, 112), [linéaire annulaire], w: 100, size: 8pt, col: muted)
  lab((170, 112), [rotule], w: 60, size: 8pt, col: muted)
})

// Liaisons en série : chaîne continue ouverte
#let fig-series() = cv(345, 126, {
  let r = 13
  let a = (28, 24)
  let b = (105, 24)
  let c = (215, 24)
  let d = (318, 24)
  edge(a, b)
  edge(b, c, st: gs-dash)
  edge(c, d, st: gs-dash)
  node(a, $S_1$)
  node(b, $S_2$)
  node(c, $S_i$)
  node(d, $S_n$)
  lab((66, 12), $L_1$, size: 9pt)
  lab((160, 12), [$L_2 dots.c L_(i-1)$], w: 70, size: 9pt)
  lab((266, 12), [$L_i dots.c L_(n-1)$], w: 70, size: 9pt)
  lab((173, 60), text(size: 18pt)[$arrow.b.double$], w: 40, h: 22)
  edge((98, 98), (248, 98))
  node((98, 98), $S_1$)
  node((248, 98), $S_n$)
  lab((173, 86), $L_"eq"$, size: 9pt)
})

// Exemple série : appui plan + rotule = ponctuelle
#let fig-serie-ex() = cv(345, 124, {
  edge((40, 24), (172, 24))
  edge((172, 24), (304, 24))
  node((40, 24), [1])
  node((172, 24), [5])
  node((304, 24), [6])
  lab((106, 11), [appui plan $(B, y)$], w: 90, size: 8.5pt)
  lab((238, 11), [rotule $A$], w: 70, size: 8.5pt)
  lab((172, 62), text(size: 18pt)[$arrow.b.double$], w: 40, h: 22)
  edge((100, 100), (244, 100))
  node((100, 100), [1])
  node((244, 100), [6])
  lab((172, 88), [ponctuelle $(A, y)$], w: 100, size: 8.5pt)
})

// Chaîne continue fermée
#let fig-ccf() = cv(330, 196, {
  let sn = (46, 36)
  let s1 = (140, 36)
  let s2 = (234, 36)
  let sm = (46, 126)
  let si = (140, 126)
  let s3 = (234, 126)
  edge(sn, s1)
  edge(s1, s2)
  edge(s2, s3)
  edge(s3, si, st: gs-dash)
  edge(si, sm)
  edge(sm, sn)
  node(sn, $S_n$)
  node(s1, $S_1$)
  node(s2, $S_2$, fill: soft, col: accent)
  node(sm, $S_(n-1)$, size: 8pt)
  node(si, $S_i$, fill: soft, col: accent)
  node(s3, $S_3$)
  lab((93, 24), $L_n$, size: 9pt)
  lab((187, 24), $L_1$, size: 9pt)
  lab((252, 81), $L_2$, size: 9pt)
  lab((187, 114), [$L_3 dots.c L_(i-1)$], w: 80, size: 8.5pt)
  lab((93, 114), $L_i$, size: 9pt)
  lab((26, 81), $L_(n-1)$, w: 40, size: 9pt)
  arw((318, 36), (251, 36), st: gs-blue, size: 7)
  lab((284, 20), $\{tau_e\}$, w: 50, size: 10pt, col: accent)
  lab((284, 52), text(size: 8pt, fill: muted)[entrée], w: 50)
  arw((140, 186), (140, 144), st: gs-blue, size: 7)
  lab((178, 176), $\{tau_s\}$, w: 50, size: 10pt, col: accent)
  lab((178, 189), text(size: 8pt, fill: muted)[sortie], w: 50)
})

// Bielle-manivelle : schéma cinématique
#let fig-bielle() = cv(240, 118, {
  let o = (40, 62)
  let a = (84, 26)
  let b = (176, 62)
  // glissière et bâti
  place(top + left, dx: 138pt, dy: 48pt, rect(width: 96pt, height: 28pt, fill: none, stroke: 1.2pt + accent))
  place(top + left, dx: 152pt, dy: 52pt, rect(width: 48pt, height: 20pt, fill: soft, stroke: 1.2pt + accent))
  ground(138, 234, 76, n: 9)
  seg(o, (o.at(0), 92), st: gs-blue)
  ground(20, 60, 92, n: 6)
  // barres
  seg(o, a, st: gs-red)
  seg(a, b, st: gs-red)
  for p in (o, a, b) {
    place(top + left, dx: (p.at(0) - 4.5) * 1pt, dy: (p.at(1) - 4.5) * 1pt, circle(radius: 4.5pt, fill: white, stroke: 1.4pt + ink))
  }
  lab((o.at(0) - 15, o.at(1) - 8), $O$, w: 14, size: 9.5pt, weight: "bold")
  lab((a.at(0), a.at(1) - 11), $A$, w: 14, size: 9.5pt, weight: "bold")
  lab((b.at(0) + 12, b.at(1) - 20), $B$, w: 14, size: 9.5pt, weight: "bold")
  node((52, 32), [1], r: 7, size: 8pt)
  node((134, 30), [2], r: 7, size: 8pt)
  node((216, 38), [3], r: 7, size: 8pt)
  node((78, 104), [0], r: 7, size: 8pt)
})

// Bielle-manivelle : graphe des liaisons
#let fig-bielle-graph() = cv(190, 118, {
  let n0 = (50, 90)
  let n1 = (50, 28)
  let n2 = (140, 28)
  let n3 = (140, 90)
  edge(n0, n1, r: 11)
  edge(n1, n2, r: 11)
  edge(n2, n3, r: 11)
  edge(n3, n0, r: 11)
  node(n0, [0], r: 11)
  node(n1, [1], r: 11)
  node(n2, [2], r: 11)
  node(n3, [3], r: 11)
  lab((24, 59), [pivot], w: 34, size: 8pt, col: muted)
  lab((95, 14), [pivot], w: 34, size: 8pt, col: muted)
  lab((166, 59), [pivot], w: 34, size: 8pt, col: muted)
  lab((95, 104), [glissière], w: 50, size: 8pt, col: muted)
})

// Chaînes complexes (cours 4.1)
#let fig-complex() = cv(490, 152, {
  // graphe 1 : n = 4, l = 5
  let s0 = (36, 66)
  let s1 = (112, 22)
  let s2 = (188, 66)
  let s3 = (112, 110)
  place(top + left, dx: 2pt, dy: 52pt, rect(width: 8pt, height: 28pt, fill: luma(225), stroke: 0.8pt + muted))
  edge(s0, s1)
  edge(s1, s2)
  edge(s2, s3)
  edge(s3, s0)
  edge(s1, s3)
  node(s0, $S_0$)
  node(s1, $S_1$)
  node(s2, $S_2$)
  node(s3, $S_3$)
  lab((60, 34), $L_1$, size: 9pt)
  lab((164, 34), $L_2$, size: 9pt)
  lab((164, 98), $L_3$, size: 9pt)
  lab((60, 98), $L_4$, size: 9pt)
  lab((126, 66), $L_5$, size: 9pt)
  lab((112, 140), [$n = 4$ et $l = 5$], w: 90, size: 10pt, weight: "bold")
  // graphe 2 : n = 3, l = 4
  let t0 = (290, 66)
  let t1 = (398, 22)
  let t3 = (398, 110)
  place(top + left, dx: 256pt, dy: 52pt, rect(width: 8pt, height: 28pt, fill: luma(225), stroke: 0.8pt + muted))
  alink(t0, t1, -16)
  edge(t0, t1)
  edge(t1, t3)
  edge(t3, t0)
  node(t0, $S_0$)
  node(t1, $S_1$)
  node(t3, $S_3$)
  lab((322, 24), $L_1$, size: 9pt)
  lab((343, 54), $L_2$, size: 9pt)
  lab((414, 66), $L_3$, size: 9pt)
  lab((338, 98), $L_4$, size: 9pt)
  lab((344, 140), [$n = 3$ et $l = 4$], w: 90, size: 10pt, weight: "bold")
})

// Grille de lecture d'un torseur : état 1 = inconnue / DDL, 0 = nul, 2 = lié
#let slot-grid(cells) = table(
  columns: (1.5cm, 1.5cm), rows: (0.72cm, 0.72cm, 0.72cm), inset: 0pt,
  stroke: 0.6pt + hair,
  ..cells.map(c => table.cell(
    fill: if c.at(1) == 1 { soft } else if c.at(1) == 2 { amber-soft } else { luma(238) },
    align: center + horizon,
    text(size: 9.5pt, weight: "bold", fill: if c.at(1) == 1 { accent } else if c.at(1) == 2 { amber } else { muted }, c.at(0)))),
)

// ======================================================================
//  PAGE DE TITRE
// ======================================================================
#block(width: 100%, inset: (bottom: 12pt), stroke: (bottom: 1.4pt + accent))[
  #text(size: 8.5pt, weight: "bold", fill: accent, tracking: 1.4pt)[BTS CPI · CONSTRUCTION DES SYSTÈMES TECHNIQUES]
  #v(6pt)
  #text(size: 27pt, weight: "bold")[Étude des mécanismes]
  #v(2pt)
  #text(size: 13pt, fill: muted)[Fiches de révision · torseurs, liaisons équivalentes, chaînes de solides, hyperstatisme]
]
#v(10pt)

Ces fiches reprennent le *Cours 2023* (pages 1 à 5) et le document ressource *« Déplacement d'un torseur »*, avec les exemples traités en cours, des schémas et des applications numériques. Les passages marqués *complément* viennent des autres cours (théorie des mécanismes, guidage en rotation) ou ont été ajoutés pour s'entraîner.

#v(4pt)
#fig-overview()

#v(8pt)
#text(size: 12pt, weight: "bold", fill: accent)[Sommaire]
#v(-4pt)
#line(length: 100%, stroke: 0.6pt + accent)
#outline(title: none, depth: 1, indent: 0pt)

#callout("Comment utiliser ces fiches")[
  Chaque fiche tient sur une à deux pages : *définitions*, *formules encadrées*, puis un *exemple concret*. Les encadrés bleus rappellent l'essentiel, les encadrés orange signalent un piège classique. La dernière fiche rassemble la méthode et le formulaire complet.
]

// ======================================================================
//  FICHE 1 — DÉPLACEMENT D'UN TORSEUR
// ======================================================================
= Déplacement d'un torseur
#source[Document ressource 2 · à maîtriser avant tout le reste du cours]

== Le principe
Un torseur écrit au point $A$ peut être réécrit en un autre point $B$ : la *résultante $arrow(R)$ ne change pas*, seul le *moment* change.

#formula[
  $ \{tau\} = mat(delim: "{", arrow(R); arrow(M)_A)_A quad arrow.r.double quad \{tau\} = mat(delim: "{", arrow(R); arrow(M)_B)_B $
  $ arrow(M)_B = arrow(M)_A + arrow(B A) and arrow(R) $
  #text(size: 9pt, fill: muted)[relation « BABAR » : on lit $M_B$, $M_A$, $B A$, $R$]
]

Démarche en quatre temps :
+ garder la résultante telle quelle ;
+ écrire le vecteur de transport $arrow(B A)$, du *nouveau* point $B$ vers l'*ancien* point $A$ ;
+ calculer le produit vectoriel $arrow(B A) and arrow(R)$ ;
+ l'ajouter à l'ancien moment $arrow(M)_A$.

== Produit vectoriel : la « règle du gamma »
#formula[
  $ vec(a_x, a_y, a_z) and vec(b_x, b_y, b_z) = vec(a_y b_z - a_z b_y, quad a_z b_x - a_x b_z, quad a_x b_y - a_y b_x) $
]

#table(
  columns: (auto, 1fr, auto, auto),
  align: (center + horizon, left + horizon, center + horizon, center + horizon),
  fill: (_, y) => if y == 0 { soft } else { none },
  [*Composante*], [*Méthode du cours*], [*Formule*], [*Avec $arrow(C A) and arrow(R)$*],
  [$x$], [On barre la ligne $x$, puis règle du gamma sur les lignes $y$ et $z$], [$a_y b_z - a_z b_y$], [$l_y Z_1 - l_z dot.op 0 = l_y Z_1$],
  [$y$], [On barre la ligne $y$ et on fait passer la ligne $x$ en dessous, puis gamma sur $z$ et $x$], [$a_z b_x - a_x b_z$], [$l_z X_1 - l_x Z_1$],
  [$z$], [On barre la ligne $z$, puis règle du gamma sur les lignes $x$ et $y$], [$a_x b_y - a_y b_x$], [$l_x dot.op 0 - l_y X_1 = -l_y X_1$],
)

#callout("À retenir")[
  Les trois composantes suivent la permutation circulaire $x arrow.r y arrow.r z arrow.r x$ : la composante $x$ utilise $(y, z)$, la composante $y$ utilise $(z, x)$ et la composante $z$ utilise $(x, y)$.
]

== Exemple du cours : torseur statique d'un pivot glissant
#grid(columns: (1fr, 205pt), gutter: 12pt,
  [
    Liaison 1 : *pivot glissant d'axe $(A, arrow(y))$*. Le point $C$ est repéré par ses coordonnées $(l_x, l_y, l_z)$. La translation et la rotation sont libres selon $y$, donc ni force ni moment sur $y$ : $N_s = 4$.

    $ \{tau_1\} = mat(delim: "{", augment: #1, X_1, L_1; 0, 0; Z_1, N_1)_A $

    On veut l'écrire en $C$ :
    $ arrow(M)_C = arrow(M)_A + arrow(C A) and arrow(R) $
  ],
  align(center)[#fig-3d()],
)

*Étape 1 — produit vectoriel* (règle du gamma, avec $arrow(C A) = (l_x, l_y, l_z)$ comme dans le cours) :
$ arrow(C A) and arrow(R) = vec(l_x, l_y, l_z) and vec(X_1, 0, Z_1) = vec(l_y Z_1, quad l_z X_1 - l_x Z_1, quad -l_y X_1) $

*Étape 2 — nouveau moment :*
$ arrow(M)_C = vec(L_1, 0, N_1) + vec(l_y Z_1, l_z X_1 - l_x Z_1, -l_y X_1) = vec(L_1 + l_y Z_1, quad l_z X_1 - l_x Z_1, quad N_1 - l_y X_1) $

*Étape 3 — torseur au point $C$ :*
#formula[
  $ \{tau_1\} = mat(delim: "{", augment: #1, X_1, L_1 + l_y Z_1; 0, l_z X_1 - l_x Z_1; Z_1, N_1 - l_y X_1)_C $
]

#callout("Piège : sens du vecteur de transport", tone: "warn")[
  Le cours calcule avec $arrow(C A) = (l_x, l_y, l_z)$. Si l'énoncé te donne plutôt les coordonnées de $C$ vues depuis $A$, alors $arrow(A C) = (l_x, l_y, l_z)$ et $arrow(C A) = -arrow(A C)$ : tous les termes ajoutés à $arrow(M)_A$ changent de signe. Vérifie toujours le sens du vecteur avant de calculer.
]

== Application numérique (complément)
Valeurs choisies pour s'entraîner : $arrow(C A)$ = (0,10 ; 0,20 ; 0,05) m, $X_1$ = 100 N, $Z_1$ = 50 N, $L_1$ = 2 N·m, $N_1$ = 3 N·m.

#align(center, table(
  columns: (auto, 1fr, 1.7fr, 1fr),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else if y == 4 { forest-soft } else { none },
  [], [*$x$*], [*$y$*], [*$z$*],
  [$arrow(C A)$ (m)], [0,10], [0,20], [0,05],
  [$arrow(R)$ (N)], [100], [0], [50],
  [$arrow(C A) and arrow(R)$ (N·m)], [0,20 × 50 = 10], [0,05 × 100 − 0,10 × 50 = 0], [−0,20 × 100 = −20],
  [$arrow(M)_C = arrow(M)_A + arrow(C A) and arrow(R)$], [2 + 10 = 12], [0 + 0 = 0], [3 − 20 = −17],
))

Le torseur au point $C$ a donc pour résultante (100 ; 0 ; 50) N et pour moment (12 ; 0 ; −17) N·m.

== Exemple du cours : torseur cinématique (même méthode)
Pour le même pivot glissant, le torseur cinématique en $A$ est composé d'une rotation $beta_1$ et d'une translation $v_1$ selon $y$ :
$ \{nu_1\} = mat(delim: "{", augment: #1, 0, 0; beta_1, v_1; 0, 0)_A $
Ici la résultante est $arrow(Omega)$ (vecteur rotation) et le moment est la vitesse $arrow(V)$ :
$ arrow(V)_C = arrow(V)_A + arrow(C A) and arrow(Omega) quad "avec" quad arrow(C A) and arrow(Omega) = vec(l_x, l_y, l_z) and vec(0, beta_1, 0) = vec(-l_z beta_1, 0, l_x beta_1) $
#formula[
  $ arrow(V)_C = vec(0, v_1, 0) + vec(-l_z beta_1, 0, l_x beta_1) = vec(-l_z beta_1, v_1, l_x beta_1) quad arrow.r.double quad \{nu_1\} = mat(delim: "{", augment: #1, 0, -l_z beta_1; beta_1, v_1; 0, l_x beta_1)_C $
]
*Application numérique* (complément) : avec $l_x$ = 0,10 m, $l_z$ = 0,05 m, $beta_1$ = 10 rad/s et $v_1$ = 0,5 m/s, on trouve $arrow(V)_C$ = (−0,5 ; 0,5 ; 1,0) m/s. Le point $C$, éloigné de l'axe, a une vitesse supplémentaire due à la rotation.

== Exercice d'entraînement (corrigé)
#example("pivot d'axe (A, x)")[
  $ \{tau\} = mat(delim: "{", augment: #1, X, 0; Y, M; Z, N)_A $ avec $X$ = 50 N, $Y$ = −80 N, $Z$ = 20 N, $M$ = 3 N·m, $N$ = 1 N·m. Déplacer ce torseur au point $C$ tel que $arrow(C A)$ = (0,20 ; 0,10 ; 0) m.

  #align(center, table(
    columns: (auto, 1fr, 1fr, 1.5fr),
    align: center + horizon,
    fill: (_, y) => if y == 0 { soft } else if y == 3 { forest-soft } else { none },
    [], [*$x$*], [*$y$*], [*$z$*],
    [$arrow(C A) and arrow(R)$], [0,10 × 20 − 0 = 2], [0 − 0,20 × 20 = −4], [0,20 × (−80) − 0,10 × 50 = −21],
    [$arrow(M)_A$], [0], [3], [1],
    [$arrow(M)_C$ (N·m)], [2], [−1], [−20],
  ))
  Formule générale utilisée : $arrow(C A) and arrow(R) = (l_y Z - l_z Y ; quad l_z X - l_x Z ; quad l_x Y - l_y X)$.
]

// ======================================================================
//  FICHE 2 — TORSEURS, LIAISONS ET NOTATIONS
// ======================================================================
= Torseurs, liaisons et notations
#source[Cours 2023 · page 1, avec le tableau des liaisons normalisées en complément]

== Définitions
- *Mécanisme* : ensemble de solides liés entre eux par des liaisons.
- *Hypothèses* : solides indéformables, liaisons parfaites.
- *Graphe des liaisons* : un cercle par solide (classe d'équivalence), un trait par liaison $L_i$.

#align(center, fig-notation())

== Les deux torseurs d'une liaison
#formula[
  $ \{tau_i\} = mat(delim: "{", augment: #1, X_i, L_i; Y_i, M_i; Z_i, N_i)_(O, cal(B)) quad quad N_(s i) <= 6 $
  #text(size: 9.5pt)[*Torseur statique* (actions mécaniques transmissibles) · $N_(s i)$ = nombre d'inconnues statiques indépendantes]
]
#formula[
  $ \{nu_i\} = mat(delim: "{", augment: #1, alpha_i, u_i; beta_i, v_i; gamma_i, w_i)_(O, cal(B)) quad quad N_(c i) <= 6 $
  #text(size: 9.5pt)[*Torseur cinématique* · $N_(c i)$ = nombre d'inconnues cinématiques indépendantes (degrés de liberté)]
]

#formula[
  #text(size: 13pt)[$ N_s + N_c = 6 $]
  #text(size: 9.5pt)[pour *toute liaison* : une case du torseur est soit une inconnue statique, soit un degré de liberté]
]

== Lire un torseur avec une grille
Chaque liaison remplit les six cases d'un torseur : si un mouvement est *libre*, l'action correspondante est *nulle* (et inversement).

#grid(columns: (1fr, 1fr, 1fr, 1fr), gutter: 6pt, align: top + center,
  [#text(size: 9pt, weight: "bold")[Pivot $(O, arrow(z))$] \ #text(size: 8.5pt, fill: muted)[statique · $N_s = 5$] #v(3pt) #slot-grid(((($X$), 1), ($L$, 1), ($Y$, 1), ($M$, 1), ($Z$, 1), ($0$, 0)))],
  [#text(size: 9pt, weight: "bold")[Pivot $(O, arrow(z))$] \ #text(size: 8.5pt, fill: muted)[cinématique · $N_c = 1$] #v(3pt) #slot-grid((($0$, 0), ($0$, 0), ($0$, 0), ($0$, 0), ($gamma$, 1), ($0$, 0)))],
  [#text(size: 9pt, weight: "bold")[Hélicoïdale $(O, arrow(x))$] \ #text(size: 8.5pt, fill: muted)[statique · $N_s = 5$] #v(3pt) #slot-grid((($X_2$, 1), ($k X_2$, 2), ($Y_2$, 1), ($M_2$, 1), ($Z_2$, 1), ($N_2$, 1)))],
  [#text(size: 9pt, weight: "bold")[Hélicoïdale $(O, arrow(x))$] \ #text(size: 8.5pt, fill: muted)[cinématique · $N_c = 1$] #v(3pt) #slot-grid((($alpha$, 1), ($p alpha$, 2), ($0$, 0), ($0$, 0), ($0$, 0), ($0$, 0)))],
)
#v(4pt)
#align(center, text(size: 8.5pt, fill: muted)[
  #box(width: 9pt, height: 9pt, fill: soft, stroke: 0.5pt + hair) inconnue statique ou degré de liberté #h(10pt)
  #box(width: 9pt, height: 9pt, fill: luma(238), stroke: 0.5pt + hair) composante nulle #h(10pt)
  #box(width: 9pt, height: 9pt, fill: amber-soft, stroke: 0.5pt + hair) composante liée (non indépendante)
])

#callout("À retenir")[
  Pivot d'axe $(O, arrow(z))$ : 5 inconnues statiques $(X, Y, Z, L, M)$ et 1 seul degré de liberté $(gamma)$. Hélicoïdale d'axe $(O, arrow(x))$ : la translation et la rotation sont liées par le pas, donc $L = k dot.op X$ n'est pas une inconnue de plus : $N_s = 5$ et $N_c = 1$. Le coefficient $k$ dépend du pas ($p slash 2 pi$ dans le cours de théorie des mécanismes).
]

== Liaisons normalisées : $N_c$ et $N_s$ (complément)
#align(center, table(
  columns: (5.6cm, 2.6cm, 2.2cm, 1.5cm, 1.5cm),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else { none },
  inset: 5pt,
  [*Liaison*], [*Translations*], [*Rotations*], [*$N_c$*], [*$N_s$*],
  [Encastrement], [0], [0], [0], [6],
  [Pivot], [0], [1], [1], [5],
  [Glissière], [1], [0], [1], [5],
  [Hélicoïdale], [1 (liée)], [1], [1], [5],
  [Pivot glissant], [1], [1], [2], [4],
  [Sphérique à doigt], [0], [2], [2], [4],
  [Rotule (sphérique)], [0], [3], [3], [3],
  [Appui plan], [2], [1], [3], [3],
  [Linéaire rectiligne], [2], [2], [4], [2],
  [Linéaire annulaire (sphère-cylindre)], [1], [3], [4], [2],
  [Ponctuelle (sphère-plan)], [2], [3], [5], [1],
))

// ======================================================================
//  FICHE 3 — LIAISON ÉQUIVALENTE ET PARALLÈLE
// ======================================================================
= Liaison équivalente et liaisons en parallèle
#source[Cours 2023 · pages 2 · exemple du guidage en rotation en complément]

== Liaison équivalente
La *liaison équivalente* entre deux pièces est celle qui se substituerait à l'ensemble des liaisons réalisées entre ces pièces. Elle doit avoir *le même comportement* que cet ensemble : mêmes mouvements possibles, mêmes actions transmissibles.

#align(center, fig-eq())

== Liaisons en parallèle
Deux solides $S_1$ et $S_2$ sont reliés par $n$ liaisons $L_1, dots, L_n$.

#align(center, fig-par())

#grid(columns: (1fr, 1fr), gutter: 12pt,
  [
    *Étude statique.* On applique le PFS à $S_2$ en un point choisi : chaque liaison apporte son torseur, la liaison équivalente apporte leur somme.
    #formula[$ \{tau_"eq"\} = sum \{tau_i\} $]
  ],
  [
    *Étude cinématique.* Un degré de liberté supprimé dans *une seule* des liaisons $L_i$ est supprimé pour la liaison équivalente.
    #formula[$ \{nu_"eq"\} = \{nu_i\} $]
  ],
)

#callout("Remarque", tone: "info")[
  Tous les torseurs doivent être écrits *au même point* (fiche 1) avant d'être additionnés.
]

== Hyperstatisme de la liaison équivalente
#formula[
  $ h = N_s - r_s quad quad N_s = sum N_(s i) quad quad r_s <= 6 quad quad m = 6 - r_s $
  #text(size: 9.5pt)[$r_s$ = nombre d'équations indépendantes de la statique = nombre de degrés de liberté supprimés dans la liaison équivalente · $m$ = mobilité de la liaison équivalente]
]

== Exemple (complément) : rotule en parallèle avec linéaire annulaire
#grid(columns: (1fr, 270pt), gutter: 8pt,
  [
    Un arbre est guidé par une *linéaire annulaire* en $A$ (axe $x$) et une *rotule* en $B$, distantes de $l$. Quelle est la liaison équivalente ?

    Torseurs transmissibles :
    $ \{tau_A\} = mat(delim: "{", augment: #1, 0, 0; Y_A, 0; Z_A, 0)_A quad \{tau_B\} = mat(delim: "{", augment: #1, X_B, 0; Y_B, 0; Z_B, 0)_B $
  ],
  align(center + horizon)[#fig-guidage()],
)

*1. Tout ramener en $B$* (avec $arrow(B A) = (-l, 0, 0)$) :
$ arrow(B A) and arrow(R)_A = vec(-l, 0, 0) and vec(0, Y_A, Z_A) = vec(0, l Z_A, -l Y_A) $

*2. Additionner* (parallèle : $\{tau_"eq"\} = sum \{tau_i\}$) :
#formula[
  $ \{tau_"eq"\} = mat(delim: "{", augment: #1, X_B, 0; Y_A + Y_B, l Z_A; Z_A + Z_B, -l Y_A)_B $
]

*3. Conclure.* Les 5 inconnues $(X_B, Y_A + Y_B, Z_A + Z_B, l Z_A, -l Y_A)$ sont indépendantes : $N_s = 3 + 2 = 5$, $r_s = 5$.
$ h = N_s - r_s = 5 - 5 = 0 quad quad m = 6 - 5 = 1 $
La seule mobilité est la rotation autour de $x$ : c'est une *pivot d'axe $(B, arrow(x))$*, *isostatique*.

#callout("Variante hyperstatique", tone: "warn")[
  Avec *deux rotules* en $A$ et $B$, la composante selon $x$ vaut $X_A + X_B$ : on ne peut pas retrouver $X_A$ et $X_B$ séparément. Alors $N_s = 3 + 3 = 6$ pour $r_s = 5$ équations indépendantes, soit $h = 6 - 5 = 1$ : le montage est hyperstatique de degré 1 (il faudra une condition géométrique, comme la coaxialité des deux portées).
]

// ======================================================================
//  FICHE 4 — LIAISONS EN SÉRIE (CHAÎNE CONTINUE OUVERTE)
// ======================================================================
= Liaisons en série : chaîne continue ouverte
#source[Cours 2023 · page 3 · exemple appui plan + rotule en complément]

== Définition et notations
Une *chaîne continue ouverte* (CCO) comporte *$n$ solides* et *$(n - 1)$ liaisons* isostatiques (le support, s'il existe, fait partie des $n$ solides).

#align(center, fig-series())

#grid(columns: (1fr, 1fr), gutter: 14pt,
  [
    *Notations pour la liaison $L_i$* (entre $S_i$ et $S_(i+1)$) :
    $ \{tau_i\} = \{tau_((S_i arrow.r S_(i+1)))\} $
    $ \{nu_i\} = \{nu_((S_(i+1) slash S_i))\} $
  ],
  [
    *Notations pour la liaison équivalente* :
    $ \{tau_"eq"\} = \{tau_((S_1 arrow.r S_n))\} $
    $ \{nu_"eq"\} = \{nu_((S_n slash S_1))\} $
  ],
)

== Étude statique
On applique le PFS successivement à $S_1$, puis à $S_1 union S_2$, puis à $S_1 union S_2 union S_3$, etc. Aucune action extérieure ne s'exerce sur les solides intermédiaires : *le même torseur traverse toutes les liaisons*, donc l'équivalente ne transmet que ce que *toutes* les liaisons peuvent transmettre à la fois.
#formula[$ \{tau_"eq"\} = \{tau_i\} $]

== Étude cinématique
Composition des mouvements d'un solide à l'autre :
$ \{nu_((S_n slash S_1))\} = \{nu_((S_n slash S_(n-1)))\} + \{nu_((S_(n-1) slash S_(n-2)))\} + dots.c + \{nu_((S_2 slash S_1))\} $
#formula[$ \{nu_"eq"\} = sum \{nu_i\} $]

#callout("À retenir")[
  La liaison équivalente à plusieurs liaisons isostatiques en série (chaîne ouverte) est *toujours isostatique*. L'étude peut se faire en statique ou en cinématique ; la cinématique donne en plus la *mobilité utile* $m_u$ et la *mobilité interne* $m_i$ :
  $ m = N_c = sum N_(c i) quad quad m = m_u + m_i quad quad m_u = "nombre de degrés de liberté de la liaison équivalente" $
]

== Parallèle ou série ? Le bon réflexe
#align(center, table(
  columns: (3.2cm, 1fr, 1fr),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else { none },
  [], [*Parallèle*], [*Série (chaîne ouverte)*],
  [*Statique*], [$\{tau_"eq"\} = sum \{tau_i\}$ \ les actions s'*additionnent*], [$\{tau_"eq"\} = \{tau_i\}$ \ seules les actions *communes* passent],
  [*Cinématique*], [$\{nu_"eq"\} = \{nu_i\}$ \ seuls les mouvements *communs* restent], [$\{nu_"eq"\} = sum \{nu_i\}$ \ les mouvements s'*additionnent*],
))
#align(center, text(size: 9.5pt, fill: muted)[Moyen mnémotechnique : en parallèle, la *statique* s'additionne ; en série, c'est la *cinématique*.])

== Exemple (complément) : appui plan en série avec une rotule
#fig-serie-ex()
Un solide 1 est en *appui plan* de normale $y$ avec une pièce 5 (point $B$), qui est elle-même en *rotule* de centre $A$ avec une pièce 6. Quelle est la liaison équivalente entre 1 et 6 ?

*1. Torseurs transmissibles* (appui plan : $Y$, $L$, $N$ ; rotule : $X$, $Y$, $Z$) :
$ \{tau_(1 slash 5)\} = mat(delim: "{", augment: #1, 0, L_B; Y_B, 0; 0, N_B)_B quad quad \{tau_(5 slash 6)\} = mat(delim: "{", augment: #1, X_A, 0; Y_A, 0; Z_A, 0)_A $

*2. Tout ramener en $A$.* Comme $arrow(A B)$ est parallèle à $y$ (distance $d$) et que la force est selon $y$, le produit vectoriel est nul :
$ arrow(M)_A = vec(L_B, 0, N_B) + vec(0, -d, 0) and vec(0, Y_B, 0) = vec(L_B, 0, N_B) $

*3. Série : on garde ce que les deux liaisons transmettent.* La rotule ne transmet *aucun moment* donc $L_B = N_B = 0$ ; l'appui plan ne transmet *aucune force selon $x$ ni $z$*. Il ne reste que $Y$ :
#formula[
  $ \{tau_(1 slash 6)\} = mat(delim: "{", augment: #1, 0, 0; Y, 0; 0, 0)_A $
  #text(size: 9.5pt)[liaison *ponctuelle* d'axe $(A, arrow(y))$ · $N_s = 1$ · on privilégie plutôt les contacts surfaciques pour limiter les pressions]
]

*Mobilités (étude cinématique).* $m = N_c = 3 + 3 = 6$ : l'appui plan laisse 2 translations et 1 rotation, la rotule 3 rotations. La liaison équivalente (ponctuelle) a $N_c = 5$ degrés de liberté, donc $m_u = 5$ et *$m_i = 6 - 5 = 1$* : la rotation autour de $y$ est comptée deux fois, c'est une mobilité interne.

// ======================================================================
//  FICHE 5 — CHAÎNE CONTINUE FERMÉE
// ======================================================================
= Chaîne continue fermée
#source[Cours 2023 · page 4 · bielle-manivelle et pompe hydraulique en complément]

== Définition
Une *chaîne continue fermée* (CCF) comporte *$n$ solides* et *$n$ liaisons* isostatiques. Le solide $S_2$ est l'entrée supposée (torseur d'efforts extérieurs $\{tau_e\}$), le solide $S_i$ la sortie supposée (torseur $\{tau_s\}$).

#align(center, fig-ccf())

== Étude statique
On applique le PFS aux $(n - 1)$ solides : on obtient $r_s$ équations scalaires indépendantes entre les $N_s = sum N_(s i)$ inconnues statiques, avec $r_s <= 6(n - 1)$.
#formula[$ h = N_s - r_s $]

== Étude cinématique
Composition des torseurs cinématiques sur la boucle :
$ \{nu_((S_n slash S_(n-1)))\} + \{nu_((S_(n-1) slash S_(n-2)))\} + dots.c + \{nu_((S_2 slash S_1))\} + \{nu_((S_1 slash S_n))\} = 0 quad arrow.r.double quad sum \{nu_i\} = 0 $
On obtient au plus $r_c <= 6$ équations indépendantes pour les $N_c$ inconnues cinématiques.
#formula[$ m = N_c - r_c $]

== Formule de mobilité (relation entre $h$ et $m$)
Quand il y a beaucoup de solides, trouver $r_s$ est fastidieux. On l'élimine avec trois relations :
$ h = N_s - r_s quad quad m = 6(n - 1) - r_s quad quad N_s + N_c = 6 times "nbre de liaisons" = 6 n $

#grid(columns: (1fr, 1fr), gutter: 12pt,
  formula[
    #text(size: 9pt, fill: muted)[Étude statique]
    $ h = N_s + m - 6 (n - 1) $
  ],
  formula[
    #text(size: 9pt, fill: muted)[Étude cinématique]
    $ h = m + 6 - N_c $
  ],
)

#callout("Pourquoi ça marche")[
  De $m = 6(n - 1) - r_s$ on tire $r_s = 6(n - 1) - m$ ; on le remplace dans $h = N_s - r_s$, ce qui donne la formule statique. Avec $N_s = 6 n - N_c$, elle devient la formule cinématique.
]

== Exemple (complément) : bielle-manivelle, deux modèles
#grid(columns: (1fr, 190pt), gutter: 6pt, align: horizon,
  align(center, fig-bielle()),
  align(center, fig-bielle-graph()),
)
Le graphe est une boucle de $n = 4$ solides et $l = 4$ liaisons : c'est bien une chaîne fermée. Le choix du modèle dépend de l'objectif : tolérances ou calcul des efforts.

#align(center, table(
  columns: (2.6cm, 4.4cm, 1.3cm, 2.2cm, 3.6cm),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else { none },
  [*Modèle*], [*Liaisons 0-1, 1-2, 2-3, 3-0*], [*$N_c$*], [*$m = m_u + m_i$*], [*$h = m + 6 - N_c$*],
  [Tout en pivots], [pivot, pivot, pivot, glissière \ $1 + 1 + 1 + 1$], [4], [$1 = 1 + 0$], [$1 + 6 - 4 = 3$],
  [Avec deux rotules], [pivot, rotule, rotule, glissière \ $1 + 3 + 3 + 1$], [8], [$2 = 1 + 1$], [$2 + 6 - 8 = 0$],
))

- *Modèle 1* : $h = 3$, mécanisme *hyperstatique*. Pour le monter sans contrainte il faut imposer des conditions géométriques (axes des pivots parallèles, perpendiculaires à la glissière) ou prévoir des jeux.
- *Modèle 2* : $h = 0$, *isostatique* : on peut calculer toutes les actions avec le PFS seul. La mobilité interne $m_i = 1$ est la rotation de la bielle autour de son propre axe.
- Vérification par la statique du modèle 2 : $N_s = 5 + 3 + 3 + 5 = 16$ donc $h = 16 + 2 - 6 times 3 = 0$. ✓

== Exemple traité en cours : pompe hydraulique (étude pour 1 piston)
Avec $n = 4$ pièces, $m_u = 1$ (rotation de l'arbre), $m_i = 2$ et $sum N_s = 5 + 3 + 3 + 4 = 15$ :
#formula[
  $ h = (m_u + m_i) + sum N_s - 6(n - 1) = (1 + 2) + 15 - 18 = 0 $
]
Vérification par la cinématique : $N_c = 6 times 4 - 15 = 9$ et $h = m + 6 - N_c = 3 + 6 - 9 = 0$. ✓ Les deux approches donnent le même résultat.

// ======================================================================
//  FICHE 6 — CHAÎNE COMPLEXE
// ======================================================================
= Chaîne complexe et nombre cyclomatique
#source[Cours 2023 · page 5 · pompe à pistons en complément]

== Définitions
Une *chaîne complexe* est un mécanisme dont le graphe des liaisons contient *plusieurs boucles fermées connexes*, appelées *cycles*. On le décrit par $n$ classes d'équivalence (solides) reliées par $l$ liaisons.

#align(center, fig-complex())

- *Cycle* : suite de classes d'équivalence et de liaisons en chaîne fermée, telle qu'on ne rencontre pas deux fois la même classe (sauf la classe de début et la classe de fin, qui sont identiques).
- *Nombre cyclomatique* $gamma$ : nombre de cycles *indépendants* du graphe.

#formula[
  $ gamma = l - n + 1 $
]

#align(center, table(
  columns: (3.4cm, 1.4cm, 1.4cm, 3.6cm, 1.8cm),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else { none },
  [*Graphe*], [*$n$*], [*$l$*], [*Calcul*], [*$gamma$*],
  [Gauche (4 solides)], [4], [5], [$5 - 4 + 1$], [2],
  [Droite (3 solides)], [3], [4], [$4 - 3 + 1$], [2],
))

== Formule de mobilité pour une chaîne complexe
On part des mêmes relations que pour la chaîne fermée, avec $l$ liaisons :
$ N_s + N_c = 6 l quad quad h = N_s - r_s quad quad m = 6(n - 1) - r_s $
D'où :
$ h = 6 l - N_c + m - 6(n - 1) = 6(l - n + 1) - N_c + m $
#formula[
  $ h = 6 gamma - N_c + m quad quad m = N_c - r_c $
  #text(size: 9.5pt)[$N_c$ = somme des $N_(c i)$ de *toutes* les liaisons · $m$ = $m_u + m_i$ · $r_c$ = nombre d'équations cinématiques indépendantes]
]

== Cette formule contient toutes les autres
#align(center, table(
  columns: (4.4cm, 2.2cm, 1fr),
  align: center + horizon,
  fill: (_, y) => if y == 0 { soft } else { none },
  [*Type de chaîne*], [*$gamma$*], [*Formule obtenue*],
  [Chaîne ouverte ($l = n - 1$)], [0], [$h = - N_c + m = 0$ car $m = N_c$ : *isostatique*],
  [Chaîne fermée ($l = n$)], [1], [$h = 6 - N_c + m$ (fiche 5)],
  [Chaîne complexe], [$>= 2$], [$h = 6 gamma - N_c + m$],
))

== Exemple (complément) : pompe à pistons
La pompe étudiée en cours (arbre 1, plateau 5, bâti 0 et 6 pistons) compte :
- $n = 9$ solides : le bâti, l'arbre, le plateau et les 6 pistons ;
- $l = 14$ liaisons : arbre/bâti, arbre/plateau, 6 liaisons plateau/piston et 6 liaisons piston/bâti.

#formula[
  $ gamma = l - n + 1 = 14 - 9 + 1 = 6 $
]
Chaque piston ajoute *un cycle* au graphe. Pour *un seul piston* ($n = 4$, $l = 4$), le graphe est une simple boucle : $gamma = 1$, et la fiche 5 donne $h = 0$.

// ======================================================================
//  FICHE 7 — MÉTHODE, PIÈGES ET FORMULAIRE
// ======================================================================
= Méthode, pièges et formulaire
#source[Synthèse de tout le cours]

== Méthode en six étapes pour calculer $h$
+ *Modéliser* : lister les solides (classes d'équivalence) et les liaisons, puis dessiner le *graphe des liaisons*.
+ *Compter* : $n$ solides, $l$ liaisons, et en déduire $gamma = l - n + 1$ (0 : chaîne ouverte, 1 : chaîne fermée, $>= 2$ : chaîne complexe).
+ *Relever* $N_c$ (ou $N_s$) de chaque liaison avec le tableau de la fiche 2, puis faire la somme. Vérifier $N_s + N_c = 6 l$.
+ *Déterminer la mobilité* $m = m_u + m_i$ : mobilité utile (celle qui justifie la fonction) et mobilités internes (rotation d'une bielle autour de son axe, d'un piston dans son alésage…).
+ *Appliquer la formule* : $h = 6 gamma - N_c + m$ (ou la version statique $h = N_s + m - 6(n - 1)$).
+ *Interpréter* : $h = 0$ isostatique, $h > 0$ hyperstatique.

#grid(columns: (1fr, 1fr), gutter: 12pt,
  callout([Isostatique ($h = 0$)], tone: "ok")[
    Le PFS suffit pour calculer les actions. Pas de tolérances géométriques serrées, montage facile, mais système moins rigide.
  ],
  callout([Hyperstatique ($h > 0$)], tone: "warn")[
    Plus rigide et plus précis, mais il faut imposer $h$ conditions géométriques (coaxialité, parallélisme…) ou ajouter $h$ degrés de liberté (jeux).
  ],
)

== Pièges classiques
#callout("À vérifier avant de rendre une copie", tone: "warn")[
  - *Même point, même base, mêmes unités* avant d'additionner deux torseurs.
  - $N_s + N_c = 6$ vaut pour *une* liaison ; pour tout le mécanisme, c'est $N_s + N_c = 6 l$.
  - Une *chaîne ouverte* est toujours isostatique : $h = 0$.
  - $h$ ne peut pas être négatif : si le calcul donne $h < 0$, il y a une erreur de comptage ($N_c$ ou $m$).
  - N'oublie pas les *mobilités internes* $m_i$ dans $m = m_u + m_i$.
  - *Sens du vecteur de transport* : $arrow(C A)$ ou $arrow(A C)$ change le signe du résultat.
]

== Formulaire complet
#align(center, table(
  columns: (4cm, 1fr, 1.3cm),
  align: (left + horizon, center + horizon, center + horizon),
  fill: (_, y) => if y == 0 { soft } else { none },
  inset: 5.5pt,
  [*Notion*], [*Formule*], [*Fiche*],
  [Changement de point], [$arrow(M)_B = arrow(M)_A + arrow(B A) and arrow(R)$], [1],
  [Complémentarité], [$N_s + N_c = 6$], [2],
  [Liaisons en parallèle], [$\{tau_"eq"\} = sum \{tau_i\} quad quad \{nu_"eq"\} = \{nu_i\}$], [3],
  [Hyperstatisme d'une liaison équivalente], [$h = N_s - r_s quad quad m = 6 - r_s$], [3],
  [Liaisons en série (chaîne ouverte)], [$\{tau_"eq"\} = \{tau_i\} quad quad \{nu_"eq"\} = sum \{nu_i\}$], [4],
  [Mobilité], [$m = N_c = sum N_(c i) = m_u + m_i$ (chaîne ouverte)], [4],
  [Chaîne fermée : statique], [$h = N_s - r_s = N_s + m - 6(n - 1)$], [5],
  [Chaîne fermée : cinématique], [$m = N_c - r_c quad quad h = m + 6 - N_c$], [5],
  [Nombre cyclomatique], [$gamma = l - n + 1$], [6],
  [Chaîne complexe], [$h = 6 gamma - N_c + m$], [6],
))

== Auto-test
#table(
  columns: (1fr, 1fr),
  fill: (_, y) => if y == 0 { soft } else { none },
  [*Question*], [*Réponse*],
  [Quand on change de point, qu'est-ce qui varie dans un torseur ?], [Seul le moment ; la résultante reste la même.],
  [Combien valent $N_s$ et $N_c$ pour une rotule ?], [$N_s = 3$ et $N_c = 3$.],
  [Statique de deux liaisons en parallèle ?], [On additionne : $\{tau_"eq"\} = sum \{tau_i\}$.],
  [Cinématique de deux liaisons en série ?], [On additionne : $\{nu_"eq"\} = sum \{nu_i\}$.],
  [Quel est $h$ d'une chaîne ouverte ?], [$h = 0$ : elle est toujours isostatique.],
  [Calcule $gamma$ pour $n = 4$ et $l = 5$.], [$gamma = 5 - 4 + 1 = 2$.],
  [Chaîne fermée avec $N_c = 8$ et $m = 2$ : que vaut $h$ ?], [$h = 2 + 6 - 8 = 0$ : isostatique.],
  [Pourquoi la bielle-manivelle « tout en pivots » est-elle hyperstatique ?], [$N_c = 4$ et $m = 1$ donnent $h = 1 + 6 - 4 = 3$ : il faut des conditions géométriques ou des jeux.],
)

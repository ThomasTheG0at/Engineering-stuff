// =====================================================================
//  FICHES DE RÉVISION — ÉTUDE DES MÉCANISMES
//  Torseurs · Liaisons · Mobilité · Hyperstatisme · Exercices corrigés
//  Compiler avec : typst compile fiches.typ fiches.pdf
//  (Typst >= 0.10, aucun package externe requis)
// =====================================================================

#set document(title: "Fiches de révision — Étude des mécanismes", author: "Thomas")
#set page(paper: "a4", margin: (x: 1.6cm, y: 1.7cm), numbering: "1 / 1", footer: align(center, text(8pt, gray, [_Fiches de révision — Étude des mécanismes_])))
#set text(font: "New Computer Modern", size: 10pt, lang: "fr")
#set heading(numbering: "1.1")
#set par(justify: true)
#show heading.where(level: 1): it => block(above: 1.4em, below: 1em, {
  text(13pt, weight: "bold", block(fill: luma(235), inset: (x: 10pt, y: 8pt), radius: 4pt, width: 100%, align(left, it)))
})
#show heading.where(level: 2): it => block(above: 1.1em, below: 0.6em, text(11pt, weight: "bold", fill: rgb("#1a3a5c"), it))
#show heading.where(level: 3): it => block(above: 0.9em, below: 0.5em, text(10pt, weight: "bold", it))

// ---- Palette sobre -----------------------------------------------------
#let accent     = rgb("#1a3a5c")   // bleu profond
#let accentsoft = rgb("#eaf0f6")   // bleu très clair
#let ok         = rgb("#1e6e42")   // vert
#let warn       = rgb("#8a5a00")   // ocre

#let fiche(titre, corps) = block(width: 100%, breakable: true, above: 1.2em, below: 1.2em, {
  block(width: 100%, fill: accent, inset: (x: 10pt, y: 7pt), radius: (top: 4pt), text(11.5pt, weight: "bold", fill: white, titre))
  block(width: 100%, fill: accentsoft, inset: 12pt, radius: (bottom: 4pt), stroke: (paint: accent, thickness: 0.5pt, dash: "solid"), corps)
})

#let encadre(titre, corps) = block(width: 100%, above: 0.8em, below: 0.8em, {
  block(width: 100%, fill: rgb("#fdf6e3"), inset: (x: 10pt, y: 8pt), radius: 3pt, stroke: (left: 2.5pt + warn), {
    text(weight: "bold", fill: warn, upper(titre))
    v(2pt)
    corps
  })
})

#let formule(nom, f) = block(width: 100%, above: 0.8em, below: 0.8em, {
  grid(columns: (auto, 1fr), align: (center, left), column-gutter: 12pt,
    text(weight: "bold", fill: accent, nom),
    block(fill: white, inset: 10pt, radius: 3pt, stroke: 0.5pt + luma(180), width: 100%, align(center, f))
  )
})

#let important(txt) = text(weight: "bold", fill: ok, txt)

// ---- Petits schémas natifs Typst (aucun package requis) ---------------
// Grille de dessin simple : on place des rects / cercles / textes.
#let croquis(largeur: 100%, hauteur: 100pt, corps) = block(width: largeur, height: hauteur, above: 0.8em, below: 0.4em, stroke: 0.5pt + luma(200), radius: 3pt, clip: true, corps)
#let barre(x, y, w, h: 1.2pt) = place(dx: x, dy: y, rect(width: w, height: h, fill: black, stroke: none))
#let barrev(x, y, h, w: 1.2pt) = place(dx: x, dy: y, rect(width: w, height: h, fill: black, stroke: none))
#let pt(x, y, r: 2.4pt) = place(dx: x, dy: y, circle(radius: r, fill: black, stroke: none))
#let lab(x, y, t, an: 7.5pt, col: black) = place(dx: x, dy: y, text(size: an, fill: col, weight: "bold", t))
#let solide(x, y, w, h) = place(dx: x, dy: y, rect(width: w, height: h, fill: luma(220), stroke: 0.8pt + black, radius: 2pt))
#let hach(x, y, w, h, n: 5) = {
  place(dx: x, dy: y, rect(width: w, height: h, stroke: 0.8pt + black))
  for i in range(n) { place(dx: x + (i + 1) * w / (n + 1), dy: y, rect(width: 0.7pt, height: h, fill: black, stroke: none)) }
}

// =====================================================================
//  PAGE DE GARDE
// =====================================================================
#align(center, [
  #v(3cm)
  #text(22pt, weight: "bold", fill: accent)[ÉTUDE DES MÉCANISMES]
  #v(0.3cm)
  #text(14pt)[Fiches de révision & exercices corrigés]
  #v(0.6cm)
  #text(11pt, gray)[Torseurs — Liaisons — Mobilité — Hyperstatisme]
  #v(1cm)
  #block(width: 60%, inset: 14pt, stroke: 0.8pt + accent, radius: 5pt)[
    #text(10pt)[
      #table(
        columns: (auto, auto), align: left, inset: 6pt, stroke: none,
        [*Fiche 1.*], [Déplacer un torseur (BABAR) & produit vectoriel],
        [*Fiche 2.*], [Liaisons usuelles : torseurs, $N_s$, $N_c$],
        [*Fiche 3.*], [Méthodologie : parallèle, série, chaîne complexe],
        [*Fiche 4.*], [Exercice corrigé — Montage de vérin (2 solutions)],
        [*Fiche 5.*], [Exercice corrigé — Bras de chargement],
        [*Fiche 6.*], [Exercice corrigé — Guidage du manipulateur],
        [*Fiche 7.*], [Exercice corrigé — PHR de l'Airbus A340],
      )
    ]
  ]
  #v(0.5cm)
  #text(9pt, gray)[SOMMAIRE DU COURS 2023 — Préparation examen, novembre 2026]
])

#pagebreak()

// =====================================================================
//  FICHE 1 — BABAR
// =====================================================================
#fiche[Fiche 1 — Déplacer un torseur : la relation « BABAR »][

== Principe
Un torseur est défini *en un point*. Si on change de point, la *résultante ne change pas*, seul le *moment* change.

$ lr({tau}) = cases(lr({vec(R) \ vec(M)_A})_A & "écrit en A" \ lr({vec(R) \ vec(M)_B})_B & "écrit en B")$

#formule[BABAR][
  $ vec(M)_B = vec(M)_A + arrow(BA) wedge vec(R) $
]
#text(9pt, gray)[Moyen mnémotechnique : *B — A — BA — R*, soit « le moment en B égale le moment en A, plus $arrow(BA)$ vectoriel $R$ ».]

Attention au sens du vecteur : c'est bien $arrow(BA)$ (de B vers A), *pas* $arrow(AB)$ !

== Rappel : calcul du produit vectoriel (règle du gamma)
Pour $arrow(CA) wedge vec(R)$ avec $arrow(CA) = (l_x, l_y, l_z)$ et $vec(R) = (X_1, 0, Z_1)$ :

$ arrow(CA) wedge vec(R) = mat(l_x, X_1; l_y, 0; l_z, Z_1) $
- *Composante sur $x$* : barrer la ligne des $x$, règle du gamma sur ce qui reste :
  $ det(l_y, 0; l_z, Z_1) = l_y dot Z_1 - l_z dot 0 = l_y Z_1 $
- *Composante sur $y$* : barrer la ligne des $y$, faire *descendre la ligne des $x$* en bas, puis gamma :
  $ det(l_z, Z_1; l_x, X_1) = l_z dot X_1 - l_x dot Z_1 $
- *Composante sur $z$* : barrer la ligne des $z$, gamma sur les deux premières lignes :
  $ det(l_x, X_1; l_y, 0) = l_x dot 0 - l_y dot X_1 = -l_y X_1 $

#encadre[astuce][La règle du gamma : première ligne × première colonne, moins première colonne... *moins* deuxième ligne × deuxième colonne. Le signe « moins » se met toujours *entre* les deux produits.]

== Exemple complet (statique)
Liaison 1 = *pivot glissant d'axe $(A, vec(y))$, point $C(l_x, l_y, l_z)$.

$ lr({tau_1}) = mat(delim: "{", X_1, L_1; 0, 0; Z_1, N_1)_A
   quad arrow quad
   lr({tau_1}) = mat(delim: "{", X_1, L_1 + l_y Z_1; 0, l_z X_1 - l_x Z_1; Z_1, N_1 - l_y X_1)_C $

Détail : $vec(M)_C = vec(M)_A + arrow(CA) wedge vec(R) = (L_1, 0, N_1) + (l_y Z_1, l_z X_1 - l_x Z_1, -l_y X_1)$.

== Exemple complet (cinématique)
Torseur cinématique de la même liaison :
$ lr({V_1}) = mat(delim: "{", 0, 0; beta_1, v_1; 0, 0)_A $

On utilise la relation analogue (le moment du torseur cinématique est la vitesse) :
#formule[Changement de point (cinématique)][
  $ vec(V)_C = vec(V)_A + arrow(CA) wedge vec(Omega), quad vec(Omega) = (0, beta_1, 0) $
]
$ arrow(CA) wedge vec(Omega) = (l_x, l_y, l_z) wedge (0, beta_1, 0) = (-l_z beta_1, 0, l_x beta_1) $

$ lr({V_1}) = mat(delim: "{", 0, -l_z beta_1; beta_1, v_1; 0, l_x beta_1)_C $

#encadre[à retenir][
- BABAR : $vec(M)_B = vec(M)_A + arrow(BA) wedge vec(R)$ (statique) et $vec(V)_C = vec(V)_A + arrow(CA) wedge vec(Omega)$ (cinématique).
- La résultante (ou $Omega$) est *invariante* ; seul le moment change.
- Même méthode pour les deux torseurs, seule la nature du moment change ($M$ ou $V$).
]
]

// =====================================================================
//  FICHE 2 — LIAISONS
// =====================================================================
#fiche[Fiche 2 — Liaisons usuelles : torseurs, $N_s$, $N_c$][

== Définitions
- $N_(s i)$ : nombre d'*inconnues statiques* indépendantes de la liaison $L_i$ ($N_(s i) <= 6$).
- $N_(c i)$ : nombre d'*inconnues cinématiques* indépendantes (degrés de liberté) de $L_i$ ($N_(c i) <= 6$).

#formule[Propriété fondamentale][
  $ N_s + N_c = 6 quad ("pour toute liaison") $
]
#encadre[interprétation][Une inconnue statique = un effort transmis possible = un degré de liberté *supprimé*. Une inconnue cinématique = un degré de liberté *conservé*. La somme fait toujours 6.]

== Tableau des torseurs (écrits au centre/axe de la liaison)

#table(
  columns: (1.6fr, 1.2fr, 1.2fr, 0.6fr, 0.6fr, 1.4fr),
  align: (left, center, center, center, center, left),
  inset: 5pt, stroke: 0.4pt + luma(150),
  fill: (x, y) => if y == 0 { accentsoft },
  [*Liaison (axe)*], [*Torseur statique*], [*Torseur cinématique*], [$N_s$], [$N_c$], [*Inconnues*],
  [Pivot $(O, vec(z))$], $mat(X, L; Y, M; Z, 0)$, $mat(0, 0; 0, 0; gamma, 0)$, [5], [1], [$X, Y, Z, L, M$],
  [Pivot glissant $(O, vec(x))$], $mat(0, 0; Y, M; Z, N)$, $mat(alpha, u; 0, 0; 0, 0)$, [4], [2], [$Y, Z, M, N$],
  [Glissière $(O, vec(x))$], $mat(0, L; Y, M; Z, N)$, $mat(0, u; 0, 0; 0, 0)$, [5], [1], [$Y, Z, L, M, N$],
  [Hélicoïdale $(O, vec(x))$, pas $p$], $mat(X, k X; Y, M; Z, N)$, $mat(alpha, p dot alpha; 0, 0; 0, 0)$, [5], [1], [$X$ (et $kX$), $Y, Z, M, N$],
  [Linéaire annulaire $(O, vec(x))$], $mat(0, 0; Y, 0; Z, 0)$, $mat(alpha, u; beta, 0; gamma, 0)$, [2], [4], [$Y, Z$],
  [Rotule $(O)$], $mat(X, 0; Y, 0; Z, 0)$, $mat(alpha, u; beta, v; gamma, 0)$, [3], [3], [$X, Y, Z$],
  [Appui plan $(O, vec(x), vec(y))$], $mat(0, L; 0, M; Z, 0)$, $mat(0, u; 0, v; gamma, 0)$, [3], [3], [$Z, L, M$],
)

#text(8.5pt, gray)[Vérification : chaque ligne satisfait $N_s + N_c = 6$. Pour l'hélicoïdale, le moment axial est lié à l'effort axial ($L = k X$, $k$ fonction du pas), donc 5 inconnues indépendantes.]

== Exemple commenté : pivot d'axe $(O, vec(z))$
#grid(columns: (1fr, 1fr), gutter: 8pt,
  [$ lr({tau}) = mat(delim: "{", X, L; Y, M; Z, 0)_O quad N_s = 5 $
   #text(9pt)[La rotation $gamma$ est *libre* : aucun moment $N$ ne peut être transmis autour de $vec(z)$. C'est pourquoi la case $N$ est nulle dans le torseur statique.]],
  [$ lr({V}) = mat(delim: "{", 0, 0; 0, 0; gamma, 0)_O quad N_c = 1 $
   #text(9pt)[Un seul degré de liberté : la rotation $gamma$ autour de $vec(z)$. On a bien $5 + 1 = 6$.]],
)

== Exemple commenté : hélicoïdale d'axe $(O, vec(x))$
#grid(columns: (1fr, 1fr), gutter: 8pt,
  [$ lr({tau}) = mat(delim: "{", X_2, k X_2; Y_2, M_2; Z_2, N_2)_O quad N_s = 5 $],
  [$ lr({V}) = mat(delim: "{", alpha, p dot alpha; 0, 0; 0, 0)_O quad N_c = 1 $],
)
#text(9pt)[La rotation et la translation sont *couplées* par le pas : $u = p dot alpha$. Un seul degré de liberté, donc $N_c = 1$, et $N_s = 5$ car le moment $L$ est proportionnel à $X$ ($L = k X$). *Exemple concret : vis-écrou de vérin, ou la commande du PHR (Fiche 7).*]

#encadre[à retenir][
- Toujours écrire le torseur *au bon point* (centre ou axe de liaison) avant tout calcul.
- $N_s + N_c = 6$ : contrôle rapide de toute ligne du tableau.
- Le choix du point d'écriture conditionne les termes non nuls (moments).
]
]

// =====================================================================
//  FICHE 3 — MÉTHODOLOGIE
// =====================================================================
#fiche[Fiche 3 — Méthodologie : étude des mécanismes][

Hypothèses : *solides indéformables*, *liaisons parfaites*. Un mécanisme = ensemble de solides liés par des liaisons, décrit par un *graphe des liaisons*.

== 1. Liaisons en parallèle (2 solides, $n$ liaisons)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [Statique (PFS sur $S_2$) :
   $ lr({tau_(e q 12)}) = sum lr({tau_i}) = lr({tau_1}) + lr({tau_2}) + dots + lr({tau_n}) $
   #text(9pt)[Le torseur équivalent est la *somme* des torseurs.]],
  [Cinématique :
   $ lr({V_(e q)}) = lr({V_1}) = lr({V_2}) = dots $
   #text(9pt)[Un ddl supprimé dans *une* liaison l'est pour la liaison équivalente (même mouvement relatif pour toutes).]],
)
#formule[Hyperstatisme (parallèle)][
  $ h = N_s - r_s, quad N_s = sum N_(s i), quad r_s <= 6 $
]
où $r_s$ = nombre d'équations statiques indépendantes. Le degré de mobilité de la liaison équivalente vaut $m = 6 - r_s$.

== 2. Liaisons en série — chaîne continue ouverte (CCO)
$n$ solides, $(n-1)$ liaisons isostatiques.
- *Statique* : PFS successifs sur $S_1$, puis $S_1 union S_2$, etc. On en déduit $arrow lr({tau_i}) = lr({0})$ pour chaque liaison : les torseurs se *transmettent* de proche en proche.
- *Cinématique* :
$ lr({V_(e q)}) = lr({V(S_n \/ S_1)}) = sum_i lr({V_i}) quad ("composition des mouvements") $

#encadre[théorème][La liaison équivalente à plusieurs liaisons isostatiques en *série* formant une chaîne ouverte est *toujours isostatique* ($h = 0$).]

Mobilités de la CCO : $m = N_c = sum N_(c i) = m_u + m_i$, où $m_u$ (mobilité utile) = degrés de liberté de la liaison équivalente, $m_i$ = mobilités internes.

== 3. Chaîne continue fermée (CCF)
$n$ solides, $n$ liaisons. La chaîne est refermée sur elle-même :
#formule[Fermeture cinématique][
  $ sum lr({V_i}) = lr({V(S_n \/ S_(n-1))}) + dots + lr({V(S_2 \/ S_1)}) + lr({V(S_1 \/ S_n)}) = lr({0}) $
]
On obtient $r_c$ équations scalaires indépendantes ($r_c <= 6$) pour $N_c$ inconnues :
#formule[Mobilité][
  $ m = N_c - r_c, quad m = m_u + m_i $
]
#formule[Formules de mobilité (CCF)][
  $ "Statique : " h = N_s + m - 6 (n - 1) quad quad "Cinématique : " h = m + 6 - N_c $
]
#text(9pt)[Ces deux formules sont équivalentes (via $N_s + N_c = 6n$). La version cinématique est la plus utilisée : on compte les $N_(c i)$ sur le graphe, on détermine $m$, et on en déduit $h$ directement.]

== 4. Chaîne complexe (plusieurs boucles)
Définitions : $n$ classes d'équivalence, $l$ liaisons. Un *cycle* est une chaîne fermée sans répétition de classe.
#formule[Nombre cyclomatique][
  $ gamma = l - n + 1 quad ("nombre de cycles indépendants") $
]
#formule[Mobilité et hyperstatisme (chaîne complexe)][
  $ m = N_c - r_c quad quad h = 6 gamma - N_c + m $
]
#text(9pt)[Exemples : graphe avec $n = 3$, $l = 4$ : $gamma = 2$ ; graphe avec $n = 4$, $l = 5$ : $gamma = 2$.]

== Méthode générale à l'examen
+ Faire le *schéma cinématique* (plan de projection et points caractéristiques).
+ Tracer le *graphe des liaisons* et annoter chaque liaison ($N_(c i)$ ou $N_(s i)$).
+ Calculer $N_c = sum N_(c i)$ (ou $N_s = sum N_(s i)$).
+ Écrire la fermeture cinématique $sum lr({V_i}) = lr({0})$, dénombrer $r_c$, en déduire $m = N_c - r_c$ (découper en $m_u$ et $m_i$).
+ En déduire $h = 6 gamma - N_c + m$ (une seule boucle : $h = m + 6 - N_c$).
+ *Étude statique* pour identifier les *inconnues hyperstatiques* (isoler un solide, PFS, repérer les inconnues non déterminées).
+ *Proposer une modification* de liaison (ex. pivot $arrow$ rotule) ou des *spécifications géométriques* pour absorber $h$.

#encadre[règle d'or des inconnues hyperstatiques][
Pour identifier les inconnues hyperstatiques en statique : *isoler le solide qui a le moins d'inconnues* (souvent celui qui ne porte qu'une ou deux liaisons), écrire le PFS, et compter les inconnues qu'aucune équation ne permet de déterminer.
]
]

// =====================================================================
//  FICHE 4 — MONTAGE VÉRIN
// =====================================================================
#fiche[Fiche 4 — Exercice corrigé : montage d'un vérin (2 solutions)][

== Énoncé
Un vérin assure la translation d'un *tiroir* en liaison *glissière* de direction $vec(x)$ par rapport au bâti. La tige du vérin est reliée au tiroir par une *linéaire annulaire* :
- *Solution 1* : d'axe $(C, vec(y))$ ;
- *Solution 2* : d'axe $(C, vec(z))$.

Objectif : degré d'hyperstatisme de chaque solution. Chaîne fermée : bâti $arrow$ tiroir $arrow$ tige $arrow$ corps de vérin $arrow$ bâti (4 solides, 4 liaisons, une seule boucle).

== Graphe des liaisons
#align(center, table(
  columns: (auto, auto, auto, auto), align: center, inset: 6pt, stroke: none,
  text(weight: "bold")[Bâti], text(fill: accent)[$L_1$ : glissière $(vec(x))$], text(weight: "bold")[Tiroir], text(fill: accent)[$L_4$ : linéaire annulaire],
  text(fill: accent)[$L_2$ : pivot], "", text(fill: accent)[$L_3$ : pivot glissant],
  text(weight: "bold")[Corps vérin], $arrow$, text(weight: "bold")[Tige],
))
$ N_c = N_(c 1) + N_(c 2) + N_(c 3) + N_(c 4) = 1 + 1 + 2 + 4 quad (N_c = 8 " pour les deux solutions") $

Détail du comptage (les deux solutions ont *le même total*) :
#table(
  columns: (1fr, auto, auto, auto), align: (left, center, center, center), inset: 5pt, stroke: 0.4pt + luma(150),
  fill: (x, y) => if y == 0 { accentsoft },
  [Liaison], [Type], [$N_(c i)$], [$N_(s i)$],
  [$L_1$ bâti-tiroir], [glissière $(vec(x))$], [1], [5],
  [$L_2$ bâti-corps], [pivot], [1], [5],
  [$L_3$ corps-tige], [pivot glissant], [2], [4],
  [$L_4$ tige-tiroir], [linéaire annulaire], [4], [2],
  [*Total*], [], [*8*], [*16*],
)
#text(9pt)[Pour la solution 1, la linéaire annulaire d'axe $(C, vec(y))$ et les orientations des pivots conduisent à $sum N_(s i) = 16$ dans la correction du TD.]

== Solution 1 — linéaire annulaire d'axe $(C, vec(y))$
Fermeture cinématique $sum lr({V_i}) = lr({0})$, écrite en un point commun : on dénombre $r_c = 5$ équations scalaires indépendantes :
$ alpha_2 + alpha_3 = 0, quad beta_2 = 0, quad gamma_1 + gamma_2 = 0, quad u_2 + u_4 = 0, quad ("etc.") $

$ m = N_c - r_c = 8 - 5 = 3 quad ("avec " m_u = 1, m_i = 2) $

#formule[Solution 1][
  $ h = m + 6 - N_c = 3 + 6 - 8 = boxed(1) quad arrow.thick "donc mécanisme hyperstatique de degré 1" $
]
Contrôle statique : $h = N_s + m - 6(n-1) = 16 + 3 - 6(4-1) = boxed(1)$ ✔

*Vérification statique* : les torseurs statiques des liaisons valent ici
$ lr({tau_1}) = mat(delim: "{", x_1, L_1; y_1, M_1; z_1, 0), quad lr({tau_2}) = mat(delim: "{", 0, 0; x_2, M_2; z_2, N_2), quad lr({tau_3}) = mat(delim: "{", x_3, 0; 0, 0; z_3, 0), quad lr({tau_4}) = mat(delim: "{", 0, L_4; y_4, M_4; z_4, N_4) $
soit $sum N_(s i) = 5 + 4 + 2 + 5 = 16$.

== Solution 2 — linéaire annulaire d'axe $(C, vec(z))$
La rotation libre autour de $vec(z)$ devient *interne* : la charge supprime une mobilité interne, donc
$ m_u = 1, quad m_i = 1, quad m = 2 $
#formule[Solution 2][
  $ h = m + 6 - N_c = 2 + 6 - 8 = boxed(0) quad arrow.thick "donc mécanisme isostatique" $
]
#encadre[conclusion][
Le simple changement d'*orientation de la linéaire annulaire* ($(C, vec(y))$ vers $(C, vec(z))$) supprime l'hyperstatisme : la solution 2 est *isostatique*, donc insensible aux défauts de fabrication et de montage. C'est la solution à retenir.
]
]

// =====================================================================
//  FICHE 5 — BRAS DE CHARGEMENT
// =====================================================================
#fiche[Fiche 5 — Exercice corrigé : bras de chargement][

== Énoncé
Bras de chargement : socle fixe, bras horizontal en liaison avec le socle, bras vertical, effecteur. Points caractéristiques :
$ arrow(OA) = (L_1, L_2, 0), quad arrow(OB) = (L_3, L_4, 0), quad arrow(OC) = (L_5, L_6, 0) $

== Graphe des liaisons (chaîne fermée, 4 solides / 4 liaisons)
#align(center, table(
  columns: (auto, auto, auto), align: center, inset: 5pt, stroke: none,
  text(weight: "bold")[Socle 0], text(fill: accent)[→ pivot glissant $(A, vec(x))$], text(weight: "bold")[Bras 1],
  text(fill: accent)[→ rotule $(D)$], text(fill: accent)[→ pivot $(B, vec(z))$],
  text(weight: "bold")[Bâti], text(fill: accent)[pivot glissant], text(weight: "bold")[Bras 2],
))
D'après la correction (liaisons comptées dans le TD) : $N_c = 5$.

== Degré d'hyperstatisme (étude cinématique)
$ m_u = 1, quad m_i = 0, quad arrow quad m = 1 $
#formule[Résultat][
  $ h = m + 6 - N_c = 1 + 6 - 5 = boxed(2) quad arrow.thick "mécanisme hyperstatique de degré 2" $
]

== Inconnues hyperstatiques (étude statique)
On isole le solide qui a le *moins d'inconnues*. Le PFS fournit un système dont certaines inconnues restent indéterminées :
+ 1ère inconnue hyperstatique : une composante en $Z$ (effort axial), parmi $Z_1$ ou $Z_2$ ou $Z_3$ ou $Z_4$, ou un moment $L_i$ ;
+ 2ème inconnue hyperstatique : un moment en $M$ (flexion), parmi $M_1$ ou $M_2$ ou $M_3$ ou $M_4$.

(Transfert de moment utile au point de réduction : $M(B) L_4 = M(C) L_4 + arrow(BC) wedge vec(R)$ — l'écriture des moments en différents points utilise *BABAR*, Fiche 1.)

== Rendre le mécanisme isostatique
#encadre[solution proposée][
On choisit $L_3 = 0$ et $M_3 = 0$ dans le torseur de la liaison pivot d'axe $(B, vec(z))$ : on la remplace par une *rotule de centre C*. Deux inconnues statiques supprimées $arrow h = 0$ : le mécanisme devient *isostatique*.
]

*Remarque (variante du TD)* : si l'on place le point B sur l'axe du vérin, avec $N_c = 7$ et $m = m_u + m_i = 1 + 1 = 2$ :
$ h = 6 + m - N_c = 6 + 2 - 7 = boxed(1) quad ("hyperstatique de degré 1") $
]

// =====================================================================
//  FICHE 6 — MANIPULATEUR (GUIDAGE)
// =====================================================================
#fiche[Fiche 6 — Exercice corrigé : guidage en translation du manipulateur][

== Contexte
Manipulateur combinant translation et rotation avec un *seul moteur* (rails + patins *Bosch Rexroth* : rail acier T15, patins R1621 series SNS). Le guidage en translation est réalisé par *deux glissières de direction $(A, vec(x))$ et $(B, vec(x))$ en parallèle* entre le coulisseau (1) et le bâti (0).

#croquis(hauteur: 90pt)[
  // bâti hachuré
  #hach(20pt, 55pt, 260pt, 12pt)
  #lab(2pt, 48pt, "Bâti (0)")
  // patins/glissières
  #barre(40pt, 55pt, 70pt, h: 5pt); #lab(45pt, 30pt, "glissière $(A, vec(x))$")
  #barre(190pt, 55pt, 70pt, h: 5pt); #lab(195pt, 30pt, "glissière $(B, vec(x))$")
  // coulisseau
  #solide(30pt, 15pt, 240pt, 22pt); #lab(115pt, 20pt, "Coulisseau (1)")
  // axe x
  #barre(280pt, 25pt, 15pt); #place(dx: 296pt, dy: 18pt, polygon(fill: black, (0pt,0pt), (0pt,10pt), (8pt,5pt)))
  #lab(300pt, 30pt, $vec(x)$)
]

== Degré d'hyperstatisme
Deux liaisons glissière de même direction $vec(x)$, en *parallèle* :
$ N_c = N_(c 1) + N_(c 2) = 2 + 2 = 4 quad ("ou " N_c = 2 " ddl utiles comptés dans la correction") $
D'après la correction : $N_c = 2$ (les deux translations $u_1, u_2$ sont confondues en une seule mobilité utile), $m_u = 1$, $m_i = 0$, donc $m = 1$ :
#formule[Résultat][
  $ h = m + 6 - N_c = 1 + 6 - 2 = boxed(5) quad arrow.thick "montage hyperstatique de degré 5" $
]
#text(9pt)[Un guidage par deux rails est *très* hyperstatique : c'est le prix à payer pour la rigidité. Les 5 inconnues doivent être *absorbées par la fabrication*.]

== Identification des inconnues hyperstatiques
On isole le coulisseau (1) ; les torseurs des deux liaisons, réduits au même point, donnent :
$ lr({tau_1}) = mat(delim: "{", 0, L_1; Y_1, M_1; Z_1, N_1), quad lr({tau_2}) = mat(delim: "{", 0, L_2; Y_2, M_2; Z_2, N_2) $
$ lr({tau_1}) + lr({tau_2}) = lr({0}) arrow cases(Y_1 + Y_2 = 0 & Z_1 + Z_2 = 0 & L_1 + L_2 = 0 & M_1 + M_2 = 0 & N_1 + N_2 = 0) $
Cinq paires d'efforts ne peuvent pas être séparées : $h = 5$, soit 5 inconnues hyperstatiques.

== Comment l'industrie absorbe ces 5 inconnues
#encadre[cotes et spécifications][
+ $Y_1$ ou $Y_2$ (position transversale) -> *cote dimensionnelle* entre les deux rails (ex. $35 +0\/05$) ;
+ $Z_1$ ou $Z_2$ (hauteur de rail) -> cote dimensionnelle de hauteur ;
+ $L_1$ ou $L_2$ (moment de tangage) -> *spécification géométrique* de parallélisme ;
+ $M_1$ ou $M_2$ (moment de roulis) -> perpendicularité / parallélisme des surfaces de pose ;
+ $N_1$ ou $N_2$ (moment de lacet) -> parallélisme des axes des deux rails dans le plan $(0, vec(x), vec(y))$.
]
#text(9pt)[Règle générale : les inconnues *en effort* ($X, Y, Z$) sont maîtrisées par des *cotes dimensionnelles* ; les inconnues *en moment* ($L, M, N$) par des *spécifications géométriques* (parallélisme, perpendicularité). On retrouve ces spécifications sur le dessin de définition du palier.]
]

// =====================================================================
//  FICHE 7 — PHR A340
// =====================================================================
#fiche[Fiche 7 — Exercice corrigé : commande du PHR de l'Airbus A340][

== Présentation
Le *Plan Horizontal Réglable* (PHR) est une mini-aile à l'arrière du fuselage : orienter le PHR autour de $(B, arrow(x))$ réduit la poussée nécessaire et *économise du carburant*. Une vis (4), animée en rotation par une motorisation, utilise une *liaison hélicoïdale* et la pièce (6) pour orienter le PHR (7).

Schéma : fuselage (bâti), vis (4) en pivot, écrou/pièce (6), PHR (7) articulé en B.

== Graphe des liaisons (chaîne fermée)
D'après la correction, les liaisons sont :
#table(
  columns: (auto, auto, auto), align: (left, center, center), inset: 5pt, stroke: 0.4pt + luma(150),
  fill: (x, y) => if y == 0 { accentsoft },
  [Liaison], [Entre solides], [$N_(c i)$],
  [$L_1$ : pivot d'axe $(0, vec(x))$], [(0)-(2)], [1],
  [$L_2$ : pivot d'axe $(0, vec(x))$], [(0)-(3)], [1],
  [$L_3$ : pivot d'axe $(0, vec(x))$], [(0)-(5)], [1],
  [$L_4$ : pivot d'axe $(0, vec(x))$], [(0)-(6)], [1],
  [$L_5$ : hélicoïdale d'axe $(A, vec(x))$], [(4)/(6)], [1],
  [*Total*], [], [*$N_c = 5$*],
)

== Mobilités (fermeture cinématique)
$ sum_(i=1)^5 lr({V_i}) = lr({0}) quad arrow quad r_c = 4 "équations indépendantes" $
(on utilise la composition : $V_0 (L_4) = V_C (L_4) + arrow(OC) wedge omega_4$, avec $arrow(OC)$ porté par $vec(y)$)
#formule[Mobilité][
  $ m = N_c - r_c = 5 - 4 = boxed(1) quad (m_u = 1, m_i = 0) $
]
Il n'y a qu'*une seule mobilité utile* : la rotation de la vis commande seule l'orientation du PHR.

== Degré d'hyperstatisme
#formule[Résultat][
  $ h = 6 + m - N_c = 6 + 1 - 5 = boxed(2) quad arrow.thick "mécanisme hyperstatique de degré 2" $
]

== Inconnues hyperstatiques (étude statique)
On isole successivement et on écrit le PFS ; par exemple pour un solide soumis aux liaisons $L_1$ et $L_2$ :
$ cases(x_1 + x_2 = 0 & y_1 + y_2 = 0 & z_1 + z_2 = 0 & L_2 = 0 & M_1 + M_2 = 0 & N_1 = 0) $
Les systèmes se révèlent insuffisants pour déterminer toutes les composantes : il reste *2 inconnues hyperstatiques*, de type :
+ effort/moments d'alignement des pivots (une composante d'effort indéterminée entre deux pivots voisins) ;
+ un moment de flexion autour de $vec(z)$ non déterminé.

#encadre[solution classique][Remplacer *un pivot par une rotule* (on supprime 2 moments $arrow$ $N_s$ baisse de 2) : le mécanisme devient *isostatique*. En aéronautique, on conserve souvent l'hyperstatisme pour la rigidité et on l'absorbe par des *spécifications géométriques* (coaxialité des paliers de la vis).]
]

// =====================================================================
//  MÉMO FINAL
// =====================================================================
#fiche[Mémo final — l'essentiel en 10 lignes][
+ $N_s + N_c = 6$ pour toute liaison.
+ BABAR : $vec(M)_B = vec(M)_A + arrow(BA) wedge vec(R)$ ; cinématique : $vec(V)_C = vec(V)_A + arrow(CA) wedge vec(Omega)$.
+ Produit vectoriel : *règle du gamma*, ligne barrée, ligne des $x$ descendue pour la composante en $y$.
+ Parallèle : $lr({tau_(e q)}) = sum lr({tau_i})$, $h = N_s - r_s$.
+ Série ouverte (CCO) : liaison équivalente *toujours isostatique* ; $m = sum N_(c i) = m_u + m_i$.
+ Fermée (CCF) : $sum lr({V_i}) = lr({0})$, $m = N_c - r_c$, $h = m + 6 - N_c = N_s + m - 6(n-1)$.
+ Complexe : $gamma = l - n + 1$, $h = 6 gamma - N_c + m$.
+ $h > 0$ : hyperstatique (rigide mais sensible aux défauts) ; $h = 0$ : isostatique.
+ Inconnues hyperstatiques : isoler le solide avec le *moins d'inconnues*, PFS, repérer les indéterminées.
+ Efforts indéterminés $arrow$ *cotes dimensionnelles* ; moments indéterminés $arrow$ *spécifications géométriques*.
]

// ---------------------------------------------------------------------
// NOTE : pour insérer les figures de ton cours scanné, décommente et
// adapte :  #image("figs/solution1.png", width: 80%)
// (place les images extraites des PDF dans un dossier "figs" local)
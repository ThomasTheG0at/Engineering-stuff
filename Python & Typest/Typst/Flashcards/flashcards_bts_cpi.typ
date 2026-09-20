#import "template.typ": flashcards

#let cards = (
  // ======================= ACTIONS MÉCANIQUES =======================
  (
    id: "AM-01",
    topic: "Moment d'une force par rapport à un point",
    included: true,
    formule: [
      $ bold(M)_B (bold(F)) = bold(B A) and bold(F) $
      $ norm(bold(M)_B (bold(F))) = norm(bold(F)) dot.op d $
    ],
    explication: [
      Vecteur d'origine $B$, perpendiculaire à $bold(B A)$ et à $bold(F)$, sens tel que
      $(bold(B A), bold(F), bold(M)_B)$ soit une base directe. $d$ : bras de levier. Unité : N·m.
    ],
  ),
  (
    id: "AM-02",
    topic: "Couple (moment pur)",
    included: true,
    formule: [
      $ bold(F)_A + bold(F)_B = bold(0) $
      $ bold(M)_O (bold(F)_A) + bold(M)_O (bold(F)_B) = -F dot.op L dot.op bold(z) $
    ],
    explication: [
      Deux forces opposées $bold(F)_A = -bold(F)_B = bold(F)$ avec $O A = O B = L slash 2$
      (exemple du taraudage) : résultante nulle mais moment non nul.
    ],
  ),
  (
    id: "AM-03",
    topic: "Torseur d'une action mécanique",
    included: true,
    formule: [
      $ \{tau_(2 -> 1)\} = mat(delim: "{", X_21, L_21; Y_21, M_21; Z_21, N_21)_A $
    ],
    explication: [
      Gauche : composantes de la résultante $bold(R)_(2 -> 1)$. Droite : composantes du moment
      résultant en $A$ (centre de réduction). Les deux sont projetés dans la base $(bold(x), bold(y), bold(z))$.
    ],
  ),
  (
    id: "AM-04",
    topic: "Torseur glisseur et torseur couple",
    included: true,
    formule: [
      $ "glisseur" : bold(R) != bold(0) quad bold(M)_A = bold(0) $
      $ "couple" : bold(R) = bold(0) quad bold(M) != bold(0) $
    ],
    explication: [
      Glisseur : moment nul au point $A$ (une force). Couple : résultante nulle, et les éléments
      de réduction sont les mêmes en tout point.
    ],
  ),
  (
    id: "AM-05",
    topic: "Changement de centre de réduction",
    included: true,
    formule: [
      $ bold(M)_(B, 2 -> 1) = bold(M)_(A, 2 -> 1) + bold(B A) and bold(R)_(2 -> 1) $
    ],
    explication: [
      La résultante ne change pas, le moment se transporte avec le bras de levier $bold(B A)$.
      À faire avant d'additionner des torseurs exprimés en des points différents.
    ],
  ),
  (
    id: "AM-06",
    topic: "Somme de deux torseurs",
    included: true,
    formule: [
      $ \{tau_(2 -> 1)\} + \{tau_(3 -> 1)\} $
      $ = mat(delim: "{", bold(R)_(2 -> 1) + bold(R)_(3 -> 1); bold(M)_(A, 2 -> 1) + bold(M)_(A, 3 -> 1))_A $
    ],
    explication: [
      Même centre de réduction, même base et unités compatibles. Sinon, changement de centre
      de réduction d'abord.
    ],
  ),
  (
    id: "AM-07",
    topic: "Action mécanique de la pesanteur",
    included: true,
    formule: [
      $ \{tau_(T -> S)\} = mat(delim: "{", bold(P) = m dot.op bold(g); bold(M)_(G, T -> S) = bold(0))_G $
      $ bold(g) = -g dot.op bold(y) $
    ],
    explication: [
      Action à distance de la Terre sur un solide $S$ de masse $m$, appliquée au centre de gravité $G$
      (glisseur). $g$ en m/s², $P$ en N, $m$ en kg.
    ],
  ),
  (
    id: "AM-08",
    topic: "Pression d'un fluide",
    included: true,
    formule: [
      $ bold(F) = p dot.op S dot.op bold(n) $
      $ \{tau_(f -> S)\} = mat(delim: "{", bold(F); bold(0))_A $
    ],
    explication: [
      Glisseur au centre $A$ de la surface $S$, $bold(n)$ orientée vers le fluide. SI : Pa, m², N.
      Autre : MPa, mm², N, avec 0,1 MPa = 1 bar.
    ],
  ),
  (
    id: "AM-09",
    topic: "Action d'un ressort",
    included: true,
    formule: [
      $ bold(F) = -k dot.op Delta L = -k (L - L_0) $
      $ bold(M)_A = bold(0) $
    ],
    explication: [
      Effort porté par l'axe du ressort. $k$ : raideur en N/m, $L_0$ : longueur libre en m.
    ],
  ),
  (
    id: "AM-10",
    topic: "Raideur équivalente",
    included: true,
    formule: [
      $ 1 / k = 1 / k_1 + 1 / k_2 + dots.c + 1 / k_n $
      $ k = k_1 + k_2 + dots.c + k_n $
    ],
    explication: [
      Première formule : ressorts montés en série. Seconde : ressorts montés en parallèle.
    ],
  ),
  (
    id: "AM-11",
    topic: "Liaison pivot parfaite d'axe (A, x)",
    included: true,
    formule: [
      $ \{tau_(2 -> 1)\} = mat(delim: "{", X_21, 0; Y_21, M_21; Z_21, N_21)_A $
    ],
    explication: [
      Rotation libre autour de $x$ donc pas de moment selon $x$. Liaison parfaite : volumes parfaits,
      sans jeu, sans frottement. Une composante n'existe que s'il y a un obstacle dans cette direction.
    ],
  ),
  (
    id: "AM-12",
    topic: "Problème plan (plan de symétrie)",
    included: true,
    formule: [
      $ mat(delim: "{", X_21, L_21; Y_21, M_21; Z_21, N_21) arrow.r mat(delim: "{", X_21, 0; Y_21, 0; 0, N_21) $
    ],
    explication: [
      Contact et actions extérieures symétriques par rapport au plan $(A, bold(x), bold(y))$ : on passe de
      6 à 3 inconnues (résultante dans le plan, moment selon la normale).
    ],
  ),

  // ======================= STATIQUE ET FROTTEMENT =======================
  (
    id: "ST-01",
    topic: "Principe fondamental de la statique",
    included: true,
    formule: [
      $ sum \{tau_("ext" -> S)\} = \{0\} $
      $ sum bold(F)_"ext" = bold(0) quad sum bold(M)_A = bold(0) $
    ],
    explication: [
      Théorème de la résultante (projections) et théorème du moment (en un point). Sur la pince :
      $X_B - X_C = 0$ et $-m g = 0$ est impossible, il faut revoir le modèle (frottement).
    ],
  ),
  (
    id: "ST-02",
    topic: "Loi de Coulomb",
    included: true,
    formule: [
      $ tan phi = T / N $
      $ T = f dot.op N quad f = tan phi $
    ],
    explication: [
      $N$ : effort normal, $T$ : effort tangentiel, $f$ : coefficient de frottement. $phi$ est le demi-angle
      au sommet du cône de frottement.
    ],
  ),
  (
    id: "ST-03",
    topic: "Adhérence, limite et glissement",
    included: true,
    formule: [
      $ alpha < phi_s : quad T < f_s dot.op N $
      $ alpha = phi_s : quad T = f_s dot.op N $
      $ alpha = phi : quad T = f dot.op N $
    ],
    explication: [
      Adhérence : la force est à l'intérieur du cône. Équilibre limite : sur le bord du cône d'adhérence.
      Glissement : sur le cône de frottement, $T$ s'oppose au mouvement.
    ],
  ),
  (
    id: "ST-04",
    topic: "Coefficients d'adhérence et de frottement",
    included: true,
    formule: [
      $ f_s = tan phi_s quad f = tan phi $
    ],
    explication: [
      Ils dépendent des matériaux, de la rugosité et de la lubrification, pas des efforts ni de la surface.
      Acier sur acier à sec : $f_s = 0.18$, $f = 0.15$ ; lubrifié : $0.12$ et $0.09$.
    ],
  ),
  (
    id: "ST-05",
    topic: "Non basculement sur un plan horizontal",
    included: true,
    formule: [
      $ d = l / 2 - a dot.op f $
      $ a < l / (2 f) $
    ],
    explication: [
      Moment en $C$ : $-N d - F a + P l slash 2 = 0$, avec $F = T = f N$ et $N = P$. Pas de basculement
      si $d > 0$. $a$ : hauteur de la force, $l$ : largeur.
    ],
  ),
  (
    id: "ST-06",
    topic: "Non basculement sur un plan incliné",
    included: true,
    formule: [
      $ tan alpha = l / h $
      $ l / h > tan alpha $
    ],
    explication: [
      Adhérence si $alpha <= phi$, glissement si $alpha > phi$. À la limite du basculement, l'action passe
      par $C$ donc $alpha = phi$ : la seconde formule est la condition de non basculement.
    ],
  ),

  // ======================= THÉORIE DES MÉCANISMES =======================
  (
    id: "TM-01",
    topic: "Inconnues statiques et cinématiques",
    included: true,
    formule: [
      $ N_s + N_c = 6 $
      $ "pivot" : N_s = 5 quad N_c = 1 $
    ],
    explication: [
      $N_c$ : inconnues cinématiques (degrés de liberté), $N_s$ : inconnues statiques (degrés de liaison).
      Supprimer un degré de liberté ajoute une composante au torseur d'actions transmissibles.
    ],
  ),
  (
    id: "TM-02",
    topic: "Liaison hélicoïdale",
    included: true,
    formule: [
      $ L_12 = X_12 dot.op p / (2 pi) $
      $ u = alpha dot.op p / (2 pi) $
    ],
    explication: [
      La translation et la rotation sont liées par le pas $p$ : $N_c = 1$ et $N_s = 5$.
    ],
  ),
  (
    id: "TM-03",
    topic: "Nombre cyclomatique",
    included: true,
    formule: [
      $ gamma = l - n + 1 $
    ],
    explication: [
      $l$ : nombre de liaisons (arcs du graphe), $n$ : nombre de solides. Graphe ouvert : $l = n - 1$,
      toujours isostatique. Un cycle : $l = n$. Exemple : $14 - 9 + 1 = 6$.
    ],
  ),
  (
    id: "TM-04",
    topic: "Hyperstatisme : approche statique",
    included: true,
    formule: [
      $ h = (m_u + m_i) + sum N_s - 6 (n - 1) $
    ],
    explication: [
      $m_u$ : mobilités utiles, $m_i$ : mobilités internes, $N_s$ : inconnues statiques de chaque liaison,
      $n$ : nombre de pièces. $h = 0$ : isostatique.
    ],
  ),
  (
    id: "TM-05",
    topic: "Hyperstatisme : approche cinématique",
    included: true,
    formule: [
      $ h = (m_u + m_i) + 6 gamma - sum N_c $
    ],
    explication: [
      Même résultat par l'approche cinématique. Pompe hydraulique (1 piston) :
      $h = (1 + 2) + (5 + 3 + 3 + 4) - 6 (4 - 1) = 0$.
    ],
  ),
  (
    id: "TM-06",
    topic: "Liaison composée",
    included: true,
    formule: [
      $ N_S = sum_(i = 1)^p n_(s, i) $
      $ h = m - 6 + N_S $
    ],
    explication: [
      Rotule + linéaire annulaire : $3 + 2 = 5$, $h = 0$ (isostatique). Deux rotules ou rotule + appui plan :
      $3 + 3 = 6$, $h = 1$ (hyperstatique).
    ],
  ),
  (
    id: "TM-07",
    topic: "Liaisons équivalentes en parallèle",
    included: true,
    formule: [
      $ \{tau_"eq"\} = sum_(i = 1)^n \{tau_(L_i)\} $
      $ \{theta.alt_"eq"\} = \{theta.alt_1\} = dots.c = \{theta.alt_n\} $
    ],
    explication: [
      Statique : on additionne les actions transmissibles. Cinématique : seuls les mouvements possibles
      pour toutes les liaisons à la fois. Torseurs écrits au même point.
    ],
  ),
  (
    id: "TM-08",
    topic: "Liaisons équivalentes en série",
    included: true,
    formule: [
      $ \{tau_"eq"\} = \{tau_1\} = dots.c = \{tau_n\} $
      $ \{theta.alt_"eq"\} = sum_(i = 1)^n \{theta.alt_(L_i)\} $
    ],
    explication: [
      À l'inverse du parallèle : statique = actions transmissibles simultanément par toutes les liaisons,
      cinématique = somme des mouvements de chaque liaison.
    ],
  ),
  (
    id: "TM-09",
    topic: "Exemple : rotule et linéaire annulaire",
    included: true,
    taille: 16pt,
    formule: [
      $ bold(M)_B = bold(M)_A + bold(B A) and bold(R)_A $
      $ \{tau_(1 slash 2)\} = mat(delim: "{", X_B, 0; Y_A + Y_B, l Z_A; Z_A + Z_B, -l Y_A)_B $
    ],
    explication: [
      Linéaire annulaire en $A$ ($Y_A$, $Z_A$) et rotule en $B$, distance $l$ : on ramène tout en $B$
      ($bold(B A) and bold(R)_A = (0, l Z_A, -l Y_A)$), puis on additionne. Résultat : pivot d'axe $(B, bold(x))$.
    ],
  ),
  (
    id: "TM-10",
    topic: "Exemple : appui plan et rotule en série",
    included: true,
    formule: [
      $ \{tau_(1 slash 6)\} = mat(delim: "{", 0, 0; Y, 0; 0, 0)_A $
    ],
    explication: [
      On garde ce qui est transmissible par les deux liaisons à la fois (série, statique). Résultat :
      liaison ponctuelle d'axe $(A, bold(y))$, avec $N_s = 1$.
    ],
  ),
  (
    id: "TM-11",
    topic: "Isostatique ou hyperstatique",
    included: true,
    taille: 12.5pt,
    formule: [
      #set align(left)
      *Isostatique* : le PFS suffit, aucune spécification précise à respecter, montage facile, moins rigide.

      *Hyperstatique* : le PFS ne suffit plus (RDM), tolérances géométriques serrées (coaxialité...),
      plus de rigidité et de précision, suppression des jeux.
    ],
    explication: [
      Pour respecter un montage hyperstatique de degré $h$ : imposer $h$ conditions géométriques
      ou ajouter $h$ degrés de liberté (jeux).
    ],
  ),

  // ======================= LIAISONS NORMALISÉES =======================
  (
    id: "LI-01",
    topic: "Liaisons normalisées (1/2)",
    included: true,
    taille: 13pt,
    formule: [
      #table(
        columns: (3.9cm, 1.2cm, 1.3cm, 0.9cm, 0.9cm), align: center + horizon, inset: (x: 4pt, y: 2pt), stroke: 0.4pt + luma(150),
        [*Liaison*], [*T*], [*R*], [*$N_c$*], [*$N_s$*],
        [Encastrement], [0], [0], [0], [6],
        [Pivot], [0], [1], [1], [5],
        [Glissière], [1], [0], [1], [5],
        [Hélicoïdale], [1+1], [(liées)], [1], [5],
        [Pivot glissant], [1], [1], [2], [4],
        [Sphér. à doigt], [0], [2], [2], [4],
      )
    ],
    explication: [
      $T$ : translations, $R$ : rotations, $N_c$ : degrés de liberté, $N_s = 6 - N_c$.
    ],
  ),
  (
    id: "LI-02",
    topic: "Liaisons normalisées (2/2)",
    included: true,
    taille: 13pt,
    formule: [
      #table(
        columns: (3.9cm, 1.2cm, 1.3cm, 0.9cm, 0.9cm), align: center + horizon, inset: (x: 4pt, y: 2pt), stroke: 0.4pt + luma(150),
        [*Liaison*], [*T*], [*R*], [*$N_c$*], [*$N_s$*],
        [Rotule], [0], [3], [3], [3],
        [Appui plan], [2], [1], [3], [3],
        [Linéaire rectiligne], [2], [2], [4], [2],
        [Linéaire annulaire], [1], [3], [4], [2],
        [Ponctuelle], [2], [3], [5], [1],
      )
    ],
    explication: [
      Linéaire annulaire = sphère-cylindre, ponctuelle = sphère-plan. $N_s + N_c = 6$ pour chaque liaison.
    ],
  ),

  // ======================= CINÉMATIQUE =======================
  (
    id: "CI-01",
    topic: "Mouvement uniformément varié",
    included: true,
    formule: [
      $ V = V_0 + a t quad x = x_0 + V_0 t + 1 / 2 a t^2 $
      $ V^2 = V_0^2 + 2 a (x - x_0) $
    ],
    explication: [
      Accélération $a$ constante. Si $a = 0$ : mouvement uniforme, $V = V_0$ et $x = x_0 + V_0 t$.
    ],
  ),
  (
    id: "CI-02",
    topic: "Vitesse en translation et en rotation",
    included: true,
    formule: [
      $ V = d / t quad t = d / V $
      $ V = R dot.op omega quad omega = (2 pi N) / 60 $
    ],
    explication: [
      $N$ en tr/min, $omega$ en rad/s, $R$ en m. On a aussi $V slash R = omega$.
    ],
  ),
  (
    id: "CI-03",
    topic: "Vitesse de glissement d'un palier",
    included: true,
    formule: [
      $ V_g = omega dot.op R $
    ],
    explication: [
      $V_g$ : vitesse linéaire de glissement en m/s, $omega$ : vitesse angulaire de l'arbre en rad/s,
      $R$ : rayon de l'arbre en m. Si $N$ est en tr/min : $omega = 2 pi N slash 60$.
    ],
  ),
  (
    id: "CI-04",
    topic: "Bielle-manivelle : loi entrée-sortie",
    included: true,
    formule: [
      $ x = R cos theta + l cos beta $
      $ x = R cos theta + sqrt(l^2 - R^2 sin^2 theta) $
    ],
    explication: [
      Loi géométrique entre l'entrée $theta$ et la sortie $x$. On élimine $beta$ avec
      $R sin theta = -l sin beta$.
    ],
  ),

  // ======================= PUISSANCE ET ÉNERGIE =======================
  (
    id: "PU-01",
    topic: "Puissance",
    included: true,
    formule: [
      $ P = C dot.op omega quad C = P / omega $
      $ P = F dot.op V dot.op cos alpha $
    ],
    explication: [
      Puissance en W d'un couple (rotation) ou d'une force (translation), $alpha$ étant l'angle entre la force
      et la vitesse.
    ],
  ),
  (
    id: "PU-02",
    topic: "Travail d'une force et d'un couple",
    included: true,
    formule: [
      $ W = F dot.op d quad W = C dot.op theta $
      $ P_"ch" = P_"W" / 736 $
    ],
    explication: [
      Le travail se calcule avec la distance $d$ (force) ou l'angle $theta$ en rad (couple).
      1 cheval (ch) = 736 W.
    ],
  ),
  (
    id: "PU-03",
    topic: "Rendement",
    included: true,
    formule: [
      $ eta = P_u / P_a = P_s / P_e $
    ],
    explication: [
      Rapport de la puissance utile (ou de sortie) sur la puissance absorbée (ou d'entrée).
      Il est toujours inférieur à 1.
    ],
  ),
  (
    id: "PU-04",
    topic: "Dynamique, énergie cinétique, poids",
    included: true,
    formule: [
      $ sum bold(F)_"ext" = m dot.op bold(a) $
      $ E_c = 1 / 2 m V^2 quad P = m dot.op g $
    ],
    explication: [
      PFD en translation, énergie cinétique d'une masse $m$ à la vitesse $V$, et poids $P$ (en N).
    ],
  ),
  (
    id: "PU-05",
    topic: "Pression et effort",
    included: true,
    formule: [
      $ F = p dot.op S quad p = F / S $
    ],
    explication: [
      $p$ en MPa, $S$ en mm², $F$ en N (ou Pa, m², N en SI). 1 bar = 0,1 MPa.
    ],
  ),
  (
    id: "PU-06",
    topic: "Débit et section",
    included: true,
    formule: [
      $ V = q_v / S $
      $ S = (pi D^2) / 4 quad S = (pi (D^2 - d^2)) / 4 $
    ],
    explication: [
      $q_v$ : débit volumique en m³/s. Section pleine (piston) et section en couronne (côté tige d'un vérin).
    ],
  ),
  (
    id: "PU-07",
    topic: "Trigonométrie du triangle rectangle",
    included: true,
    formule: [
      $ sin beta = "Opp" / "Hyp" quad cos beta = "Adj" / "Hyp" $
      $ tan beta = "Opp" / "Adj" $
    ],
    explication: [
      Opp : côté opposé à l'angle $beta$, Adj : côté adjacent, Hyp : hypoténuse.
    ],
  ),
  (
    id: "PU-08",
    topic: "Projection d'une force",
    included: true,
    formule: [
      $ F_x = F cos alpha quad F_y = F sin alpha $
      $ F = sqrt(F_x^2 + F_y^2) $
    ],
    explication: [
      Composantes d'une force $F$ inclinée de $alpha$ par rapport à l'axe $x$, et retour à la norme.
    ],
  ),

  // ======================= RDM =======================
  (
    id: "RM-01",
    topic: "Torseur de cohésion",
    included: true,
    formule: [
      $ \{tau_"coh"\} = mat(delim: "{", N, M_t; T_y, M_(f y); T_z, M_(f z))_G $
    ],
    explication: [
      $N$ : traction ($N > 0$) ou compression ($N < 0$). $T_y$, $T_z$ : cisaillement. $M_t$ : torsion.
      $M_(f y)$, $M_(f z)$ : flexion.
    ],
  ),
  (
    id: "RM-02",
    topic: "Traction : contrainte normale",
    included: true,
    formule: [
      $ sigma = N / S $
    ],
    explication: [
      Répartition uniforme des contraintes. Exemple du tirant : $N = 62000$ N, $d = 20$ mm donc
      $S = pi times 20^2 slash 4 = 314$ mm² et $sigma = 197$ MPa.
    ],
  ),
  (
    id: "RM-03",
    topic: "Condition de résistance en traction",
    included: true,
    formule: [
      $ sigma_"maxi" <= R_(p e) = R_e / s $
    ],
    explication: [
      $R_(p e)$ : résistance pratique à l'extension. Tirant avec $R_e = 300$ MPa et $s = 3$ :
      $R_(p e) = 100$ MPa donc $d >= 28.1$ mm.
    ],
  ),
  (
    id: "RM-04",
    topic: "Déformation unitaire",
    included: true,
    formule: [
      $ epsilon = (Delta L) / L_0 = (Delta x) / x_0 $
    ],
    explication: [
      Allongement relatif. Exemple : le tirant de 2800 mm s'allonge de 4 mm, donc $epsilon = 4 slash 2800 = 0.00143$,
      soit 1,43 mm par mètre.
    ],
  ),
  (
    id: "RM-05",
    topic: "Loi de Hooke",
    included: true,
    formule: [
      $ sigma = E dot.op epsilon $
      $ Delta L = epsilon dot.op L $
    ],
    explication: [
      $E$ : module de Young (200 000 MPa pour l'acier). Exemple : $sigma = 100$ MPa donne
      $epsilon = 0.0005$ et $Delta L = 1.4$ mm sur 2,8 m.
    ],
  ),
  (
    id: "RM-06",
    topic: "Concentration de contraintes",
    included: true,
    formule: [
      $ sigma_"maxi" = sigma_0 dot.op K_t $
    ],
    explication: [
      $sigma_0 = F slash S$ est la contrainte uniforme. $K_t$ se lit sur des abaques en fonction de
      $r slash d$ et $D slash d$ : un plus grand rayon de congé réduit $K_t$.
    ],
  ),
  (
    id: "RM-07",
    topic: "Essai de traction",
    included: true,
    taille: 13pt,
    formule: [
      #set align(left)
      $sigma <= R_e$ : zone élastique (retour à l'état initial)

      $R_e < sigma <= R_r$ : déformation plastique permanente

      Rupture pour $sigma = R_r$
    ],
    explication: [
      $R_e$ : limite élastique, $R_r$ : résistance à la rupture. La pente de la zone élastique est le module $E$.
    ],
  ),
  (
    id: "RM-08",
    topic: "Cisaillement simple",
    included: true,
    formule: [
      $ tau_"moy" = norm(bold(T)) / S $
      $ tau = G dot.op gamma quad G = E / (2 (1 + nu)) $
    ],
    explication: [
      Cisaillement pur impossible : on utilise la contrainte moyenne. $gamma = Delta y slash Delta x$.
      $G$ (module de Coulomb) : acier 80 000 MPa, fonte 40 000 MPa.
    ],
  ),
  (
    id: "RM-09",
    topic: "Condition de résistance au cisaillement",
    included: true,
    formule: [
      $ tau_"subie" <= R_(p g) = R_(e g) / s $
    ],
    explication: [
      $R_(e g)$ : limite élastique au glissement. Aciers : $R_(e g) = 0.5 R_e$ (doux, $R_e < 270$),
      $0.7 R_e$ (mi-durs, $R_e < 500$), $0.8 R_e$ (durs, $R_e > 500$ MPa).
    ],
  ),
  (
    id: "RM-10",
    topic: "Condition de rupture (goupille, poinçonnage)",
    included: true,
    formule: [
      $ tau_"subie" >= R_(r g) $
    ],
    explication: [
      Pour casser volontairement (goupille de sécurité, découpage d'une tôle) : $R_(r g) = 0.5 R_r$ (doux),
      $0.7 R_r$ (mi-durs), $0.8 R_r$ (durs).
    ],
  ),
  (
    id: "RM-11",
    topic: "Flexion : contrainte et sécurité",
    included: true,
    formule: [
      $ sigma_"maxi" = M_(f z) / I_(G z) dot.op y $
      $ s = R_e / sigma_"maxi" $
    ],
    explication: [
      $y$ : distance à la fibre neutre (contrainte maximale sur la fibre la plus éloignée).
      $s$ : coefficient de sécurité obtenu.
    ],
  ),
  (
    id: "RM-12",
    topic: "Moments quadratiques usuels",
    included: true,
    formule: [
      $ I_"rect" = (b h^3) / 12 quad I_"carré" = b^4 / 12 $
      $ I_"flexion" = (pi D^4) / 64 quad I_0 = (pi D^4) / 32 $
    ],
    explication: [
      Rectangle et carré (flexion), disque plein en flexion, puis moment quadratique polaire
      du disque plein pour la torsion.
    ],
  ),

  // ======================= ENGRENAGES =======================
  (
    id: "EN-01",
    topic: "Denture droite : dimensions de la dent",
    included: true,
    formule: [
      $ p = pi m quad h_a = m $
      $ h_f = 1.25 m quad h = 2.25 m $
    ],
    explication: [
      $m$ : module (normalisé), $p$ : pas, $h_a$ : saillie, $h_f$ : creux, $h$ : hauteur de dent.
      Angle de pression $alpha = 20 degree$. Largeur de denture $b = k m$ avec $k = 8$ ou $10$.
    ],
  ),
  (
    id: "EN-02",
    topic: "Diamètres d'une roue",
    included: true,
    formule: [
      $ d = m dot Z $
      $ d_a = d + 2 m quad d_f = d - 2.5 m $
    ],
    explication: [
      Périmètre : $pi d = p Z$, donc $d = p Z slash pi = m Z$. $d_a$ : diamètre de tête,
      $d_f$ : diamètre de pied.
    ],
  ),
  (
    id: "EN-03",
    topic: "Entraxe et condition d'engrènement",
    included: true,
    formule: [
      $ a = (d_1 + d_2) / 2 = (m (Z_1 + Z_2)) / 2 $
    ],
    explication: [
      Deux roues engrènent si elles ont le même module. $a$ est la distance entre les axes des deux roues.
    ],
  ),
  (
    id: "EN-04",
    topic: "Rapport de réduction",
    included: true,
    formule: [
      $ r = omega_2 / omega_1 = theta_2 / theta_1 = r_1 / r_2 = d_1 / d_2 = Z_1 / Z_2 $
    ],
    explication: [
      Roulement sans glissement : $s_1 = r_1 theta_1 = s_2 = r_2 theta_2$. $r$ est le rapport de la vitesse
      de sortie sur la vitesse d'entrée.
    ],
  ),
  (
    id: "EN-05",
    topic: "Sens de rotation",
    included: true,
    formule: [
      $ "sens" = (-1)^alpha $
    ],
    explication: [
      $alpha$ : nombre de contacts extérieurs. Pair : $(-1)^alpha = 1$ (même sens). Impair : $-1$ (sens inversé).
      Denture extérieure : sens inversé. Denture intérieure : même sens.
    ],
  ),
  (
    id: "EN-06",
    topic: "Train d'engrenages",
    included: true,
    formule: [
      $ r = omega_4 / omega_1 = Z_1 / Z_2 dot.op Z_3 / Z_4 $
      $ r = (product Z_"menantes") / (product Z_"menées") $
    ],
    explication: [
      Le rapport de plusieurs étages est le produit des rapports : produit des dents des roues menantes
      sur produit des dents des roues menées.
    ],
  ),
  (
    id: "EN-07",
    topic: "Efforts sur la denture",
    included: true,
    formule: [
      $ F_(t 1) = (2 C) / d quad F_(r 1) = F_(t 1) tan alpha $
      $ F_1 = sqrt(F_(r 1)^2 + F_(t 1)^2) $
    ],
    explication: [
      L'action de la denture est inclinée de $alpha$. $F_t$ (tangentiel) transmet le couple, $F_r$ (radial)
      tend à écarter les roues et fléchit les arbres.
    ],
  ),
  (
    id: "EN-08",
    topic: "Couple, puissance, vitesse d'une roue",
    included: true,
    formule: [
      $ C_1 = F_(t 1) dot.op d_1 / 2 quad P_1 = C_1 dot.op omega_1 $
      $ omega_1 = (2 pi N_1) / 60 $
    ],
    explication: [
      $C$ en N·m, $P$ en W, $omega$ en rad/s, $N$ en tr/min.
    ],
  ),
  (
    id: "EN-09",
    topic: "Rendement et couple de sortie",
    included: true,
    formule: [
      $ C_s = eta / r dot.op C_e $
      $ eta = P_s / P_e = (C_s omega_s) / (C_e omega_e) $
    ],
    explication: [
      Avec $r = omega_s slash omega_e$. Rendements : denture droite 0,95 à 0,98, hélicoïdale 0,9 à 0,8,
      conique 0,6, roue et vis sans fin 0,5 à 0,15.
    ],
  ),
  (
    id: "EN-10",
    topic: "Denture hélicoïdale",
    included: true,
    formule: [
      $ p_n = p_t cos beta quad m_n = m_t cos beta $
      $ D = m_t Z = (m_n Z) / (cos beta) $
    ],
    explication: [
      $beta$ : angle d'hélice (20 à 30° en général), $m_n$ : module réel, $m_t$ : module apparent.
      Effort résultant : $bold(F) = bold(F)_t + bold(F)_a + bold(F)_r$, avec $F_a$ axial dû à $beta$.
    ],
  ),

  // ======================= ROULEMENTS =======================
  (
    id: "RL-01",
    topic: "Charge dynamique équivalente",
    included: true,
    formule: [
      $ P = X F_r + Y F_a $
    ],
    explication: [
      $X$ et $Y$ dépendent du type de roulement et du rapport $F_a slash F_r$. Rouleaux cylindriques :
      $P = F_r$. Butées : $P = F_a$. $P$, $F_r$, $F_a$ en N.
    ],
  ),
  (
    id: "RL-02",
    topic: "Choix de X et Y (courbe d'équidurée)",
    included: true,
    formule: [
      $ F_a / F_r <= e arrow.r.double P = F_r $
      $ F_a / F_r > e arrow.r.double P = X F_r + Y F_a $
    ],
    explication: [
      La courbe d'équidurée est approchée par deux droites. Le coefficient $e$ vérifie $tan beta = e$.
      $X$, $Y$ et $e$ sont dans le tableau du fabricant.
    ],
  ),
  (
    id: "RL-03",
    topic: "Durée de vie en millions de tours",
    included: true,
    formule: [
      $ L_(10) = (C / P)^n $
    ],
    explication: [
      Durée atteinte ou dépassée par 90 % des roulements. $C$ : charge dynamique de base
      (1 million de tours). $n = 3$ pour les billes, $n = 10 slash 3$ pour les rouleaux et aiguilles.
    ],
  ),
  (
    id: "RL-04",
    topic: "Durée de vie en heures",
    included: true,
    formule: [
      $ L_(10 h) = (10^6 / (60 N)) dot.op L_(10) $
    ],
    explication: [
      Si le roulement tourne à vitesse constante $N$ en tr/min, il est plus pratique d'exprimer
      la durée nominale en heures de fonctionnement.
    ],
  ),
  (
    id: "RL-05",
    topic: "Charge statique équivalente",
    included: true,
    formule: [
      $ P_0 = X_0 F_(r 0) + Y_0 F_(a 0) $
    ],
    explication: [
      Charge fictive qui provoque les mêmes déformations permanentes que la charge réelle (roulement à l'arrêt
      ou faibles oscillations). $C_0$ : charge statique de base (déformation de 1/10000 du diamètre de l'élément roulant).
    ],
  ),
  (
    id: "RL-06",
    topic: "Désignation d'un roulement",
    included: true,
    formule: [
      $ d = 5 times "code d'alésage" $
    ],
    explication: [
      Exemples : NU3 14 donne $14 times 5 = 70$ mm (rouleaux cylindriques). 302 08 donne $08 times 5 = 40$ mm
      (rouleaux coniques). Symbole complet : préfixe, code de série, code d'alésage, suffixe.
    ],
  ),
  (
    id: "RL-07",
    topic: "Palier lisse : pression de contact",
    included: true,
    formule: [
      $ p_0 = F_r / (d dot.op L) $
    ],
    explication: [
      Pression de contact projetée d'un palier (coussinet) : $F_r$ en N, $d$ et $L$ en mm,
      $p_0$ en MPa. Elle est limitée avec la vitesse de glissement $V_g$ et l'échauffement.
    ],
  ),
  (
    id: "RL-08",
    topic: "Roulements : quelle liaison ?",
    included: true,
    taille: 11pt,
    formule: [
      #set align(left)
      #set par(leading: 0.5em)
      Billes à contact radial : rotule ou linéaire annulaire \
      Billes à contact oblique : rotule (paire en O ou X) \
      Contact oblique 2 rangées : pivot \
      Rouleaux cylindriques : linéaire annulaire \
      Rouleaux coniques : rotule (paire en O ou X)
    ],
    explication: [
      Roulement fixe = rotule, roulement glissant = linéaire annulaire : $N_s = 3 + 2 = 5$, isostatique.
    ],
  ),
  (
    id: "RL-09",
    topic: "Ajustement des bagues",
    included: true,
    taille: 13pt,
    formule: [
      #set align(left)
      Bague *tournante* par rapport à la charge : montée *serrée* (évite le laminage)

      Bague *immobile* par rapport à la charge : peut être montée avec *jeu*
    ],
    explication: [
      Le serrage ne suffit pas pour les efforts axiaux : il faut des obstacles (épaulement, écrou à encoches,
      circlips, entretoise, chapeau). Une bague glissante demande deux obstacles.
    ],
  ),

  // ======================= CLAVETTES ET ASSEMBLAGES =======================
  (
    id: "CL-01",
    topic: "Effort tangentiel d'un accouplement",
    included: true,
    formule: [
      $ C = T dot.op D / 2 $
      $ T = (2 C) / D $
    ],
    explication: [
      Le couple $C$ à transmettre se traduit par un effort tangentiel $T$ à la surface de l'arbre
      de diamètre $D$.
    ],
  ),
  (
    id: "CL-02",
    topic: "Clavette : cisaillement",
    included: true,
    formule: [
      $ tau = T / S <= R_(p g) $
      $ S = b dot.op L $
    ],
    explication: [
      La section cisaillée de la clavette est de largeur $b$ par longueur $L$ (section rouge du cours de cisaillement).
      $R_(p g) = R_(e g) slash s$.
    ],
  ),
  (
    id: "CL-03",
    topic: "Couple transmissible (colle, soudure)",
    included: true,
    formule: [
      $ tau = T / S <= tau_"adm" $
      $ C <= 1 / 2 tau_"adm" dot.op D dot.op S $
    ],
    explication: [
      Avec $T = 2 C slash D$. Aire cisaillée : colle $S = pi D a$ ($a$ : longueur collée),
      cordon de soudure $S = pi D b$ ($b$ : dimension du cordon).
    ],
  ),
  (
    id: "CL-04",
    topic: "Application numérique : colle et soudure",
    included: true,
    formule: [
      $ C_"colle" <= 1 / 2 tau_c pi D a D approx 1131 "N.m" $
      $ C_"cordon" <= 1 / 2 tau_s pi D b D approx 1256.6 "N.m" $
    ],
    explication: [
      $D = 40$ mm, $a = 30$ mm, $b = 5$ mm, $tau_c = 15$ MPa (colle), $tau_s = 100$ MPa (soudure).
      Calcul en N·mm puis conversion en N·m.
    ],
  ),

  // ======================= COTATION =======================
  (
    id: "GP-01",
    topic: "Chaîne de cotes",
    included: true,
    formule: [
      $ J_"Amax" = A_"3max" - A_"1min" - A_"2min" $
      $ J_"Amin" = A_"3min" - A_"1max" - A_"2max" $
    ],
    explication: [
      Le jeu $J_A$ est la cote qui l'agrandit ($A_3$) moins les cotes qui le réduisent ($A_1$, $A_2$).
      Jeu maxi : maxi de $A_3$ et mini de $A_1$, $A_2$. Jeu mini : l'inverse.
    ],
  ),
)

// #flashcards(cards,black-and-white: true)
#flashcards(cards,black-and-white: false)
